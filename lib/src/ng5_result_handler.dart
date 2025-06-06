// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

typedef NameGetter = String? Function(int, dynamic)?;

extension on ng.NestedVector {
  ng.NestedVector getNestedVectors(int chunkIndex) {
    if (chunkIndex < 0 || chunkIndex >= nestedVectors.length) {
      throw Exception("无效的块索引: $chunkIndex");
    }
    return nestedVectors[chunkIndex];
  }
}

class HandlerParam {
  Uint8List vectorData;
  ValueMetaData m;
  int rowIndex;
  VectorWrapper vector;
  DataType type;
  List? parentVal;
  ValueMetaData? parent;
  NameGetter? nameGetter;
  HandlerParam({
    required this.vectorData,
    required this.m,
    required this.rowIndex,
    required this.vector,
    required this.type,
    this.parentVal,
    this.parent,
    this.nameGetter,
  });
}

typedef TypeHandler = dynamic Function(HandlerParam);

/// **值解析器类，用于解码二进制数据**
class Ng5ResultHandler {
  /// 图表模式
  final ng.ExecuteResponse rs;

  /// 单位掩码，用于位操作
  static const List<int> kOneBitmasks = [
    (1 << 0), // 0000 0001
    (1 << 1), // 0000 0010
    (1 << 2), // 0000 0100
    (1 << 3), // 0000 1000
    (1 << 4), // 0001 0000
    (1 << 5), // 0010 0000
    (1 << 6), // 0100 0000
    (1 << 7), // 1000 0000
  ];

  /// **构造函数**
  ///
  /// - `graphSchemas`: 图表模式
  /// - `timeZoneOffset`: 时区偏移量
  /// - `byteOrder`: 字节序
  Ng5ResultHandler(this.rs);

  /// 时区偏移量
  int? _timeZoneOffset;
  int get timeZoneOffset => _timeZoneOffset ??= rs.result.meta.timeZoneOffset;

  /// 字节序
  Endian? _byteOrder;
  Endian get byteOrder =>
      _byteOrder ??= rs.result.meta.isLittleEndian ? Endian.little : Endian.big;

  ResultGraphSchemas? _graphSchemas;
  ResultGraphSchemas get graphSchemas =>
      _graphSchemas ??= ResultGraphSchemas(rs.result.meta.graphSchema);

  ResultTable? _resultTable;
  ResultTable get resultTable => _resultTable ??= ResultTable(rs.result);
  ng.VectorResultTable get table => rs.result;

  Ng5ResultSet? _resultSet;
  Ng5ResultSet get resultSet => _resultSet ??= Ng5ResultSet();

  Ng5ResultSet toResultSet() {
    resultSet.code = rs.status.code.utf8String();
    resultSet.message = rs.status.message.utf8String();

    if (!resultSet.success) return resultSet;
    ValueMetaData meta = ValueMetaData()..type = GdbTypes.unknown;
    var rows = <List<dynamic>>[];
    var row = next(meta);
    while (row != null) {
      rows.add(row);
      row = next(meta);
    }
    resultSet.rows.addAll(rows);
    resultSet.metas.addAll(meta.submetas);
    return resultSet;
  }

  next(ValueMetaData meta) {
    var currentBatch = resultTable._currentBatch;
    if (currentBatch == null) {
      return null;
    }

    // 每个 VectorMetaData 具有相同的 numRecords 值，
    // 只需使用第一个来获取此批处理的 numRecord
    int currentBatchRowSize = 0;
    if (currentBatch.vectorsCount != 0) {
      currentBatchRowSize = currentBatch.batchRowSize;
    }
    // 当前批处理为空或已经完成批处理，跳转到下一个批处理
    if (currentBatch.vectorsCount == 0 ||
        resultTable._currentBatchRowIndex >= currentBatchRowSize) {
      resultTable._batchIndex++;
      if (resultTable._batchIndex >= resultTable._numBatches) {
        return null;
      }
      // 将 currentBatchRowIndex 重置为 0
      resultTable._currentBatchRowIndex = 0;
      // 获取下一个批处理
      resultTable._currentBatch = Batch(
        resultTable._resultTable!.batch[resultTable._batchIndex],
        byteOrder,
      );
    }

    // 解析当前批处理
    dynamic row = _getRowByIndex(resultTable._currentBatchRowIndex, meta);
    resultTable._currentBatchRowIndex++;
    return row;
  }

  List<dynamic> _getRowByIndex(int index, ValueMetaData meta) {
    List<dynamic> row = [];
    if (resultTable._currentBatch != null) {
      for (int i = 0; i < resultTable._currentBatch!.vectorsCount; i++) {
        ValueMetaData colMeta =
            meta.submetas.length > i ? meta.submetas[i] : ValueMetaData()
              ..name = resultTable._columnNames[i]
              ..type = getType(resultTable._columnDataTypes[i].type);
        dynamic value = decodeValueWrapper(
          resultTable._currentBatch!.getVectors(i),
          resultTable._columnDataTypes[i],
          index,
          colMeta,
        );
        meta.addSubmeta(colMeta, row, value);
      }
    }
    return row;
  }

  /// **解码值封装器**
  ///
  /// - `vector`: 向量封装器
  /// - `type`: 数据类型
  /// - `rowIndex`: 行索引
  /// - 返回: 解码后的值封装器
  dynamic decodeValueWrapper(
    VectorWrapper vector,
    DataType type,
    int rowIndex,
    ValueMetaData meta,
  ) {
    dynamic value = decodeValue(vector, type, rowIndex, meta);
    return value is AnyValue ? value.value : value;
  }

