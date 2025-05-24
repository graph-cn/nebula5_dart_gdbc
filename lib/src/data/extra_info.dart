// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **该类维护执行结果的一些附加信息**
class ExtraInfo {
  /// 用于扫描过程的游标
  String? _cursor;

  /// 受影响的节点数量
  int _affectedNodes = 0;

  /// 受影响的边数量
  int _affectedEdges = 0;

  /// 总服务器时间（微秒）
  int _totalServerTimeUs = 0;

  /// 解析时间（微秒）
  int _parseTimeUs = 0;

  /// 构建时间（微秒）
  int _buildTimeUs = 0;

  /// 优化时间（微秒）
  int _optimizeTimeUs = 0;

  /// 序列化时间（微秒）
  int _serializeTimeUs = 0;

  /// **创建一个新的额外信息对象**
  ExtraInfo();

  /// 设置游标
  set cursor(String? cursor) => _cursor = cursor;

  /// 设置受影响的节点数量
  set affectedNodes(int affectedNodes) => _affectedNodes = affectedNodes;

  /// 设置受影响的边数量
  set affectedEdges(int affectedEdges) => _affectedEdges = affectedEdges;

  /// 设置总服务器时间（微秒）
  set totalServerTimeUs(int totalServerTimeUs) =>
      _totalServerTimeUs = totalServerTimeUs;

  /// 设置解析时间（微秒）
  set parseTimeUs(int parseTimeUs) => _parseTimeUs = parseTimeUs;

  /// 设置构建时间（微秒）
  set buildTimeUs(int buildTimeUs) => _buildTimeUs = buildTimeUs;

  /// 设置优化时间（微秒）
  set optimizeTimeUs(int optimizeTimeUs) => _optimizeTimeUs = optimizeTimeUs;

  /// 设置序列化时间（微秒）
  set serializeTimeUs(int serializeTimeUs) =>
      _serializeTimeUs = serializeTimeUs;

  /// 获取游标
  String? get cursor => _cursor;

  /// 获取受影响的节点数量
  int get affectedNodes => _affectedNodes;

  /// 获取受影响的边数量
  int get affectedEdges => _affectedEdges;

  /// 获取总服务器时间（微秒）
  int get totalServerTimeUs => _totalServerTimeUs;

  /// 获取解析时间（微秒）
  int get parseTimeUs => _parseTimeUs;

  /// 获取构建时间（微秒）
  int get buildTimeUs => _buildTimeUs;

  /// 获取优化时间（微秒）
  int get optimizeTimeUs => _optimizeTimeUs;

  /// 获取序列化时间（微秒）
  int get serializeTimeUs => _serializeTimeUs;

  @override
  String toString() {
    return 'ExtraInfo{'
        'cursor: $_cursor, '
        'affectedNodes: $_affectedNodes, '
        'affectedEdges: $_affectedEdges, '
        'totalServerTimeUs: $_totalServerTimeUs, '
        'buildTimeUs: $_buildTimeUs, '
        'optimizeTimeUs: $_optimizeTimeUs, '
        'serializeTimeUs: $_serializeTimeUs'
        '}';
  }
}
