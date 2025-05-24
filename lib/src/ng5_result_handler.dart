part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

Ng5ResultSet handleResult(ng.ExecuteResponse rs, int? timezoneOffset) {
  var parser = ValueParser(
    ResultGraphSchemas(rs.result.meta.graphSchema),
    timezoneOffset ?? 0,
    rs.result.meta.isLittleEndian ? Endian.little : Endian.big,
  );

  var rsMeta = rs.result.meta;
  var numBatches = rsMeta.numBatches;
  var numRecords = rsMeta.numRecords;
  var table = rs.result;

  ResultTable resultTable = ResultTable(table);

  Ng5ResultSet result = Ng5ResultSet(
    parser: parser,
    numBatches: numBatches,
    numRecords: numRecords.toInt(),
    resultTable: resultTable,
    response: rs,
  );

  var types = <DataType>[];
  for (var i = 0; i < rsMeta.rowType.columnTypes.length; i++) {
    var t = rsMeta.rowType.columnTypes[i];
    var type = result.typeParser.getDataType(
      BytesReader(Uint8List.fromList(t.valueType)),
    );
    types.add(type);
  }

  result.metas = List.generate(
    rsMeta.rowType.columnNames.length,
    (index) =>
        ValueMetaData()
          ..name = rsMeta.rowType.columnNames[index]
          ..type = getType(types[index].type),
  );

  return result;
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
    case ColumnType.columnTypeLocalDateTime:
      return GdbTypes.dateTime;
    case ColumnType.columnTypeZonedDateTime:
      return GdbTypes.timestamp;
    // case ColumnType.columnTypeDecimal:
    // return GdbTypes.decimal;
    case ColumnType.columnTypeEdge:
      return GdbTypes.relationship;
    case ColumnType.columnTypeNode:
      return GdbTypes.node;
    case ColumnType.columnTypePath:
      return GdbTypes.path;
    // case ColumnType.columnTypeRecord:
    //   return GdbTypes.dataSet;
    // case ColumnType.columnVector:
    //   return GdbTypes.vector;
    // case ColumnType.columnEmbeddingVector:
    //   return GdbTypes.embeddingVector;
    // case ColumnType.columnZonedDateTime:
    //   return GdbTypes.zonedDateTime;
    // case ColumnType.columnZonedTime:
    //   return GdbTypes.zonedTime;
    // case ColumnType.columnLocalDateTime:
    //   return GdbTypes.localDateTime;
    // case ColumnType.columnLocalTime:
    //   return GdbTypes.localTime;
    default:
      return GdbTypes.unknown;
  }
}
