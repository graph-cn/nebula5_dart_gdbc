// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **解码路径的特殊元数据**
///
/// 特殊元数据格式：
///
/// | 节点数量 | 图ID | 节点类型ID | 对索引 |...| 边数量 | 图ID | 边类型ID | 对索引 |...|
/// |---------|-----|-----------|-------|---|-------|-----|---------|-------|---|
/// | 4字节   | 4字节| 2字节     | 2字节  |...| 4字节  | 4字节| 4字节   | 2字节  |...|
class PathSpecialMetaData {
  // 节点类型ID -> 对索引的映射
  final Map<int, Map<int, int>> _graphIdAndNodeTypes = {};

  // 边类型ID -> 对索引的映射
  final Map<int, Map<int, int>> _graphIdAndEdgeTypes = {};

  // 对索引 -> 节点向量和邻接向量对
  final Map<int, PathVectorPair> _indexAndNodes = {};

  // 对索引 -> 边向量和邻接向量对
  final Map<int, PathVectorPair> _indexAndEdges = {};

  PathSpecialMetaData(ng.NestedVector vector, Endian byteOrder) {
    Uint8List metaData = Uint8List.fromList(vector.specialMetaData);
    BytesReader reader = BytesReader(metaData);
    int nestedVectorIndex = 0;

    // 读取节点类型数量
    int nodeTypeNum = DecodeUtils.bytesToInt32(
      reader.read(SizeConstant.graphElementTypeNumSize),
      byteOrder,
    );

    // 处理所有节点类型
    for (int i = 0; i < nodeTypeNum; i++) {
      int graphId = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.graphIdSize),
        byteOrder,
      );
      int nodeTypeId = DecodeUtils.bytesToInt16(
        reader.read(SizeConstant.nodeTypeIdSize),
        byteOrder,
      );
      int nodeTypePairIndex = DecodeUtils.bytesToInt16(
        reader.read(SizeConstant.pathMetaDataNodeEdgeTypeIndex),
        byteOrder,
      );

      if (!_graphIdAndNodeTypes.containsKey(graphId)) {
        _graphIdAndNodeTypes[graphId] = {};
      }
      _graphIdAndNodeTypes[graphId]![nodeTypeId] = nodeTypePairIndex;

      PathVectorPair pair = PathVectorPair(
        VectorWrapper(vector.nestedVectors[nestedVectorIndex++], byteOrder),
        VectorWrapper(vector.nestedVectors[nestedVectorIndex++], byteOrder),
      );

      _indexAndNodes[nodeTypePairIndex] = pair;
    }

    // 读取边类型数量
    int edgeTypeNum = DecodeUtils.bytesToInt32(
      reader.read(SizeConstant.graphElementTypeNumSize),
      byteOrder,
    );

    // 处理所有边类型
    for (int i = 0; i < edgeTypeNum; i++) {
      int graphId = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.graphIdSize),
        byteOrder,
      );
      int edgeTypeId = DecodeUtils.bytesToInt32(
        reader.read(SizeConstant.edgeTypeIdSize),
        byteOrder,
      );
      int edgeTypePairIndex = DecodeUtils.bytesToInt16(
        reader.read(SizeConstant.pathMetaDataNodeEdgeTypeIndex),
        byteOrder,
      );

      if (!_graphIdAndEdgeTypes.containsKey(graphId)) {
        _graphIdAndEdgeTypes[graphId] = {};
      }
      _graphIdAndEdgeTypes[graphId]![edgeTypeId] = edgeTypePairIndex;

      PathVectorPair pair = PathVectorPair(
        VectorWrapper(vector.nestedVectors[nestedVectorIndex++], byteOrder),
        VectorWrapper(vector.nestedVectors[nestedVectorIndex++], byteOrder),
      );

      _indexAndEdges[edgeTypePairIndex] = pair;
    }
  }

  /// 获取图ID和节点类型的映射
  Map<int, Map<int, int>> get graphIdAndNodeTypes => _graphIdAndNodeTypes;

  /// 获取图ID和边类型的映射
  Map<int, Map<int, int>> get graphIdAndEdgeTypes => _graphIdAndEdgeTypes;

  /// 获取索引和节点的映射
  Map<int, PathVectorPair> get indexAndNodes => _indexAndNodes;

  /// 获取索引和边的映射
  Map<int, PathVectorPair> get indexAndEdges => _indexAndEdges;
}
