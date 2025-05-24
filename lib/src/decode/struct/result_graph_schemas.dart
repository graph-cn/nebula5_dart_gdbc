// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **结果图表模式类**
///
/// 存储所有图表模式的映射关系
class ResultGraphSchemas {
  /// 图 ID 到图表模式的映射
  Map<int, GraphSchema> _graphSchemaMap = {};

  /// 从属性图表模式列表创建结果图表模式
  ///
  /// - `graphSchemas`: 属性图表模式列表
  ResultGraphSchemas(List<ng.PropertyGraphSchema> graphSchemas) {
    for (var schema in graphSchemas) {
      _graphSchemaMap[schema.graphId] = GraphSchema(schema);
    }
  }

  /// 获取图表模式映射
  ///
  /// 返回图 ID 到 GraphSchema 的映射
  Map<int, GraphSchema> get graphSchemaMap => _graphSchemaMap;

  /// 根据图 ID 获取特定的图表模式
  ///
  /// - `graphId`: 要查询的图 ID
  /// - 返回: 对应的图表模式，如不存在则返回 null
  GraphSchema? getGraphSchema(int graphId) {
    return _graphSchemaMap[graphId];
  }
}
