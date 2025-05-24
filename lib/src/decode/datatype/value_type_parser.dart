// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class ValueTypeParser {
  final Endian byteOrder;

  ValueTypeParser(this.byteOrder);

  DataType getDataType(BytesReader reader) {
    return decodeValueType(reader);
  }

  DataType decodeValueType(BytesReader reader) {
    ColumnType type = ColumnType.getColumnType(
      DecodeUtils.bytesToUInt8(reader.read(SizeConstant.valueTypeSize)),
    );

    switch (type) {
      case ColumnType.columnTypeNull:
      case ColumnType.columnTypeBool:
      case ColumnType.columnTypeUint8:
      case ColumnType.columnTypeInt8:
      case ColumnType.columnTypeUint16:
      case ColumnType.columnTypeInt16:
      case ColumnType.columnTypeUint32:
      case ColumnType.columnTypeInt32:
      case ColumnType.columnTypeUint64:
      case ColumnType.columnTypeInt64:
      case ColumnType.columnTypeFloat32:
      case ColumnType.columnTypeFloat64:
      case ColumnType.columnTypeString:
      case ColumnType.columnTypeDate:
      case ColumnType.columnTypeLocalTime:
      case ColumnType.columnTypeZonedTime:
      case ColumnType.columnTypeLocalDateTime:
      case ColumnType.columnTypeZonedDateTime:
      case ColumnType.columnTypeDuration:
      case ColumnType.columnTypeReference:
      case ColumnType.columnTypeAny:
      case ColumnType.columnTypeInvalid:
        return BasicType(type);
      case ColumnType.columnTypeDecimal:
        reader.read(4);
        return BasicType(type);
      case ColumnType.columnTypeNode:
        Map<int, Map<int, Map<String, DataType>>> nodeTypes =
            getPropertyNameAndTypeFromValueType(
              reader,
              SizeConstant.nodeTypeIdSize,
              byteOrder,
            );
        return NodeType(nodeTypes);
      case ColumnType.columnTypeEdge:
        Map<int, Map<int, Map<String, DataType>>> edgeTypes =
            getPropertyNameAndTypeFromValueType(
              reader,
              SizeConstant.edgeTypeIdSize,
              byteOrder,
            );
        return EdgeType(edgeTypes);
      case ColumnType.columnTypePath:
        int elementNum = DecodeUtils.bytesToUInt32(
          reader.read(SizeConstant.pathElementNumSize),
          byteOrder,
        );
        List<DataType> dataTypes = <DataType>[];
        for (int i = 0; i < elementNum; i++) {
          dataTypes.add(decodeValueType(reader));
        }
        return PathType(dataTypes);
      case ColumnType.columnTypeList:
        DataType dataType = decodeValueType(reader);
        return ListType(dataType);
      case ColumnType.columnTypeRecord:
        int fieldNum = DecodeUtils.bytesToUInt32(
          reader.read(SizeConstant.recordFieldNumSize),
          byteOrder,
        );
        Map<String, DataType> fieldTypes = <String, DataType>{};
        for (int i = 0; i < fieldNum; i++) {
          String fieldName = reader.readSizedString(byteOrder);
          fieldTypes[fieldName] = decodeValueType(reader);
        }
        return RecordType(fieldTypes);
      case ColumnType.columnTypeEmbeddingVector:
        int dim = DecodeUtils.bytesToInt32(
          reader.read(SizeConstant.embeddingVectorDimSize),
          byteOrder,
        );
        DataType vecElementType = decodeValueType(reader);
        if (vecElementType.type == ColumnType.columnTypeFloat32) {
          throw ArgumentError(
            'unexpected child type: ${vecElementType.type} for embedding vector',
          );
        }
        return EmbeddingVectorType(dim, vecElementType);
      default:
        throw ArgumentError('unsupported type: ${type._type} for value type');
    }
  }

  /// decode value type for node and edge, get each type's property name and property data type
  ///
  /// graphId -> (typeId -> (propName -> prop DataType))
  Map<int, Map<int, Map<String, DataType>>> getPropertyNameAndTypeFromValueType(
    BytesReader reader,
    int typeIdSize,
    Endian byteOrder,
  ) {
    // 1-5: node or edge type number, 4 bytes
    int typeNum = DecodeUtils.bytesToInt32(
      reader.read(SizeConstant.graphElementTypeNumSize),
      byteOrder,
    );

    Map<int, Map<int, Map<String, DataType>>> graphTypeFields =
        <int, Map<int, Map<String, DataType>>>{};
    for (int i = 0; i < typeNum; i++) {
      // graphID
      int graphId = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.graphIdSize),
        byteOrder,
      );
      if (!graphTypeFields.containsKey(graphId)) {
        graphTypeFields[graphId] = <int, Map<String, DataType>>{};
      }
      // node type ID or edge type ID
      final int typeId =
          typeIdSize == SizeConstant.nodeTypeIdSize
              ? DecodeUtils.bytesToInt16(reader.read(typeIdSize), byteOrder)
              : DecodeUtils.bytesToInt32(reader.read(typeIdSize), byteOrder);
      // node or edge type property number, 4 bytes
      int typePropertyNum = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.propertyNumSize),
        byteOrder,
      );
      Map<String, DataType> propertyAndType = <String, DataType>{};
      // read the property name and data type for node or edge type, property name end with \0.
      for (int j = 0; j < typePropertyNum; j++) {
        String propertyName = reader.readSizedString(byteOrder);
        // data type, 1 byte
        DataType dataType = decodeValueType(reader);
        propertyAndType[propertyName] = dataType;
      }
      graphTypeFields[graphId]![typeId] = propertyAndType;
    }
    return graphTypeFields;
  }
}