  /// **解码指定向量位置的二进制数据**
  ///
  /// - `vector`: 向量数据
  /// - `type`: 向量的数据类型
  /// - `rowIndex`: 需要解码的向量位置
  /// - 返回: 解码后的对象值
  dynamic decodeValue(
    VectorWrapper vector,
    DataType type,
    int rowIndex,
    ValueMetaData meta,
  ) {
    // 检查该索引处的值是否为 null
    if (!vector.isNullAllSet && vector.nullBitMap.utf8String().isNotEmpty) {
      int byteIndex = rowIndex ~/ 8;
      int bitIndex = rowIndex % 8;
      if ((vector.nullBitMap[byteIndex] & kOneBitmasks[bitIndex]) == 0) {
        return null;
      }
    }

    Object? value;
    switch (vector.vectorType) {
      case VectorType.flatVector:
        value = _handleValue(vector, type, rowIndex, meta);
        break;
      case VectorType.constVector:
        /*if (typeHandler.containsKey(type.type)) {
          value = typeHandler[type.type]!(
            HandlerParam(
              vectorData: vector.vectorData,
              m: meta,
              rowIndex: rowIndex,
              vector: vector,
              type: type,
            ),
          );
        } else */
        if (vector.constValue == null) {
          Uint8List vectorData = vector.vectorData;
          BytesReader reader = BytesReader(vectorData);
          Object? constValue = decodeConstValue(reader, type.type);
          vector.constValue = constValue;
        }
        value = vector.constValue;
        break;
      default:
        throw Exception("不支持的向量类型: ${vector.vectorType}");
    }
    return value;
  }

  Map<ColumnType, TypeHandler> get typeHandler => {
    ColumnType.columnTypeNode: _handleNode,
    ColumnType.columnTypeEdge: _handleEdge,
    ColumnType.columnTypeNull: _handleNull,
    ColumnType.columnTypeBool: _handleBool,
    ColumnType.columnTypeInt8: _handleInt8,
    ColumnType.columnTypeUint8: _handleUInt8,
    ColumnType.columnTypeInt16: _handleInt16,
    ColumnType.columnTypeUint16: _handleUInt16,
    ColumnType.columnTypeInt32: _handleInt32,
    ColumnType.columnTypeUint32: _handleUInt32,
    ColumnType.columnTypeInt64: _handleInt64,
    ColumnType.columnTypeUint64: _handleUInt64,
    ColumnType.columnTypeFloat32: _handleFloat32,
    ColumnType.columnTypeFloat64: _handleFloat64,
    ColumnType.columnTypeString: _handleString,
    ColumnType.columnTypeDate: _handleDate,
    ColumnType.columnTypeLocalTime: _handleLocalTime,
    ColumnType.columnTypeZonedTime: _handleZonedTime,
    ColumnType.columnTypeLocalDateTime: _handleLocalDateTime,
    ColumnType.columnTypeZonedDateTime: _handleZonedDateTime,
    ColumnType.columnTypeDuration: _handleDuration,
    ColumnType.columnTypeDecimal: _handleDecimal,
    ColumnType.columnTypeList: _handleList,
    ColumnType.columnTypeRecord: _handleRecord,
    ColumnType.columnTypePath: _handlePath,
    ColumnType.columnTypeAny: _handleAny,
    ColumnType.columnTypeEmbeddingVector: _handleEmbeddingVector,
    ColumnType.columnTypeReference: _handleReference,
    ColumnType.columnTypeInvalid: _handleInvalid,
  };

  _handleNode(HandlerParam p) {
    NodeType nodeType = p.type as NodeType;

    // nodePropColumnType: graphId -> (nodeTypeId -> (propName -> propType))
    Map<int, Map<int, Map<String, DataType>>> nodePropColumnType =
        nodeType.getNodeTypes();

    // nodePropVectorIndex: nodeTypeId -> (propName -> prop vector index)
    Map<int, Map<int, Map<String, int>>> nodePropVectorIndex = p.vector
        .getGraphElementTypeIdAndPropVectorIndexMap(
          SizeConstant.nodeTypeIdSize,
        );

    // 从节点头中解码节点的 nodeId 和 graphId
    Uint8List nodeHeaderBinary = getSubBytes(
      p.vectorData,
      SizeConstant.vectorNodeHeaderSize,
      p.rowIndex,
    );
    NodeHeader nodeHeader = NodeHeader(nodeHeaderBinary, byteOrder);

    // 从子向量解码记录节点的属性值
    if (!nodePropColumnType.containsKey(nodeHeader.graphId) ||
        !nodePropColumnType[nodeHeader.graphId]!.containsKey(
          nodeHeader.nodeTypeId,
        )) {
      throw Exception(
        "NODE 的值类型不包含 graphId ${nodeHeader.graphId} 或节点类型 ID ${nodeHeader.nodeTypeId}",
      );
    }

    Map<String, DataType> propTypeMap =
        nodePropColumnType[nodeHeader.graphId]![nodeHeader.nodeTypeId]!;
    var nodeData = <dynamic>[];
    ValueMetaData idMeta =
        ValueMetaData()
          ..name = MetaKey.nodeId
          ..type = GdbTypes.long;
    p.m.addSubmeta(idMeta, nodeData, nodeHeader.nodeId);

    ValueMetaData propMeta =
        ValueMetaData()
          ..name = nodeName(nodeHeader.graphId, nodeHeader.nodeTypeId)
          ..type = GdbTypes.prop;
    var propsData = <dynamic>[];
    p.m.addSubmeta(propMeta, nodeData, propsData);

    for (String propName in propTypeMap.keys) {
      int vectorIndex =
          nodePropVectorIndex[nodeHeader.graphId]![nodeHeader
              .nodeTypeId]![propName]!;
      Object? propValue = decodeValue(
        p.vector.getVectorWrapper(vectorIndex),
        propTypeMap[propName]!,
        p.rowIndex,
        p.m,
      );
      propMeta.addSubmeta(
        ValueMetaData()
          ..name = propName
          ..type = getType(propTypeMap[propName]!.type),
        propsData,
        propValue,
      );
    }
    return nodeData;
  }

  String? nodeName(int graphId, int typeId) {
    // 获取图表模式中的类型名称
    return graphSchemas.graphSchemaMap[graphId]
        ?.getNodeSchema(typeId)
        ?.nodeTypeName;
  }

  String? edgeName(int graphId, int typeId) {
    // 获取图表模式中的类型名称
    return graphSchemas.graphSchemaMap[graphId]
        ?.getEdgeSchema(typeId)
        ?.edgeTypeName;
  }

