// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class EdgeSchema {
  int _edgeTypeId = 0;
  String _edgeTypeName = '';
  List<String> _edgeLabels = [];

  EdgeSchema(ng.EdgeType edgeType) {
    _edgeTypeId = edgeType.edgeTypeId;
    _edgeTypeName = utf8.decode(edgeType.edgeTypeName);
    for (var label in edgeType.label) {
      _edgeLabels.add(utf8.decode(label));
    }
  }

  int get edgeTypeId => _edgeTypeId;

  String get edgeTypeName => _edgeTypeName;

  List<String> get edgeLabels => _edgeLabels;
}
