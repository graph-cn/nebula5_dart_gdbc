// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **节点类，表示图中的顶点**
class Node extends BaseDataObject {
  /// 图 ID
  final int _graphId;

  /// 图名称
  final String _graphName;

  /// 节点类型 ID
  final int _nodeTypeId;

  /// 节点类型名称
  final String _nodeTypeName;

  /// 节点标签列表
  final List<String> _labels;

  /// 节点 ID
  final int _nodeId;

  /// 节点属性映射
  final Map<String, ValueWrapper> _properties;

  /// **创建一个节点对象**
  ///
  /// - `graphId`: 图 ID
  /// - `nodeTypeId`: 节点类型 ID
  /// - `nodeId`: 节点 ID
  /// - `properties`: 节点属性
  /// - `graphSchemas`: 图结构信息
  Node(
    int graphId,
    int nodeTypeId,
    int nodeId,
    Map<String, ValueWrapper> properties,
    ResultGraphSchemas graphSchemas,
  ) : _graphId = graphId,
      _graphName = graphSchemas.getGraphSchema(graphId)!.graphName,
      _nodeTypeId = nodeTypeId,
      _nodeTypeName =
          graphSchemas
              .getGraphSchema(graphId)!
              .getNodeSchema(nodeTypeId)!
              .nodeTypeName,
      _labels =
          graphSchemas
              .getGraphSchema(graphId)!
              .getNodeSchema(nodeTypeId)!
              .nodeLabels,
      _nodeId = nodeId,
      _properties = properties;

  /// **获取图名称**
  String get graph => _graphName;

  /// **获取节点类型名称**
  String get type => _nodeTypeName;

  /// **获取节点类型 ID**
  int get nodeTypeId => _nodeTypeId;

  /// **获取节点标签列表**
  ///
  /// - 返回: 标签列表
  List<String> get labels => _labels;

  /// **获取节点 ID**
  ///
  /// - 返回: 节点 ID
  int get id => _nodeId;

  /// **获取节点属性名称列表**
  ///
  /// - 返回: 属性名称列表
  List<String> get columnNames => _properties.keys.toList();

  /// **获取所有属性值**
  ///
  /// - 返回: 属性值列表
  List<ValueWrapper> get values => _properties.values.toList();

  /// **获取节点的所有属性**
  ///
  /// - 返回: 属性名称 -> 属性值的映射
  Map<String, ValueWrapper> get properties => _properties;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Node) return false;

    return id == other.id;
  }

  @override
  int get hashCode => Object.hash(_graphId, _nodeTypeId, _nodeId, decodeType);

  @override
  String toString() {
    Map<String, ValueWrapper> props = properties;
    List<String> propStrs = [];

    for (String propName in props.keys) {
      propStrs.add('$propName:${props[propName]}');
    }

    return '($_nodeId@$type:${labels.join("&")}{${propStrs.join(",")}})';
  }
}
