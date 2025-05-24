// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// PathAdjHeader 存储在路径邻接向量中，邻接向量是 Long 类型，
/// 每个值是一个 int64 数字，包含 isEnd、isEdge、vecIdx、offset。
///
/// 考虑一条路径：node1 -> edge1 -> node2 -> edge2 -> edge3 -> edge4 -> node3
///
/// 对于每个元素（node1、node2、...、edge1、...），我们使用一个 int64 来编码其
/// 邻居的信息。这有助于我们从一组节点/边构建路径。
///
/// 这个 int64 的结构为：
///
/// | isEnd | isEdge | 填充   | vecIdx  | offset  |
/// |-------|--------|--------|---------|---------|
/// | 1 位   | 1 位   | 14 位 | 16 位   | 32 位   |
///
/// - `isEnd`：该元素是否为路径的终点，对 node3 为 true
/// - `isEdge`：下一个元素是否为边，对 node1、node2、edge2、edge3 为 true
/// - `vecIdx`：下一个元素属于哪个向量
/// - `offset`：下一个元素在其向量中的偏移量
class PathAdjHeader {
  // 该元素是否为路径的终点。1 位
  bool _isEnd = false;

  // 下一个元素是否为边。1 位
  bool _isNextEdge = false;

  // isEdge 和 vecIdx 之间的 14 位填充

  // 下一个元素属于哪个 PathVectorPair。16 位。注意：表示向量索引。
  int _vecIdxOfNextEle = 0;

  // 下一个元素在其向量中的偏移量。32 位
  int _offsetOfNextEle = 0;

  PathAdjHeader(int value) {
    _isEnd = ((value >> 63) & 1) == 1;
    _isNextEdge = ((value >> 62) & 1) == 1;
    _vecIdxOfNextEle = (value >> 32) & 0xFFFF;
    _offsetOfNextEle = value & 0xFFFFFFFF;
  }

  bool get isEnd => _isEnd;

  bool get isNextEdge => _isNextEdge;

  int get vecIdxOfNextEle => _vecIdxOfNextEle;

  int get offsetOfNextEle => _offsetOfNextEle;
}