  _handleEdge(HandlerParam p) {
    EdgeType edgeType = p.type as EdgeType;

    // edgePropColumnType: graphId -> (edgeTypeId -> (propName -> propType))
    Map<int, Map<int, Map<String, DataType>>> edgePropColumnType =
        edgeType.getEdgeTypes();

    // edgePropVectorIndex: edgeTypeId -> (propName -> prop vector index)
    Map<int, Map<int, Map<String, int>>> edgePropVectorIndex = p.vector
        .getGraphElementTypeIdAndPropVectorIndexMap(
          SizeConstant.edgeTypeIdSize,
        );

    // 从边头中解码记录边的 edgeTypeId。
    // edgeTypeID+graphID+rank+dstID+srcID
    Uint8List edgeHeaderBinary = getSubBytes(
      p.vectorData,
      SizeConstant.vectorEdgeHeaderSize,
      p.rowIndex,
    );
    EdgeHeader edgeHeader = EdgeHeader(edgeHeaderBinary, byteOrder);

    // 从子向量解码记录边的属性值
    int noDirectedTypeId = edgeHeader.edgeTypeId & 0x3FFFFFFF;

    // 方向性，是否为正向
    var isForward = noDirectedTypeId == edgeHeader.edgeTypeId;

    if (!edgePropColumnType.containsKey(edgeHeader.graphId) ||
        !edgePropColumnType[edgeHeader.graphId]!.containsKey(
          noDirectedTypeId,
        )) {
      throw Exception(
        "NODE 的值类型不包含 graphId ${edgeHeader.graphId} 或边类型 ID $noDirectedTypeId",
      );
    }

    Map<String, DataType> edgePropTypeMap =
        edgePropColumnType[edgeHeader.graphId]![noDirectedTypeId]!;

    var edgeData = <dynamic>[];

    var srcId =
        isForward
            ? edgeHeader.srcId
            : edgeHeader.dstId; // 正向边的 srcId，反向边的 dstId
    var dstId =
        isForward
            ? edgeHeader.dstId
            : edgeHeader.srcId; // 正向边的 dstId，反向边的 srcId

    ValueMetaData srcIdMeta =
        ValueMetaData()
          ..name = MetaKey.startId
          ..type = GdbTypes.long;
    p.m.addSubmeta(srcIdMeta, edgeData, srcId);

    ValueMetaData idMeta =
        ValueMetaData()
          ..name = MetaKey.relationshipId
          ..type = GdbTypes.long;
    p.m.addSubmeta(idMeta, edgeData, edgeHeader.rank);

    ValueMetaData dstIdMeta =
        ValueMetaData()
          ..name = MetaKey.endId
          ..type = GdbTypes.long;
    p.m.addSubmeta(dstIdMeta, edgeData, dstId);

    ValueMetaData propMeta =
        ValueMetaData()
          ..name = edgeName(edgeHeader.graphId, noDirectedTypeId)
          ..type = GdbTypes.prop;
    var propsData = <dynamic>[];
    p.m.addSubmeta(propMeta, edgeData, propsData);

    for (String propName in edgePropTypeMap.keys) {
      int vectorIndex =
          edgePropVectorIndex[edgeHeader
              .graphId]![noDirectedTypeId]![propName]!;
      Object? propValue = decodeValue(
        p.vector.getVectorWrapper(vectorIndex),
        edgePropTypeMap[propName]!,
        p.rowIndex,
        p.m,
      );
      // edgeProps[propName] = ValueWrapper(
      //   propValue,
      //   edgePropTypeMap[propName]!.type,
      // );

      propMeta.addSubmeta(
        ValueMetaData()
          ..name = propName
          ..type = getType(edgePropTypeMap[propName]!.type),
        propsData,
        propValue,
      );
    }
    return edgeData;
    // Edge edgeValue = Edge(
    //   edgeHeader.graphId,
    //   edgeHeader.edgeTypeId,
    //   edgeHeader.rank,
    //   edgeHeader.srcId,
    //   edgeHeader.dstId,
    //   edgeProps,
    //   graphSchemas,
    // );
    // return edgeValue;
  }

