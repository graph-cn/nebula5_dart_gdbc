// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class NodeType extends DataType {
  NodeType(this.graphNodeTypes) : super(ColumnType.columnTypeNode);
  final Map<int, Map<int, Map<String, DataType>>> graphNodeTypes;

  Map<int, Map<int, Map<String, DataType>>> getNodeTypes() {
    return graphNodeTypes;
  }
}
