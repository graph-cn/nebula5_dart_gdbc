// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class GraphSchema {
  int _graphId = 0;
  String _graphName = '';
  Map<int, NodeSchema> _nodeSchemas = {};
  Map<int, EdgeSchema> _edgeSchemas = {};

  GraphSchema(ng.PropertyGraphSchema graphSchema) {
    _graphId = graphSchema.graphId;
    _graphName = utf8.decode(graphSchema.graphName);
    for (var nodeType in graphSchema.nodeType) {
      _nodeSchemas[nodeType.nodeTypeId] = NodeSchema(nodeType);
    }
    for (var edgeType in graphSchema.edgeType) {
      _edgeSchemas[edgeType.edgeTypeId] = EdgeSchema(edgeType);
    }
  }

  int get graphId => _graphId;

  String get graphName => _graphName;

  NodeSchema? getNodeSchema(int nodeTypeId) {
    return _nodeSchemas[nodeTypeId];
  }

  EdgeSchema? getEdgeSchema(int edgeTypeId) {
    return _edgeSchemas[edgeTypeId];
  }
}
