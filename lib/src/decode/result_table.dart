// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **结果表类，管理向量结果表数据**
class ResultTable {
  /// 向量结果表
  late ng.VectorResultTable? _resultTable;

  /// 字节顺序
  late Endian _byteOrder;

  /// 值解析器
  late ValueParser _parser;

  /// 批处理总数
  late int _numBatches;

  /// 列名列表
  final List<String> _columnNames = [];

  /// 列数据类型列表
  final List<DataType> _columnDataTypes = [];

  /// 当前批处理索引
  int _batchIndex = 0;

  /// 当前批处理
  late Batch? _currentBatch;

  /// 当前批处理行索引
  int _currentBatchRowIndex = 0;

  /// **构造结果表**
  ///
  /// - `table`: 向量结果表
  ResultTable(ng.VectorResultTable? table) {
    if (table == null || !table.hasMeta()) {
      _resultTable = null;
      return;
    }

    _resultTable = table;
    ResultGraphSchemas graphSchemas = ResultGraphSchemas(
      table.meta.graphSchema,
    );
    int timeZoneOffset = table.meta.timeZoneOffset;

    if (table.meta.isLittleEndian) {
      _byteOrder = Endian.little;
    } else {
      _byteOrder = Endian.big;
    }

    _parser = ValueParser(graphSchemas, timeZoneOffset, _byteOrder);
    _numBatches = table.batch.length;
    List<ng.VectorBatch> batches = List.from(table.batch);

    if (_numBatches != batches.length) {
      throw Exception("批处理数量与 numBatches 不相等");
    }

    _columnNames.addAll(table.meta.rowType.columnNames);
    ValueTypeParser valueTypeParser = ValueTypeParser(_byteOrder);

    for (var type in table.meta.rowType.columnTypes) {
      DataType dataType = valueTypeParser.getDataType(
        BytesReader(Uint8List.fromList(type.valueType)),
      );
      _columnDataTypes.add(dataType);
    }

    if (table.batch.isNotEmpty) {
      _currentBatch = Batch(table.batch[0], _byteOrder);
    } else {
      _currentBatch = null;
    }
  }

  /// **获取响应的列名**
  ///
  /// - 返回: 列名列表
  List<String> get columnNames => _columnNames;

  /// **获取响应的总数据记录大小**
  ///
  /// - 返回: 记录总数
  int get totalNumRecords => _resultTable?.meta.numRecords.toInt() ?? 0;

  /// **从批处理中解析行记录**
  ///
  /// - `index`: 当前批处理中每个向量的位置
  /// - 返回: 行对象
  Row _getRowByIndex(int index) {
    Row row = Row();
    if (_currentBatch != null) {
      for (int i = 0; i < _currentBatch!.vectorsCount; i++) {
        ValueWrapper value = _parser.decodeValueWrapper(
          _currentBatch!.getVectors(i),
          _columnDataTypes[i],
          index,
        );
        row.addValue(value);
      }
    }
    return row;
  }

  /// **获取下一行数据**
  ///
  /// - 返回: 行对象
  /// - 抛出: 当没有更多批处理数据时抛出异常
  Row next() {
    if (_currentBatch == null) {
      throw Exception("没有更多批处理数据");
    }

    // 每个 VectorMetaData 具有相同的 numRecords 值，
    // 只需使用第一个来获取此批处理的 numRecord
    int currentBatchRowSize = 0;
    if (_currentBatch!.vectorsCount != 0) {
      currentBatchRowSize = _currentBatch!.batchRowSize;
    }

    // 当前批处理为空或已经完成批处理，跳转到下一个批处理
    if (_currentBatch!.vectorsCount == 0 ||
        _currentBatchRowIndex >= currentBatchRowSize) {
      _batchIndex++;
      if (_batchIndex >= _numBatches) {
        throw Exception("没有更多批处理数据");
      }

      // 将 currentBatchRowIndex 重置为 0
      _currentBatchRowIndex = 0;
      _currentBatch = Batch(_resultTable!.batch[_batchIndex], _byteOrder);
    }

    // 解析当前批处理
    Row row = _getRowByIndex(_currentBatchRowIndex);
    _currentBatchRowIndex++;
    return row;
  }
}
