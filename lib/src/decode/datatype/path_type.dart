// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class PathType extends DataType {
  final List<DataType> dataTypes;
  final List<NodeType> nodeTypes = <NodeType>[];
  final List<EdgeType> edgeTypes = <EdgeType>[];

  final Map<int, Map<int, Map<String, DataType>>> nodeTypesMap =
      <int, Map<int, Map<String, DataType>>>{};
  final Map<int, Map<int, Map<String, DataType>>> edgeTypesMap =
      <int, Map<int, Map<String, DataType>>>{};

  PathType(this.dataTypes) : super(ColumnType.columnTypePath) {
    for (DataType dataType in dataTypes) {
      if (dataType.type == ColumnType.columnTypeNode) {
        nodeTypes.add(dataType as NodeType);
      } else if (dataType.type == ColumnType.columnTypeEdge) {
        edgeTypes.add(dataType as EdgeType);
      }
    }
  }

  List<DataType> getDataTypes() {
    return dataTypes;
  }

  Map<int, Map<int, Map<String, DataType>>> getNodeTypes() {
    if (nodeTypesMap.isEmpty) {
      for (NodeType nodeType in nodeTypes) {
        for (MapEntry<int, Map<int, Map<String, DataType>>> entry
            in nodeType.graphNodeTypes.entries) {
          int graphId = entry.key;
          Map<int, Map<String, DataType>> nodeTypeMap = entry.value;
          if (nodeTypesMap.containsKey(graphId)) {
            Map<int, Map<String, DataType>> existNodeTypeMap =
                nodeTypesMap[graphId]!;
            for (MapEntry<int, Map<String, DataType>> nodeTypeEntry
                in nodeTypeMap.entries) {
              int nodeTypeId = nodeTypeEntry.key;
              Map<String, DataType> propMap = nodeTypeEntry.value;
              if (existNodeTypeMap.containsKey(nodeTypeId)) {
                existNodeTypeMap[nodeTypeId]!.addAll(propMap);
              } else {
                existNodeTypeMap[nodeTypeId] = propMap;
              }
            }
          } else {
            nodeTypesMap[graphId] = nodeTypeMap;
          }
        }
      }
    }
    return nodeTypesMap;
  }

  Map<int, Map<int, Map<String, DataType>>> getEdgeTypes() {
    if (edgeTypesMap.isEmpty) {
      for (EdgeType edgeType in edgeTypes) {
        for (MapEntry<int, Map<int, Map<String, DataType>>> entry
            in edgeType.graphEdgeTypes.entries) {
          int graphId = entry.key;
          Map<int, Map<String, DataType>> edgeTypeMap = entry.value;
          if (edgeTypesMap.containsKey(graphId)) {
            Map<int, Map<String, DataType>> existEdgeTypeMap =
                edgeTypesMap[graphId]!;
            for (MapEntry<int, Map<String, DataType>> edgeTypeEntry
                in edgeTypeMap.entries) {
              int edgeTypeId = edgeTypeEntry.key;
              Map<String, DataType> propMap = edgeTypeEntry.value;
              if (existEdgeTypeMap.containsKey(edgeTypeId)) {
                existEdgeTypeMap[edgeTypeId]!.addAll(propMap);
              } else {
                existEdgeTypeMap[edgeTypeId] = propMap;
              }
            }
          } else {
            edgeTypesMap[graphId] = edgeTypeMap;
          }
        }
      }
    }
    return edgeTypesMap;
  }
}
