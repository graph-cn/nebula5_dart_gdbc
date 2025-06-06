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
    if (table.meta.isLittleEndian) {
      _byteOrder = Endian.little;
    } else {
      _byteOrder = Endian.big;
    }

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
}
