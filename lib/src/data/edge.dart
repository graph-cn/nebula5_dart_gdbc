// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **边表示图中连接两个节点的关系**
class Edge extends BaseDataObject {
  /// 图 ID
  final int _graphId;

  /// 图名称
  final String _graphName;

  /// 边类型 ID
  final int _edgeTypeId;

  /// 边类型名称
  final String _edgeTypeName;

  /// 边的标签列表
  final List<String> _labels;

  /// 边的 rank 值
  final int _rank;

  /// 源节点 ID
  final int _srcId;

  /// 目标节点 ID
  final int _dstId;

  /// 边的方向
  final Direction _direction;

  /// 边的属性映射
  final Map<String, ValueWrapper> _properties;

  /// **构造一个边对象**
  ///
  /// 边是对 Nebula Graph 返回的边类型的封装
  Edge(
    int graphId,
    int edgeTypeId,
    int rank,
    int srcId,
    int dstId,
    Map<String, ValueWrapper> properties,
    ResultGraphSchemas graphSchemas,
  ) : _graphId = graphId,
      _graphName = graphSchemas.getGraphSchema(graphId)!.graphName,
      _edgeTypeId = edgeTypeId,
      _edgeTypeName =
          graphSchemas
              .getGraphSchema(graphId)!
              .getEdgeSchema(edgeTypeId & 0x3FFFFFFF)!
              .edgeTypeName,
      _labels =
          graphSchemas
              .getGraphSchema(graphId)!
              .getEdgeSchema(edgeTypeId & 0x3FFFFFFF)!
              .edgeLabels,
      _rank = rank,
      _properties = properties,
      _direction =
          (() {
            int edgeTypeMoveBits = SizeConstant.edgeTypeIdSize * 8 - 2;
            int directionBits = (edgeTypeId >> edgeTypeMoveBits) & 0x3;
            switch (directionBits) {
              case 0x0:
                return Direction.OUTGOING;
              case 0x1:
                return Direction.INCOMING;
              case 0x2:
              case 0x3:
                return Direction.UNDIRECTED;
              default:
                return Direction.KNOWN;
            }
          })(),
      _srcId =
          (() {
            int edgeTypeMoveBits = SizeConstant.edgeTypeIdSize * 8 - 2;
            int directionBits = (edgeTypeId >> edgeTypeMoveBits) & 0x3;
            return directionBits == 0x1 ? dstId : srcId;
          })(),
      _dstId =
          (() {
            int edgeTypeMoveBits = SizeConstant.edgeTypeIdSize * 8 - 2;
            int directionBits = (edgeTypeId >> edgeTypeMoveBits) & 0x3;
            return directionBits == 0x1 ? srcId : dstId;
          })();

  /// **获取图名称**
  String get graph => _graphName;

  /// **获取边类型名称**
  String get type => _edgeTypeName;

  /// **获取边类型 ID**
  int get edgeTypeId => _edgeTypeId;

  /// **检查边是否有向**
  ///
  /// - 返回: 如果边是有向的则为 true
  bool get isDirected =>
      _direction == Direction.OUTGOING || _direction == Direction.INCOMING;

  /// **获取边的标签**
  ///
  /// - 返回: 边标签列表
  List<String> get labels => _labels;

  /// **获取源节点 ID**
  int get srcId => _srcId;

  /// **获取目标节点 ID**
  int get dstId => _dstId;

  /// **获取边的 rank 值**
  int get rank => _rank;

  /// **获取所有属性名称**
  ///
  /// - 返回: 属性名称列表
  List<String> get columnNames => _properties.keys.toList();

  /// **获取所有属性值**
  ///
  /// - 返回: 属性值列表
  List<ValueWrapper> get propertyValues => _properties.values.toList();

  /// **获取边的属性名称和值**
  ///
  /// - 返回: 属性名称 -> 属性值的映射
  Map<String, ValueWrapper> get properties => _properties;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Edge) return false;

    Edge that = other;
    return rank == that.rank &&
        ((srcId == that.srcId && dstId == that.dstId) ||
            (srcId == that.dstId && dstId == that.srcId)) &&
        type == that.type;
  }

  @override
  int get hashCode =>
      Object.hash(_graphId, _edgeTypeId, _rank, _srcId, _dstId, decodeType);

  @override
  String toString() {
    List<String> propStrs = [];
    Map<String, ValueWrapper> props = properties;

    for (String key in props.keys) {
      propStrs.add('$key:${props[key]}');
    }

    if (_direction != Direction.UNDIRECTED) {
      return '($_srcId)-[$_rank@$type:${labels.join("&")}{${propStrs.join(",")}}]->($_dstId)';
    } else {
      return '($_srcId)~[$_rank@$type:${labels.join("&")}{${propStrs.join(",")}}]~($_dstId)';
    }
  }
}

/// **边的方向枚举**
enum Direction {
  /// 出边
  OUTGOING,

  /// 入边
  INCOMING,

  /// 无向边
  UNDIRECTED,

  /// 已知边（默认）
  KNOWN,
}
