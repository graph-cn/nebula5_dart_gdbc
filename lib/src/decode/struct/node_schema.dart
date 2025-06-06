// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class NodeSchema {
  int _nodeTypeId = 0;
  String _nodeTypeName = '';
  List<String> _nodeLabels = [];

  NodeSchema(ng.NodeType nodeType) {
    _nodeTypeId = nodeType.nodeTypeId;
    _nodeTypeName = nodeType.nodeTypeName.utf8String();
    for (var label in nodeType.label) {
      _nodeLabels.add(label.utf8String());
    }
  }

  int get nodeTypeId => _nodeTypeId;

  String get nodeTypeName => _nodeTypeName;

  List<String> get nodeLabels => _nodeLabels;
}