  _handleNull(HandlerParam p) => null;
  _handleBool(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.boolSize,
      p.rowIndex,
    );
    return DecodeUtils.bytesToBool(valueData);
  }

  _handleInt8(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int8Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToInt8(valueData);
  }

  _handleUInt8(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int8Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToUInt8(valueData);
  }

  _handleInt16(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int16Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToInt16(valueData, byteOrder);
  }

  _handleUInt16(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int16Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToUInt16(valueData, byteOrder);
  }

  _handleInt32(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int32Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToInt32(valueData, byteOrder);
  }

  _handleUInt32(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int32Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToUInt32(valueData, byteOrder);
  }

  _handleInt64(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int64Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToInt64(valueData, byteOrder);
  }

  _handleUInt64(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.int64Size,
      p.rowIndex,
    );
    return DecodeUtils.bytesToInt64(valueData, byteOrder);
  }

  _handleFloat32(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.floatSize,
      p.rowIndex,
    );
    return DecodeUtils.bytesToFloat(valueData, byteOrder);
  }

  _handleFloat64(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.doubleSize,
      p.rowIndex,
    );
    return DecodeUtils.bytesToDouble(valueData, byteOrder);
  }

  _handleString(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.stringSize,
      p.rowIndex,
    );
    return bytesToString(valueData, p.vector.vector);
  }

  _handleDate(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.dateSize,
      p.rowIndex,
    );
    return bytesToDate(valueData);
  }

  _handleLocalTime(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.localTimeSize,
      p.rowIndex,
    );
    var lt = bytesToLocalTime(valueData);
    return DateTime(
      1970,
      1,
      1,
      lt.hour,
      lt.minute,
      lt.second + timeZoneOffset,
      0,
      lt.microsecond,
    );
  }

  _handleZonedTime(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.zonedTimeSize,
      p.rowIndex,
    );
    var zt = bytesToZonedTime(valueData);
    return zt;
  }

  _handleLocalDateTime(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.dateTimeSize,
      p.rowIndex,
    );
    return bytesToLocalDateTime(valueData);
  }

  _handleZonedDateTime(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.zonedDateTimeSize,
      p.rowIndex,
    );
    var zdt = bytesToZonedDateTime(valueData);
    return DateTime(
      zdt.year,
      zdt.month,
      zdt.day,
      zdt.hour,
      zdt.minute,
      zdt.second,
      zdt.millisecond,
      zdt.microsecond,
    ).toUtc().add(Duration(hours: timeZoneOffset));
  }

  _handleDuration(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.durationSize,
      p.rowIndex,
    );
    return bytesToDuration(valueData);
  }

  _handleDecimal(HandlerParam p) {
    var valueData = getSubBytes(
      p.vectorData,
      SizeConstant.stringSize,
      p.rowIndex,
    );
    return stringToDecimal(bytesToString(valueData, p.vector.vector));
  }

  _handleList(HandlerParam p) {
    // 获取列表元素的类型
    // ListType listType = p.m as ListType;
    List<dynamic> list = [];

    // 解析列表头：偏移量 + 列表大小
    Uint8List vectorData = p.vectorData;
    var valueData = getSubBytes(
      vectorData,
      SizeConstant.listHeaderSize,
      p.rowIndex,
    );
    ListHeader listHeader = ListHeader(valueData, byteOrder);

    for (int i = 0; i < listHeader.size; i++) {
      var elType = (p.type as ListType).valueType;
      var val = decodeValue(
        p.vector.getVectorWrapper(0),
        elType,
        listHeader.offset + i,
        p.m,
      );
      p.m.addSubmeta(
        ValueMetaData()
          ..type = getType(elType.type)
          ..name = 'item',
        list,
        val,
      );
    }
    return list;
  }

  _handleRecord(HandlerParam p) {
    Uint8List specialMetaData = p.vector.specialMetaData;
    RecordType recordType = p.type as RecordType;

    // 获取记录键的类型：字段名 -> 字段数据类型
    Map<String, DataType> fieldAndDataType = recordType.fieldTypes;

    var recordData = <dynamic>[];

    // 解析记录的每个字段
    BytesReader reader = BytesReader(specialMetaData);
    for (int i = 0; i < fieldAndDataType.length; i++) {
      String fieldName = reader.readSizedString(byteOrder);
      Object? value = decodeValue(
        p.vector.getVectorWrapper(i),
        fieldAndDataType[fieldName]!,
        p.rowIndex,
        p.m,
      );
      p.m.addSubmeta(
        ValueMetaData()
          ..name = fieldName
          ..type = getType(fieldAndDataType[fieldName]!.type),
        recordData,
        value,
      );
    }
    return recordData;
  }

  _handlePath(HandlerParam p) {
    PathType pathType = p.type as PathType;

    // 解码向量数据：路径头
    Uint8List pathHeaderBinary = getSubBytes(
      p.vectorData,
      SizeConstant.vectorPathHeaderSize,
      p.rowIndex,
    );
    PathHeader pathHeader = PathHeader(pathHeaderBinary, byteOrder);

    // 将特殊元数据解码为：
    PathSpecialMetaData pathSpecialMetaData = p.vector.pathSpecialMetaData;

    // graphId -> (NodeTypeId -> vecIndex), graphId -> (EdgeTypeId -> vecIndex)
    // Map<int, Map<int, int>> nodeTypes =
    //     pathSpecialMetaData.graphIdAndNodeTypes;
    // Map<int, Map<int, int>> edgeTypes =
    //     pathSpecialMetaData.graphIdAndEdgeTypes;

    // 构建映射：uint16 pair index -> (node vector, adj vector)
    Map<int, PathVectorPair> indexAndNodes = pathSpecialMetaData.indexAndNodes;

    // 构建映射：uint16 pair index -> (edge vector, adj vector)
    Map<int, PathVectorPair> indexAndEdges = pathSpecialMetaData.indexAndEdges;

    // 解码路径值
    List<ValueWrapper> elements = [];
    final DataType adjDataType = BasicType(ColumnType.columnTypeInt64);
    Object? firstNode;

    // 如果路径没有元素，返回空路径
    if (pathHeader.size <= 0) {
      return Path(elements);
    }

    // 解码路径的第一个节点
    PathVectorPair firstNodePair = indexAndNodes[pathHeader.headNodeIndex]!;
    VectorWrapper firstNodeVector = firstNodePair.vector;
    VectorWrapper firstNodeAdjVector = firstNodePair.adjVector;
    firstNode = decodeValue(
      firstNodeVector,
      pathType.dataTypes[0],
      pathHeader.headOffset,
      p.m,
    );
    elements.add(ValueWrapper(firstNode, ColumnType.columnTypeNode));

    PathAdjHeader pathAdjHeader = PathAdjHeader(
      ValueWrapper(
        decodeValue(
          firstNodeAdjVector,
          adjDataType,
          pathHeader.headOffset,
          p.m,
        ),
        adjDataType.type,
      ).asLong,
    );

    VectorWrapper? adjVector;
    while (!pathAdjHeader.isEnd) {
      int vecIndex = pathAdjHeader.vecIdxOfNextEle;
      int vecOffset = pathAdjHeader.offsetOfNextEle;

      if (pathAdjHeader.isNextEdge) {
        PathVectorPair edgeVectorPair = indexAndEdges[vecIndex]!;
        Object? edge = decodeValue(
          edgeVectorPair.vector,
          EdgeType(pathType.getEdgeTypes()),
          vecOffset,
          p.m,
        );
        adjVector = edgeVectorPair.adjVector;
        elements.add(ValueWrapper(edge, ColumnType.columnTypeEdge));

        // 更新邻接头
        pathAdjHeader = PathAdjHeader(
          ValueWrapper(
            decodeValue(adjVector, adjDataType, vecOffset, p.m),
            adjDataType.type,
          ).asLong,
        );
      } else {
        PathVectorPair nodeVectorPair = indexAndNodes[vecIndex]!;
        Object? node = decodeValue(
          nodeVectorPair.vector,
          NodeType(pathType.getNodeTypes()),
          vecOffset,
          p.m,
        );
        adjVector = nodeVectorPair.adjVector;
        elements.add(ValueWrapper(node, ColumnType.columnTypeNode));

        // 更新邻接头
        pathAdjHeader = PathAdjHeader(
          ValueWrapper(
            decodeValue(adjVector, adjDataType, vecOffset, p.m),
            adjDataType.type,
          ).asLong,
        );
      }
    }
    return Path(elements);
  }

  _handleAny(HandlerParam p) {
    var valueData = getSubBytes(
      p.vector.vectorData,
      SizeConstant.anyHeaderSize,
      p.rowIndex,
    );
    return bytesToAny(valueData, p.vector, p.rowIndex);
  }

  _handleEmbeddingVector(HandlerParam p) {
    EmbeddingVectorType vectorType = p.type as EmbeddingVectorType;
    int dim = vectorType.dim;
    var valueData = getSubBytes(
      p.vectorData,
      dim * SizeConstant.embeddingVectorFloatValueSize,
      p.rowIndex,
    );
    return bytesToEmbeddingVector(BytesReader(valueData), dim);
  }

  _handleReference(HandlerParam p) {}
  _handleInvalid(HandlerParam p) {
    throw Exception("不支持的类型: ${p.type}");
  }

  /// **解码平面向量中的二进制数据**
  ///
  /// - `vector`: 向量数据
  /// - `type`: 向量的数据类型
  /// - `rowIndex`: 需要解码的向量位置
  /// - 返回: 解码后的对象值
  Object? _handleValue(
    VectorWrapper vector,
    DataType type,
    int rowIndex,
    ValueMetaData meta, {
    ValueMetaData? parent,
    List? parentVal,
  }) {
    HandlerParam param = HandlerParam(
      vectorData: vector.vectorData,
      m: meta,
      rowIndex: rowIndex,
      vector: vector,
      type: type,
    );
    var val = typeHandler[type.type]?.call(param);
    parent?.addSubmeta(meta, parentVal, val);
    return val;
  }

  // ? 当前值需要结合父值进行解码
  /// **解码常量值**
  ///
  /// - `reader`: 字节读取器
  /// - `type`: 列类型
  /// - 返回: 解码后的对象值
  Object? decodeConstValue(BytesReader reader, ColumnType type) {
    Object? obj;
    if (type.isBasic()) {
      obj = bytesBasicToObject(reader, type);
    } else if (type == ColumnType.columnTypeString) {
      obj = reader.readSizedString(byteOrder);
    } else if (type == ColumnType.columnTypeDecimal) {
      obj = bytesToDecimal(reader);
    } else if (type.isComposite()) {
      obj = decodeCompositeValue(reader, type);
    } else if (type == ColumnType.columnTypeAny) {
      obj = bytesToConstAny(reader);
    } else {
      throw Exception("不支持的类型: $type");
    }
    return obj;
  }

  /// **获取子字节**
  ///
  /// - `vectorData`: 向量数据
  /// - `byteSize`: 字节大小
  /// - `rowIndex`: 行索引
  /// - 返回: 子字节数组
  Uint8List getSubBytes(Uint8List vectorData, int byteSize, int rowIndex) {
    int start = rowIndex * byteSize;
    int end = start + byteSize;
    return vectorData.sublist(start, end);
  }

  /// **从节点 ID 获取节点类型 ID**
  ///
  /// - `nodeId`: 节点 ID
  /// - 返回: 节点类型 ID
  int getNodeTypeIdFromNodeId(int nodeId) {
    return (nodeId >> 48);
  }

  /// **解码字符串向量二进制数据为字符串**
  ///
  /// - `stringHeader`: 二进制数据，即字符串的头部
  /// - `vector`: 字符串向量
  /// - 返回: 字符串值
  String bytesToString(Uint8List stringHeader, ng.NestedVector vector) {
    // 如果字符串小于 12 字节，则无需从块中获取数据，
    // 否则从块中获取数据，无需解码 4:8 的数据。
    int stringValueLength = DecodeUtils.bytesToInt32(
      stringHeader.sublist(0, SizeConstant.stringValueLengthSize),
      byteOrder,
    );

    if (stringValueLength <= SizeConstant.stringMaxValueLengthInHeader) {
      return stringHeader
          .sublist(
            SizeConstant.stringValueLengthSize,
            SizeConstant.stringValueLengthSize + stringValueLength,
          )
          .utf8String();
    }

    int chunkIndex = DecodeUtils.bytesToInt32(
      stringHeader.sublist(
        SizeConstant.chunkIndexStartPositionInStringHeader,
        SizeConstant.chunkIndexStartPositionInStringHeader +
            SizeConstant.chunkIndexLengthInStringHeader,
      ),
      byteOrder,
    );

    int chunkOffset = DecodeUtils.bytesToInt32(
      stringHeader.sublist(
        SizeConstant.chunkOffsetStartPositionInStringHeader,
        SizeConstant.chunkOffsetStartPositionInStringHeader +
            SizeConstant.chunkOffsetLengthInStringHeader,
      ),
      byteOrder,
    );

    ng.NestedVector stringChunkVector = vector.getNestedVectors(chunkIndex);
    Uint8List valueData = Uint8List.fromList(
      stringChunkVector.vectorData.sublist(
        chunkOffset,
        chunkOffset + stringValueLength,
      ),
    );

    return valueData.utf8String();
  }

  /// **解码二进制数据为日期**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 日期值
  DateTime bytesToDate(Uint8List data) {
    int year = DecodeUtils.bytesToUInt16(
      data.sublist(0, SizeConstant.yearSize),
      byteOrder,
    );
    int month = DecodeUtils.bytesToUInt8(
      data.sublist(
        SizeConstant.yearSize,
        SizeConstant.yearSize + SizeConstant.monthSize,
      ),
    );
    int day = DecodeUtils.bytesToUInt8(
      data.sublist(
        SizeConstant.yearSize + SizeConstant.monthSize,
        SizeConstant.yearSize + SizeConstant.monthSize + SizeConstant.daySize,
      ),
    );

    return DateTime(year, month, day);
  }

  /// **解码二进制数据为本地时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 本地时间值
  DateTime bytesToLocalTime(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int hour = buffer.getInt8(0);
    int minute = buffer.getInt8(1);
    int second = buffer.getInt8(2);
    // 跳过填充字节
    buffer.getInt8(3);
    int microsecond = buffer.getInt32(byteOrder == Endian.little ? 4 : 0);

    return DateTime(1970, 1, 1, hour, minute, second, microsecond);
  }

  /// **解码二进制数据为带时区的时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 带时区的时间值
  DateTime bytesToZonedTime(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int hour = buffer.getInt8(0);
    int currentOffset = timeZoneOffset;

    if (hour < 0) {
      hour = -hour;
    }

    int minute = buffer.getInt8(1);
    int second = buffer.getInt8(2);
    // 跳过填充字节
    buffer.getInt8(3);
    int microsecond = buffer.getInt32(byteOrder == Endian.little ? 4 : 0);
    var hourOffset = currentOffset ~/ 60;
    var minuteOffset = currentOffset % 60;
    hour += hourOffset;
    if (minuteOffset + minute > 59) {
      hour += 1;
      minuteOffset -= 60;
    }
    DateTime localUtcTime = DateTime.utc(
      1970,
      1,
      1,
      hour % 24,
      minute + currentOffset,
      second,
      microsecond,
    );
    return localUtcTime;
  }

  /// **解码二进制数据为本地日期时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 本地日期时间值
  DateTime bytesToLocalDateTime(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int qword = buffer.getInt64(0, byteOrder);

    final int year = (qword & 0xFFFF);
    qword = qword >> 16;
    final int month = (qword & 0xF);
    qword = qword >> 4;
    final int day = (qword & 0x1F);
    qword = qword >> 5;
    final int hour = (qword & 0x1F);
    qword = qword >> 5;
    final int minute = (qword & 0x3F);
    qword = qword >> 6;
    final int second = (qword & 0x3F);
    qword = qword >> 6;
    final int microsecond = (qword & 0x3FFFFF);

    return DateTime(year, month, day, hour, minute, second, microsecond);
  }

  /// **解码二进制数据为带时区的日期时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 带时区的日期时间值
  DateTime bytesToZonedDateTime(Uint8List data) {
    DateTime localDateTime = bytesToLocalDateTime(
      data,
    ).add(Duration(minutes: timeZoneOffset));
    localDateTime = localDateTime.add(localDateTime.timeZoneOffset);
    return DateTime.utc(
      localDateTime.year,
      localDateTime.month,
      localDateTime.day,
      localDateTime.hour,
      localDateTime.minute,
      localDateTime.second,
      localDateTime.millisecond,
      localDateTime.microsecond,
    );
  }

  /// **解码二进制数据为持续时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 持续时间值
  NDuration bytesToDuration(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int qword = buffer.getInt64(0, byteOrder);

    bool isMonthBased = (qword & 0x1) == 1;
    int durationValue = qword >> 1;

    int year = 0;
    int month = 0;
    int day = 0;
    int hour = 0;
    int minute = 0;
    int second = 0;
    int microSec = 0;

    if (isMonthBased) {
      year = (durationValue ~/ 12);
      month = (durationValue % 12);
    } else {
      day = (durationValue ~/ SizeConstant.microSecondsOfDay);
      hour =
          ((durationValue % SizeConstant.microSecondsOfDay) ~/
              SizeConstant.microSecondsOfHour);
      minute =
          ((durationValue % SizeConstant.microSecondsOfHour) ~/
              SizeConstant.microSecondsOfMinute);
      second =
          ((durationValue % SizeConstant.microSecondsOfMinute) ~/
              SizeConstant.microSecondsOfSecond);
      microSec = (durationValue % SizeConstant.microSecondsOfSecond);
    }

    return NDuration(
      isMonthBased,
      year,
      month,
      day,
      hour,
      minute,
      second,
      microSec,
    );
  }

  /// **解码二进制数据为嵌入向量**
  ///
  /// - `reader`: 字节读取器
  /// - `dim`: 维度
  /// - 返回: 嵌入向量
  EmbeddingVector bytesToEmbeddingVector(BytesReader reader, int dim) {
    List<double> vector = [];
    for (int i = 0; i < dim; i++) {
      vector.add(
        DecodeUtils.bytesToFloat(
          reader.read(SizeConstant.floatSize),
          byteOrder,
        ),
      );
    }
    return EmbeddingVector(dim, vector);
  }

  /// **解码二进制数据为任意对象**
  ///
  /// - `value`: 二进制数据
  /// - `vector`: 向量封装器
  /// - `rowIndex`: 行索引
  /// - 返回: 任意值
  AnyValue bytesToAny(Uint8List value, VectorWrapper vector, int rowIndex) {
    VectorWrapper dataTypeVector = vector.getVectorWrapper(0);
    ColumnType valueType = ColumnType.getColumnType(
      DecodeUtils.bytesToInt8(
        getSubBytes(
          dataTypeVector.vectorData,
          SizeConstant.valueTypeSize,
          rowIndex,
        ),
      ),
    );

    AnyHeader anyHeader = AnyHeader(value, valueType, byteOrder);
    Object? obj;

    if (valueType.isBasic()) {
      BytesReader basicReader = BytesReader(value);
      obj = bytesBasicToObject(basicReader, valueType);
    }

    if (valueType == ColumnType.columnTypeString ||
        valueType == ColumnType.columnTypeDecimal) {
      VectorWrapper stringVec = vector.getVectorWrapper(anyHeader.chunkIndex);
      obj = DecodeUtils.bytesToSizedString(
        stringVec.vectorData,
        anyHeader.offset,
        byteOrder,
      );
    }

    if (valueType.isComposite()) {
      VectorWrapper subVector = vector.getVectorWrapper(anyHeader.chunkIndex);
      BytesReader reader = BytesReader(
        subVector.vectorData.sublist(anyHeader.offset),
      );
      obj = decodeCompositeValue(reader, valueType);
    }

    return AnyValue(obj, valueType);
  }

  /// **解码常量向量为任意对象**
  ///
  /// - `reader`: 任意向量数据的字节读取器
  /// - 返回: 值封装器
  AnyValue bytesToConstAny(BytesReader reader) {
    ColumnType columnType = ColumnType.getColumnType(
      DecodeUtils.bytesToUInt8(reader.read(SizeConstant.valueTypeSize)),
    );
    Object? obj;

    if (columnType.isBasic()) {
      obj = bytesBasicToObject(reader, columnType);
    } else if (columnType == ColumnType.columnTypeString) {
      obj = reader.readSizedString(byteOrder);
    } else if (columnType == ColumnType.columnTypeDecimal) {
      obj = bytesToDecimal(reader);
    } else if (columnType.isComposite()) {
      obj = decodeCompositeValue(reader, columnType);
    } else {
      throw Exception("不支持的类型: $columnType");
    }

    return AnyValue(obj, columnType);
  }

  /// **将字节转换为基本对象**
  ///
  /// - `reader`: 字节读取器
  /// - `type`: 列类型
  /// - 返回: 对象
  Object? bytesBasicToObject(BytesReader reader, ColumnType type) {
    Object? obj;

    switch (type) {
      case ColumnType.columnTypeNull:
        break;
      case ColumnType.columnTypeBool:
        obj = DecodeUtils.bytesToBool(reader.read(SizeConstant.boolSize));
        break;
      case ColumnType.columnTypeInt8:
        obj = DecodeUtils.bytesToInt8(reader.read(SizeConstant.int8Size));
        break;
      case ColumnType.columnTypeUint8:
        obj = DecodeUtils.bytesToUInt8(reader.read(SizeConstant.int8Size));
        break;
      case ColumnType.columnTypeInt16:
        obj = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.int16Size),
          byteOrder,
        );
        break;
      case ColumnType.columnTypeUint16:
        obj = DecodeUtils.bytesToUInt16(
          reader.read(SizeConstant.int16Size),
          byteOrder,
        );
        break;
      case ColumnType.columnTypeInt32:
      case ColumnType.columnTypeUint32:
        obj = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.int32Size),
          byteOrder,
        );
        break;
      case ColumnType.columnTypeInt64:
      case ColumnType.columnTypeUint64:
        obj = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.int64Size),
          byteOrder,
        );
        break;
      case ColumnType.columnTypeFloat32:
        obj = DecodeUtils.bytesToFloat(
          reader.read(SizeConstant.floatSize),
          byteOrder,
        );
        break;
      case ColumnType.columnTypeFloat64:
        obj = DecodeUtils.bytesToDouble(
          reader.read(SizeConstant.doubleSize),
          byteOrder,
        );
        break;
      case ColumnType.columnTypeDate:
        obj = bytesToDate(reader.read(SizeConstant.dateSize));
        break;
      case ColumnType.columnTypeLocalTime:
        obj = bytesToLocalTime(reader.read(SizeConstant.localTimeSize));
        break;
      case ColumnType.columnTypeZonedTime:
        obj = bytesToZonedTime(reader.read(SizeConstant.zonedTimeSize));
        break;
      case ColumnType.columnTypeLocalDateTime:
        obj = bytesToLocalDateTime(reader.read(SizeConstant.dateTimeSize));
        break;
      case ColumnType.columnTypeZonedDateTime:
        obj = bytesToZonedDateTime(reader.read(SizeConstant.zonedDateTimeSize));
        break;
      case ColumnType.columnTypeDuration:
        obj = bytesToDuration(reader.read(SizeConstant.durationSize));
        break;
      default:
        throw Exception("类型不是基本类型: $type");
    }

    return obj;
  }

  /// **解码二进制为 Decimal 对象**
  ///
  /// - `reader`: 带游标的二进制读取器
  /// - 返回: 对象
  /// - 抛出: 如果 decimal 是 Infinity 或 NaN，则抛出 NumberFormatException
  Object? bytesToDecimal(BytesReader reader) {
    String decimalStr = reader.readSizedString(byteOrder);
    return stringToDecimal(decimalStr);
  }

  /// **将字符串转换为十进制数**
  ///
  /// - `decimalStr`: 十进制字符串值
  /// - 返回: 对象
  /// - 抛出: 如果 decimal 是 Infinity 或 NaN，则抛出 NumberFormatException
  Object? stringToDecimal(String decimalStr) {
    if (decimalStr == "NaN" || decimalStr == "+Inf" || decimalStr == "-Inf") {
      throw FormatException("无效的十进制值: $decimalStr");
    }
    return Decimal.parse(decimalStr);
  }

  /// **为复合类型解码二进制为对象**
  ///
  /// - `reader`: 带游标的二进制读取器
  /// - `type`: 元素的列类型
  /// - 返回: 值对象
  Object? decodeCompositeValue(BytesReader reader, ColumnType type) {
    switch (type) {
      case ColumnType.columnTypeNull:
        return null;
      case ColumnType.columnTypeBool:
        return DecodeUtils.bytesToBool(reader.read(SizeConstant.boolSize));
      case ColumnType.columnTypeInt8:
        return DecodeUtils.bytesToInt8(reader.read(SizeConstant.int8Size));
      case ColumnType.columnTypeUint8:
        return DecodeUtils.bytesToUInt8(reader.read(SizeConstant.int8Size));
      case ColumnType.columnTypeInt16:
        return DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.int16Size),
          byteOrder,
        );
      case ColumnType.columnTypeUint16:
        return DecodeUtils.bytesToUInt16(
          reader.read(SizeConstant.int16Size),
          byteOrder,
        );
      case ColumnType.columnTypeInt32:
      case ColumnType.columnTypeUint32:
        return DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.int32Size),
          byteOrder,
        );
      case ColumnType.columnTypeInt64:
      case ColumnType.columnTypeUint64:
        return DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.int64Size),
          byteOrder,
        );
      case ColumnType.columnTypeFloat32:
        return DecodeUtils.bytesToFloat(
          reader.read(SizeConstant.floatSize),
          byteOrder,
        );
      case ColumnType.columnTypeFloat64:
        return DecodeUtils.bytesToDouble(
          reader.read(SizeConstant.doubleSize),
          byteOrder,
        );
      case ColumnType.columnTypeDate:
        return bytesToDate(reader.read(SizeConstant.dateSize));
      case ColumnType.columnTypeLocalDateTime:
        return bytesToLocalDateTime(reader.read(SizeConstant.dateTimeSize));
      case ColumnType.columnTypeZonedDateTime:
        return bytesToZonedDateTime(
          reader.read(SizeConstant.zonedDateTimeSize),
        );
      case ColumnType.columnTypeLocalTime:
        return bytesToLocalTime(reader.read(SizeConstant.localTimeSize));
      case ColumnType.columnTypeZonedTime:
        return bytesToZonedTime(reader.read(SizeConstant.zonedTimeSize));
      case ColumnType.columnTypeDuration:
        return bytesToDuration(reader.read(SizeConstant.durationSize));
      case ColumnType.columnTypeDecimal:
        return Decimal.parse(reader.readSizedString(byteOrder));
      case ColumnType.columnTypeString:
        return reader.readSizedString(byteOrder);
      case ColumnType.columnTypeList:
        ColumnType eleType = ColumnType.getColumnType(
          DecodeUtils.bytesToInt8(reader.read(SizeConstant.valueTypeSize)),
        );
        int listSize = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          byteOrder,
        );
        int nullBitSize =
            (listSize % 8 == 0) ? (listSize ~/ 8) : (listSize ~/ 8 + 1);
        Uint8List nullBitBytes = reader.read(nullBitSize);
        List<ValueWrapper> values = [];

        for (int i = 0; i < listSize; i++) {
          if ((nullBitBytes[i ~/ 8] & (1 << (i % 8))) == 0) {
            values.add(ValueWrapper(null, ColumnType.columnTypeNull));
          } else {
            values.add(
              ValueWrapper(decodeCompositeValue(reader, eleType), eleType),
            );
          }
        }
        return values;
      case ColumnType.columnTypeRecord:
        int recordSize = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          byteOrder,
        );
        Map<String, ValueWrapper> map = {};

        for (int i = 0; i < recordSize; i++) {
          String fieldName = reader.readSizedString(byteOrder);
          ColumnType fieldType = ColumnType.getColumnType(
            DecodeUtils.bytesToUInt8(reader.read(SizeConstant.valueTypeSize)),
          );
          Object? fieldValue = decodeCompositeValue(reader, fieldType);
          map[fieldName] = ValueWrapper(fieldValue, fieldType);
        }
        return NRecord(map);
      case ColumnType.columnTypeNode:
        // nodeID 8B + graphId 4B + prop_Size 2B
        int nodeId = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.nodeIdSize),
          byteOrder,
        );
        int nodeTypeId = getNodeTypeIdFromNodeId(nodeId);
        int nodeGraphId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.graphIdSize),
          byteOrder,
        );
        int nodePropNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          byteOrder,
        );
        Map<String, ValueWrapper> nodeProperties = {};

        for (int i = 0; i < nodePropNum; i++) {
          String propName = reader.readSizedString(byteOrder);
          ColumnType propType = ColumnType.getColumnType(
            DecodeUtils.bytesToUInt8(reader.read(SizeConstant.valueTypeSize)),
          );
          Object? propValue = decodeCompositeValue(reader, propType);
          nodeProperties[propName] = ValueWrapper(propValue, propType);
        }
        return Node(
          nodeGraphId,
          nodeTypeId,
          nodeId,
          nodeProperties,
          graphSchemas,
        );
      case ColumnType.columnTypeEdge:
        // srcNodeID 8B+dstNodeID 8B+edgeRank 8B+graphId 4B+edgeTypeID 4B+prop_size 2B
        int srcNodeId = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.nodeIdSize),
          byteOrder,
        );
        int dstNodeId = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.nodeIdSize),
          byteOrder,
        );
        int rank = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.rankSize),
          byteOrder,
        );
        int edgeGraphId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.graphIdSize),
          byteOrder,
        );
        int edgeTypeId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.edgeTypeIdSize),
          byteOrder,
        );
        int edgePropNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          byteOrder,
        );
        Map<String, ValueWrapper> edgeProperties = {};

        for (int i = 0; i < edgePropNum; i++) {
          String propName = reader.readSizedString(byteOrder);
          ColumnType propType = ColumnType.getColumnType(
            DecodeUtils.bytesToUInt8(reader.read(SizeConstant.valueTypeSize)),
          );
          Object? propValue = decodeCompositeValue(reader, propType);
          edgeProperties[propName] = ValueWrapper(propValue, propType);
        }
        return Edge(
          edgeGraphId,
          edgeTypeId,
          rank,
          srcNodeId,
          dstNodeId,
          edgeProperties,
          graphSchemas,
        );
      case ColumnType.columnTypePath:
        int elementNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          byteOrder,
        );
        List<ValueWrapper> eleValues = [];

        for (int i = 0; i < elementNum; i++) {
          ColumnType elementType = ColumnType.getColumnType(
            DecodeUtils.bytesToUInt8(reader.read(SizeConstant.valueTypeSize)),
          );
          Object? element = decodeCompositeValue(reader, elementType);
          eleValues.add(ValueWrapper(element, elementType));
        }
        return Path(eleValues);
      case ColumnType.columnTypeEmbeddingVector:
        int vectorEleNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForVectorValue),
          byteOrder,
        );
        return bytesToEmbeddingVector(reader, vectorEleNum);
      default:
        throw Exception("不支持的类型: $type");
    }
  }
}

