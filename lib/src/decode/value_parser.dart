// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **值解析器类，用于解码二进制数据**
class ValueParser {
  /// 图表模式
  final ResultGraphSchemas _graphSchemas;

  /// 时区偏移量
  final int _timeZoneOffset;

  /// 字节序
  final Endian _byteOrder;

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
  ValueParser(this._graphSchemas, this._timeZoneOffset, this._byteOrder);

  /// **解码值封装器**
  ///
  /// - `vector`: 向量封装器
  /// - `type`: 数据类型
  /// - `rowIndex`: 行索引
  /// - 返回: 解码后的值封装器
  ValueWrapper decodeValueWrapper(
    VectorWrapper vector,
    DataType type,
    int rowIndex,
  ) {
    dynamic value = decodeValue(vector, type, rowIndex);
    if (type.type == ColumnType.columnTypeAny) {
      AnyValue? anyValue = value as AnyValue?;
      if (value == null) {
        return ValueWrapper(null, type.type);
      } else {
        return ValueWrapper(anyValue?.value, anyValue!.type);
      }
    } else {
      return ValueWrapper(value, type.type);
    }
  }

  /// **解码指定向量位置的二进制数据**
  ///
  /// - `vector`: 向量数据
  /// - `type`: 向量的数据类型
  /// - `rowIndex`: 需要解码的向量位置
  /// - 返回: 解码后的对象值
  dynamic decodeValue(VectorWrapper vector, DataType type, int rowIndex) {
    // 检查该索引处的值是否为 null
    if (!vector.isNullAllSet && utf8.decode(vector.nullBitMap).isNotEmpty) {
      int byteIndex = rowIndex ~/ 8;
      int bitIndex = rowIndex % 8;
      if ((vector.nullBitMap[byteIndex] & kOneBitmasks[bitIndex]) == 0) {
        return null;
      }
    }

    Object? value;
    switch (vector.vectorType) {
      case VectorType.flatVector:
        value = decodeFlatValue(vector, type, rowIndex);
        break;
      case VectorType.constVector:
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

  /// **解码平面向量中的二进制数据**
  ///
  /// - `vector`: 向量数据
  /// - `type`: 向量的数据类型
  /// - `rowIndex`: 需要解码的向量位置
  /// - 返回: 解码后的对象值
  Object? decodeFlatValue(VectorWrapper vector, DataType type, int rowIndex) {
    Uint8List vectorData = vector.vectorData;
    Uint8List valueData;

    switch (type.type) {
      case ColumnType.columnTypeNull:
        return null;
      case ColumnType.columnTypeInt8:
        valueData = getSubBytes(vectorData, SizeConstant.int8Size, rowIndex);
        return DecodeUtils.bytesToInt8(valueData);
      case ColumnType.columnTypeUint8:
        valueData = getSubBytes(vectorData, SizeConstant.int8Size, rowIndex);
        return DecodeUtils.bytesToUInt8(valueData);
      case ColumnType.columnTypeInt16:
        valueData = getSubBytes(vectorData, SizeConstant.int16Size, rowIndex);
        return DecodeUtils.bytesToInt16(valueData, _byteOrder);
      case ColumnType.columnTypeUint16:
        valueData = getSubBytes(vectorData, SizeConstant.int16Size, rowIndex);
        return DecodeUtils.bytesToUInt16(valueData, _byteOrder);
      case ColumnType.columnTypeInt32:
      case ColumnType.columnTypeUint32:
        valueData = getSubBytes(vectorData, SizeConstant.int32Size, rowIndex);
        return DecodeUtils.bytesToInt32(valueData, _byteOrder);
      case ColumnType.columnTypeInt64:
      case ColumnType.columnTypeUint64:
        valueData = getSubBytes(vectorData, SizeConstant.int64Size, rowIndex);
        return DecodeUtils.bytesToInt64(valueData, _byteOrder);
      case ColumnType.columnTypeFloat32:
        valueData = getSubBytes(vectorData, SizeConstant.floatSize, rowIndex);
        return DecodeUtils.bytesToFloat(valueData, _byteOrder);
      case ColumnType.columnTypeFloat64:
        valueData = getSubBytes(vectorData, SizeConstant.doubleSize, rowIndex);
        return DecodeUtils.bytesToDouble(valueData, _byteOrder);
      case ColumnType.columnTypeBool:
        valueData = getSubBytes(vectorData, SizeConstant.boolSize, rowIndex);
        return DecodeUtils.bytesToBool(valueData);
      case ColumnType.columnTypeDecimal:
        valueData = getSubBytes(vectorData, SizeConstant.stringSize, rowIndex);
        return stringToDecimal(bytesToString(valueData, vector.vector));
      case ColumnType.columnTypeString:
        valueData = getSubBytes(vectorData, SizeConstant.stringSize, rowIndex);
        return bytesToString(valueData, vector.vector);
      case ColumnType.columnTypeDate:
        valueData = getSubBytes(vectorData, SizeConstant.dateSize, rowIndex);
        return bytesToDate(valueData);
      case ColumnType.columnTypeLocalTime:
        valueData = getSubBytes(
          vectorData,
          SizeConstant.localTimeSize,
          rowIndex,
        );
        return bytesToLocalTime(valueData);
      case ColumnType.columnTypeZonedTime:
        valueData = getSubBytes(
          vectorData,
          SizeConstant.zonedTimeSize,
          rowIndex,
        );
        return bytesToZonedTime(valueData);
      case ColumnType.columnTypeLocalDateTime:
        valueData = getSubBytes(
          vectorData,
          SizeConstant.dateTimeSize,
          rowIndex,
        );
        return bytesToLocalDateTime(valueData);
      case ColumnType.columnTypeZonedDateTime:
        valueData = getSubBytes(
          vectorData,
          SizeConstant.zonedDateTimeSize,
          rowIndex,
        );
        return bytesToZonedDateTime(valueData);
      case ColumnType.columnTypeDuration:
        valueData = getSubBytes(
          vectorData,
          SizeConstant.durationSize,
          rowIndex,
        );
        return bytesToDuration(valueData);
      case ColumnType.columnTypeList:
        // 获取列表元素的类型
        ListType listType = type as ListType;
        List<ValueWrapper> list = [];

        // 解析列表头：偏移量 + 列表大小
        valueData = getSubBytes(
          vectorData,
          SizeConstant.listHeaderSize,
          rowIndex,
        );
        ListHeader listHeader = ListHeader(valueData, _byteOrder);

        for (int i = 0; i < listHeader.size; i++) {
          list.add(
            ValueWrapper(
              decodeValue(
                vector.getVectorWrapper(0),
                listType.valueType,
                listHeader.offset + i,
              ),
              listType.valueType.type,
            ),
          );
        }
        return list;
      case ColumnType.columnTypeRecord:
        Uint8List specialMetaData = vector.specialMetaData;
        RecordType recordType = type as RecordType;

        // 获取记录键的类型：字段名 -> 字段数据类型
        Map<String, DataType> fieldAndDataType = recordType.fieldTypes;
        Map<String, ValueWrapper> map = {};

        // 解析记录的每个字段
        BytesReader reader = BytesReader(specialMetaData);
        for (int i = 0; i < fieldAndDataType.length; i++) {
          String fieldName = reader.readSizedString(_byteOrder);
          Object? value = decodeValue(
            vector.getVectorWrapper(i),
            fieldAndDataType[fieldName]!,
            rowIndex,
          );
          map[fieldName] = ValueWrapper(
            value,
            fieldAndDataType[fieldName]!.type,
          );
        }
        return NRecord(map);
      case ColumnType.columnTypeNode:
        NodeType nodeType = type as NodeType;

        // nodePropColumnType: graphId -> (nodeTypeId -> (propName -> propType))
        Map<int, Map<int, Map<String, DataType>>> nodePropColumnType =
            nodeType.getNodeTypes();

        // nodePropVectorIndex: nodeTypeId -> (propName -> prop vector index)
        Map<int, Map<int, Map<String, int>>> nodePropVectorIndex = vector
            .getGraphElementTypeIdAndPropVectorIndexMap(
              SizeConstant.nodeTypeIdSize,
            );

        // 从节点头中解码节点的 nodeId 和 graphId
        Uint8List nodeHeaderBinary = getSubBytes(
          vectorData,
          SizeConstant.vectorNodeHeaderSize,
          rowIndex,
        );
        NodeHeader nodeHeader = NodeHeader(nodeHeaderBinary, _byteOrder);

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
        Map<String, ValueWrapper> props = {};

        for (String propName in propTypeMap.keys) {
          int vectorIndex =
              nodePropVectorIndex[nodeHeader.graphId]![nodeHeader
                  .nodeTypeId]![propName]!;
          Object? propValue = decodeValue(
            vector.getVectorWrapper(vectorIndex),
            propTypeMap[propName]!,
            rowIndex,
          );
          props[propName] = ValueWrapper(
            propValue,
            propTypeMap[propName]!.type,
          );
        }

        return Node(
          nodeHeader.graphId,
          nodeHeader.nodeTypeId,
          nodeHeader.nodeId,
          props,
          _graphSchemas,
        );
      case ColumnType.columnTypeEdge:
        EdgeType edgeType = type as EdgeType;

        // edgePropColumnType: graphId -> (edgeTypeId -> (propName -> propType))
        Map<int, Map<int, Map<String, DataType>>> edgePropColumnType =
            edgeType.getEdgeTypes();

        // edgePropVectorIndex: edgeTypeId -> (propName -> prop vector index)
        Map<int, Map<int, Map<String, int>>> edgePropVectorIndex = vector
            .getGraphElementTypeIdAndPropVectorIndexMap(
              SizeConstant.edgeTypeIdSize,
            );

        // 从边头中解码记录边的 edgeTypeId。
        // edgeTypeID+graphID+rank+dstID+srcID
        Uint8List edgeHeaderBinary = getSubBytes(
          vectorData,
          SizeConstant.vectorEdgeHeaderSize,
          rowIndex,
        );
        EdgeHeader edgeHeader = EdgeHeader(edgeHeaderBinary, _byteOrder);

        // 从子向量解码记录边的属性值
        int noDirectedTypeId = edgeHeader.edgeTypeId & 0x3FFFFFFF;
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
        Map<String, ValueWrapper> edgeProps = {};

        for (String propName in edgePropTypeMap.keys) {
          int vectorIndex =
              edgePropVectorIndex[edgeHeader
                  .graphId]![noDirectedTypeId]![propName]!;
          Object? propValue = decodeValue(
            vector.getVectorWrapper(vectorIndex),
            edgePropTypeMap[propName]!,
            rowIndex,
          );
          edgeProps[propName] = ValueWrapper(
            propValue,
            edgePropTypeMap[propName]!.type,
          );
        }

        Edge edgeValue = Edge(
          edgeHeader.graphId,
          edgeHeader.edgeTypeId,
          edgeHeader.rank,
          edgeHeader.srcId,
          edgeHeader.dstId,
          edgeProps,
          _graphSchemas,
        );
        return edgeValue;
      case ColumnType.columnTypePath:
        PathType pathType = type as PathType;

        // 解码向量数据：路径头
        Uint8List pathHeaderBinary = getSubBytes(
          vectorData,
          SizeConstant.vectorPathHeaderSize,
          rowIndex,
        );
        PathHeader pathHeader = PathHeader(pathHeaderBinary, _byteOrder);

        // 将特殊元数据解码为：
        PathSpecialMetaData pathSpecialMetaData = vector.pathSpecialMetaData;

        // graphId -> (NodeTypeId -> vecIndex), graphId -> (EdgeTypeId -> vecIndex)
        // Map<int, Map<int, int>> nodeTypes =
        //     pathSpecialMetaData.graphIdAndNodeTypes;
        // Map<int, Map<int, int>> edgeTypes =
        //     pathSpecialMetaData.graphIdAndEdgeTypes;

        // 构建映射：uint16 pair index -> (node vector, adj vector)
        Map<int, PathVectorPair> indexAndNodes =
            pathSpecialMetaData.indexAndNodes;

        // 构建映射：uint16 pair index -> (edge vector, adj vector)
        Map<int, PathVectorPair> indexAndEdges =
            pathSpecialMetaData.indexAndEdges;

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
        );
        elements.add(ValueWrapper(firstNode, ColumnType.columnTypeNode));

        PathAdjHeader pathAdjHeader = PathAdjHeader(
          ValueWrapper(
            decodeValue(firstNodeAdjVector, adjDataType, pathHeader.headOffset),
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
              EdgeType(pathType.edgeTypesMap),
              vecOffset,
            );
            adjVector = edgeVectorPair.adjVector;
            elements.add(ValueWrapper(edge, ColumnType.columnTypeEdge));

            // 更新邻接头
            pathAdjHeader = PathAdjHeader(
              ValueWrapper(
                decodeValue(adjVector, adjDataType, vecOffset),
                adjDataType.type,
              ).asLong,
            );
          } else {
            PathVectorPair nodeVectorPair = indexAndNodes[vecIndex]!;
            Object? node = decodeValue(
              nodeVectorPair.vector,
              NodeType(pathType.nodeTypesMap),
              vecOffset,
            );
            adjVector = nodeVectorPair.adjVector;
            elements.add(ValueWrapper(node, ColumnType.columnTypeNode));

            // 更新邻接头
            pathAdjHeader = PathAdjHeader(
              ValueWrapper(
                decodeValue(adjVector, adjDataType, vecOffset),
                adjDataType.type,
              ).asLong,
            );
          }
        }
        return Path(elements);
      case ColumnType.columnTypeAny:
        valueData = getSubBytes(
          vector.vectorData,
          SizeConstant.anyHeaderSize,
          rowIndex,
        );
        return bytesToAny(valueData, vector, rowIndex);
      case ColumnType.columnTypeEmbeddingVector:
        EmbeddingVectorType vectorType = type as EmbeddingVectorType;
        int dim = vectorType.dim;
        valueData = getSubBytes(
          vectorData,
          dim * SizeConstant.embeddingVectorFloatValueSize,
          rowIndex,
        );
        return bytesToEmbeddingVector(BytesReader(valueData), dim);
      default:
        throw Exception("不支持的类型: $type");
    }
  }

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
      obj = reader.readSizedString(_byteOrder);
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
      _byteOrder,
    );

    if (stringValueLength <= SizeConstant.stringMaxValueLengthInHeader) {
      return utf8.decode(
        stringHeader.sublist(
          SizeConstant.stringValueLengthSize,
          SizeConstant.stringValueLengthSize + stringValueLength,
        ),
      );
    }

    int chunkIndex = DecodeUtils.bytesToInt32(
      stringHeader.sublist(
        SizeConstant.chunkIndexStartPositionInStringHeader,
        SizeConstant.chunkIndexStartPositionInStringHeader +
            SizeConstant.chunkIndexLengthInStringHeader,
      ),
      _byteOrder,
    );

    int chunkOffset = DecodeUtils.bytesToInt32(
      stringHeader.sublist(
        SizeConstant.chunkOffsetStartPositionInStringHeader,
        SizeConstant.chunkOffsetStartPositionInStringHeader +
            SizeConstant.chunkOffsetLengthInStringHeader,
      ),
      _byteOrder,
    );

    ng.NestedVector stringChunkVector = vector.getNestedVectors(chunkIndex);
    Uint8List valueData = Uint8List.fromList(
      stringChunkVector.vectorData.sublist(
        chunkOffset,
        chunkOffset + stringValueLength,
      ),
    );

    return utf8.decode(valueData);
  }

  /// **解码二进制数据为日期**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 日期值
  DateTime bytesToDate(Uint8List data) {
    int year = DecodeUtils.bytesToUInt16(
      data.sublist(0, SizeConstant.yearSize),
      _byteOrder,
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
  LocalTime bytesToLocalTime(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int hour = buffer.getInt8(0);
    int minute = buffer.getInt8(1);
    int second = buffer.getInt8(2);
    // 跳过填充字节
    buffer.getInt8(3);
    int microsecond = buffer.getInt32(_byteOrder == Endian.little ? 4 : 0);

    return LocalTime(hour, minute, second, microsecond);
  }

  /// **解码二进制数据为带时区的时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 带时区的时间值
  OffsetTime bytesToZonedTime(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int hour = buffer.getInt8(0);
    int currentOffset = _timeZoneOffset;

    if (hour < 0) {
      hour = -hour;
    }

    int minute = buffer.getInt8(1);
    int second = buffer.getInt8(2);
    // 跳过填充字节
    buffer.getInt8(3);
    int microsecond = buffer.getInt32(_byteOrder == Endian.little ? 4 : 0);

    LocalTime localUtcTime = LocalTime(
      hour % 24,
      minute,
      second,
      microsecond,
    ).addMinutes(currentOffset);

    ZoneOffset offset = ZoneOffset(currentOffset * 60);
    return OffsetTime.of(localUtcTime, offset);
  }

  /// **解码二进制数据为本地日期时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 本地日期时间值
  LocalDateTime bytesToLocalDateTime(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int qword = buffer.getInt64(0, _byteOrder);

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

    return LocalDateTime(year, month, day, hour, minute, second, microsecond);
  }

  /// **解码二进制数据为带时区的日期时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 带时区的日期时间值
  ZonedDateTime bytesToZonedDateTime(Uint8List data) {
    LocalDateTime localDateTime = bytesToLocalDateTime(
      data,
    ).addSeconds(_timeZoneOffset * 60);
    ZoneOffset offset = ZoneOffset(_timeZoneOffset * 60);
    return ZonedDateTime.of(localDateTime, offset);
  }

  /// **解码二进制数据为持续时间**
  ///
  /// - `data`: 二进制数据
  /// - 返回: 持续时间值
  NDuration bytesToDuration(Uint8List data) {
    ByteData buffer = ByteData.view(Uint8List.fromList(data).buffer);
    int qword = buffer.getInt64(0, _byteOrder);

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
          _byteOrder,
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

    AnyHeader anyHeader = AnyHeader(value, valueType, _byteOrder);
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
        _byteOrder,
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
      obj = reader.readSizedString(_byteOrder);
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
          _byteOrder,
        );
        break;
      case ColumnType.columnTypeUint16:
        obj = DecodeUtils.bytesToUInt16(
          reader.read(SizeConstant.int16Size),
          _byteOrder,
        );
        break;
      case ColumnType.columnTypeInt32:
      case ColumnType.columnTypeUint32:
        obj = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.int32Size),
          _byteOrder,
        );
        break;
      case ColumnType.columnTypeInt64:
      case ColumnType.columnTypeUint64:
        obj = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.int64Size),
          _byteOrder,
        );
        break;
      case ColumnType.columnTypeFloat32:
        obj = DecodeUtils.bytesToFloat(
          reader.read(SizeConstant.floatSize),
          _byteOrder,
        );
        break;
      case ColumnType.columnTypeFloat64:
        obj = DecodeUtils.bytesToDouble(
          reader.read(SizeConstant.doubleSize),
          _byteOrder,
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
    String decimalStr = reader.readSizedString(_byteOrder);
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
          _byteOrder,
        );
      case ColumnType.columnTypeUint16:
        return DecodeUtils.bytesToUInt16(
          reader.read(SizeConstant.int16Size),
          _byteOrder,
        );
      case ColumnType.columnTypeInt32:
      case ColumnType.columnTypeUint32:
        return DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.int32Size),
          _byteOrder,
        );
      case ColumnType.columnTypeInt64:
      case ColumnType.columnTypeUint64:
        return DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.int64Size),
          _byteOrder,
        );
      case ColumnType.columnTypeFloat32:
        return DecodeUtils.bytesToFloat(
          reader.read(SizeConstant.floatSize),
          _byteOrder,
        );
      case ColumnType.columnTypeFloat64:
        return DecodeUtils.bytesToDouble(
          reader.read(SizeConstant.doubleSize),
          _byteOrder,
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
        return Decimal.parse(reader.readSizedString(_byteOrder));
      case ColumnType.columnTypeString:
        return reader.readSizedString(_byteOrder);
      case ColumnType.columnTypeList:
        ColumnType eleType = ColumnType.getColumnType(
          DecodeUtils.bytesToInt8(reader.read(SizeConstant.valueTypeSize)),
        );
        int listSize = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          _byteOrder,
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
          _byteOrder,
        );
        Map<String, ValueWrapper> map = {};

        for (int i = 0; i < recordSize; i++) {
          String fieldName = reader.readSizedString(_byteOrder);
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
          _byteOrder,
        );
        int nodeTypeId = getNodeTypeIdFromNodeId(nodeId);
        int nodeGraphId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.graphIdSize),
          _byteOrder,
        );
        int nodePropNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          _byteOrder,
        );
        Map<String, ValueWrapper> nodeProperties = {};

        for (int i = 0; i < nodePropNum; i++) {
          String propName = reader.readSizedString(_byteOrder);
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
          _graphSchemas,
        );
      case ColumnType.columnTypeEdge:
        // srcNodeID 8B+dstNodeID 8B+edgeRank 8B+graphId 4B+edgeTypeID 4B+prop_size 2B
        int srcNodeId = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.nodeIdSize),
          _byteOrder,
        );
        int dstNodeId = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.nodeIdSize),
          _byteOrder,
        );
        int rank = DecodeUtils.bytesToInt64(
          reader.read(SizeConstant.rankSize),
          _byteOrder,
        );
        int edgeGraphId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.graphIdSize),
          _byteOrder,
        );
        int edgeTypeId = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.edgeTypeIdSize),
          _byteOrder,
        );
        int edgePropNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          _byteOrder,
        );
        Map<String, ValueWrapper> edgeProperties = {};

        for (int i = 0; i < edgePropNum; i++) {
          String propName = reader.readSizedString(_byteOrder);
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
          _graphSchemas,
        );
      case ColumnType.columnTypePath:
        int elementNum = DecodeUtils.bytesToInt16(
          reader.read(SizeConstant.elementNumberSizeForAnyValue),
          _byteOrder,
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
          _byteOrder,
        );
        return bytesToEmbeddingVector(reader, vectorEleNum);
      default:
        throw Exception("不支持的类型: $type");
    }
  }
}

extension on ng.NestedVector {
  ng.NestedVector getNestedVectors(int chunkIndex) {
    if (chunkIndex < 0 || chunkIndex >= nestedVectors.length) {
      throw Exception("无效的块索引: $chunkIndex");
    }
    return nestedVectors[chunkIndex];
  }
}
