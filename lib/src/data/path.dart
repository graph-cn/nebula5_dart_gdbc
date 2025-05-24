// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **路径类，表示图中一条节点和边的路径**
class Path {
  /// 解码类型
  // ignore: unused_field
  final String _decodeType = "utf-8";

  /// 路径中的所有值（节点和边）
  final List<ValueWrapper> _values;

  /// 路径中的所有节点
  final List<Node> _nodes = [];

  /// 路径中的所有边
  final List<Edge> _edges = [];

  /// **创建一个路径对象**
  ///
  /// - `values`: 路径中的值（节点和边）列表
  Path(this._values) {
    for (ValueWrapper value in _values) {
      if (value.isNode) {
        _nodes.add(value.asNode);
      } else {
        _edges.add(value.asEdge);
      }
    }
  }

  /// **获取路径中的所有节点**
  ///
  /// 按照它们在路径中出现的顺序返回节点列表
  ///
  /// - 返回: 此路径中的所有节点列表
  List<Node> get nodes => _nodes;

  /// **获取路径中的所有边**
  ///
  /// 按照它们在路径中出现的顺序返回边列表
  ///
  /// - 返回: 此路径中的所有边列表
  List<Edge> get edges => _edges;

  /// **获取路径中的所有值（节点和边）**
  ///
  /// 按照它们在路径中出现的顺序返回值列表。第一个值将是节点类型，
  /// 然后下一个将是边类型，再下一个将是节点类型。
  ///
  /// - 返回: 此路径中的所有值列表
  List<ValueWrapper> get values => _values;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Path) return false;

    return listEquals(_values, other._values);
  }

  @override
  int get hashCode => Object.hashAll(_values);

  @override
  String toString() {
    if (_values.isEmpty) {
      return 'null';
    }

    Node prefixNode = _nodes.first;
    List<String> prefixNodePropStrs = [];
    Map<String, ValueWrapper> prefixNodeProps = prefixNode.properties;

    for (String key in prefixNodeProps.keys) {
      prefixNodePropStrs.add('$key:${prefixNodeProps[key]}');
    }

    // 路径中只有一个节点
    if (_edges.isEmpty) {
      String template = '(%d@%s:%s{%s})';
      return template
          .replaceFirst('%d', '${prefixNode.id}')
          .replaceFirst('%s', prefixNode.type)
          .replaceFirst('%s', prefixNode.labels.join('&'))
          .replaceFirst('%s', prefixNodePropStrs.join(','));
    }

    List<String> edgeStrs = [];
    for (int i = 0; i < _edges.length; i++) {
      Edge edge = _edges[i];

      List<String> edgePropStrs = [];
      Map<String, ValueWrapper> props = edge.properties;
      for (String key in props.keys) {
        edgePropStrs.add('$key:${props[key]}');
      }

      Node suffixNode = _nodes[i + 1];
      List<String> suffixNodePropStrs = [];
      Map<String, ValueWrapper> suffixNodeProps = suffixNode.properties;
      for (String key in suffixNodeProps.keys) {
        suffixNodePropStrs.add('$key:${suffixNodeProps[key]}');
      }

      String template;
      if (i == 0) {
        template = '(%d@%s:%s{%s})~[%d@%s:%s{%s}]~(%d@%s:%s{%s})';
        if (edge.isDirected && edge.srcId == prefixNode.id) {
          template = '(%d@%s:%s{%s})-[%d@%s:%s{%s}]->(%d@%s:%s{%s})';
        }
        if (edge.isDirected && edge.srcId != prefixNode.id) {
          template = '(%d@%s:%s{%s})<-[%d@%s:%s{%s}]-(%d@%s:%s{%s})';
        }

        edgeStrs.add(
          template
              .replaceFirst('%d', '${prefixNode.id}')
              .replaceFirst('%s', prefixNode.type)
              .replaceFirst('%s', prefixNode.labels.join('&'))
              .replaceFirst('%s', prefixNodePropStrs.join(','))
              .replaceFirst('%d', '${edge.rank}')
              .replaceFirst('%s', edge.type)
              .replaceFirst('%s', edge.labels.join('&'))
              .replaceFirst('%s', edgePropStrs.join(','))
              .replaceFirst('%d', '${suffixNode.id}')
              .replaceFirst('%s', suffixNode.type)
              .replaceFirst('%s', suffixNode.labels.join('&'))
              .replaceFirst('%s', suffixNodePropStrs.join(',')),
        );
      } else {
        template = '~[%d@%s:%s{%s}]~(%d@%s:%s{%s})';
        if (edge.isDirected && edge.dstId == suffixNode.id) {
          template = '-[%d@%s:%s{%s}]->(%d@%s:%s{%s})';
        }
        if (edge.isDirected && edge.dstId != suffixNode.id) {
          template = '<-[%d@%s:%s{%s}]-(%d@%s:%s{%s})';
        }

        edgeStrs.add(
          template
              .replaceFirst('%d', '${edge.rank}')
              .replaceFirst('%s', edge.type)
              .replaceFirst('%s', edge.labels.join('&'))
              .replaceFirst('%s', edgePropStrs.join(','))
              .replaceFirst('%d', '${suffixNode.id}')
              .replaceFirst('%s', suffixNode.type)
              .replaceFirst('%s', suffixNode.labels.join('&'))
              .replaceFirst('%s', suffixNodePropStrs.join(',')),
        );
      }
    }
    return edgeStrs.join('');
  }
}
