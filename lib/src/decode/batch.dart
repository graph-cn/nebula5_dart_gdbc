// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **向量批处理类，用于维护 VectorBatch 及其向量**
class Batch {
  /// 向量批处理
  final ng.VectorBatch _batch;

  /// 向量封装器列表
  final List<VectorWrapper> _vectors = [];

  /// 构造函数
  ///
  /// - `batch`: 向量批处理对象
  /// - `byteOrder`: 字节顺序
  Batch(this._batch, Endian byteOrder) {
    for (var vector in _batch.vectors) {
      _vectors.add(VectorWrapper(vector, byteOrder));
    }
  }

  /// **获取该批处理中向量的数量**
  ///
  /// - 返回: 向量数量
  int get vectorsCount => _batch.vectors.length;

  /// **获取批处理中特定索引的向量封装器**
  ///
  /// - `index`: 索引值
  /// - 返回: 向量封装器
  VectorWrapper getVectors(int index) {
    return _vectors[index];
  }

  /// **获取此批处理的行大小**
  ///
  /// - 返回: 行大小
  int get batchRowSize {
    if (vectorsCount > 0) {
      return _batch.vectors[0].commonMetaData.numRecords;
    } else {
      return 0;
    }
  }
}
