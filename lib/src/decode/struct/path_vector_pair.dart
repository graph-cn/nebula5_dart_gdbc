// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **PathVectorPair 表示路径中的节点或边元素及其邻居信息**
class PathVectorPair {
  /// 节点或边向量
  final VectorWrapper _nodeVector;

  /// 邻接 Long 向量
  final VectorWrapper _adjVector;

  PathVectorPair(this._nodeVector, this._adjVector);

  /// 获取向量
  VectorWrapper get vector => _nodeVector;

  /// 获取邻接向量
  VectorWrapper get adjVector => _adjVector;
}