GdbTypes getType(ColumnType columnType) {
  switch (columnType) {
    case ColumnType.columnTypeAny:
      return GdbTypes.unknown;
    case ColumnType.columnTypeBool:
      return GdbTypes.bool;
    case ColumnType.columnTypeInt8:
      return GdbTypes.int;
    case ColumnType.columnTypeInt16:
      return GdbTypes.int;
    case ColumnType.columnTypeInt32:
      return GdbTypes.int;
    case ColumnType.columnTypeInt64:
      return GdbTypes.long;
    case ColumnType.columnTypeFloat32:
      return GdbTypes.float;
    case ColumnType.columnTypeFloat64:
      return GdbTypes.double;
    case ColumnType.columnTypeString:
      return GdbTypes.string;
    case ColumnType.columnTypeDate:
      return GdbTypes.date;
    case ColumnType.columnTypeLocalTime:
      return GdbTypes.time;
    case ColumnType.columnTypeZonedTime:
      return GdbTypes.zonedTime;
    case ColumnType.columnTypeLocalDateTime:
      return GdbTypes.dateTime;
    case ColumnType.columnTypeZonedDateTime:
      return GdbTypes.zonedDateTime;
    case ColumnType.columnTypeDecimal:
      return GdbTypes.decimal;
    case ColumnType.columnTypeEdge:
      return GdbTypes.relationship;
    case ColumnType.columnTypeNode:
      return GdbTypes.node;
    case ColumnType.columnTypePath:
      return GdbTypes.path;
    case ColumnType.columnTypeList:
      return GdbTypes.list;
    case ColumnType.columnTypeRecord:
      return GdbTypes.map;
    default:
      return GdbTypes.unknown;
  }
}
