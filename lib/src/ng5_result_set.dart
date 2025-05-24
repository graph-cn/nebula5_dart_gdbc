part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class Ng5ResultSet extends ResultSet {
  /// 值解析器
  final ValueParser parser;
  final int numBatches;
  final int numRecords;
  @override
  late List<ValueMetaData> metas = [];
  final ValueTypeParser typeParser;
  final ResultTable resultTable;
  final ng.ExecuteResponse response;
  final int size;
  int index = 0;

  bool get isEmpty => size == 0;

  @override
  late List<List<dynamic>> rows = [];
  Ng5ResultSet({
    required this.parser,
    required this.resultTable,
    required this.response,
    this.numBatches = 0,
    this.numRecords = 0,
  }) : typeParser = ValueTypeParser(parser._byteOrder),
       size = response.hasResult() ? resultTable.totalNumRecords : 0 {
    metas = List.generate(
      resultTable.columnNames.length,
      (index) =>
          ValueMetaData()
            ..name = resultTable.columnNames[index]
            ..type = GdbTypes.unknown,
    );
    while (hasNext()) {
      var row = next();
      if (row != null) {
        // rows.add(row);
      }
    }
  }

  bool hasNext() {
    if (isEmpty) {
      return false;
    }
    return index < size;
  }

  next() {
    if (!hasNext()) {
      return null;
    }
    Row row = resultTable.next();
    index++;
    return row;
  }
}
