// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **嵌入向量类，用于表示嵌入向量数据**
class EmbeddingVector {
  /// 维度
  final int _dim;

  /// 向量值列表
  final List<double> _values;

  /// **创建一个嵌入向量**
  ///
  /// - `dim`: 向量维度
  /// - `values`: 向量值列表
  EmbeddingVector(this._dim, this._values);

  /// **获取向量维度**
  int get dim => _dim;

  /// **获取向量值列表**
  List<double> get values => _values;

  /// **获取向量大小**
  int get size => _values.length;

  @override
  String toString() => _values.toString();
}
