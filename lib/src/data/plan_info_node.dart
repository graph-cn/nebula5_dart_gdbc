// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **计划信息节点，表示查询执行计划的节点**
class PlanInfoNode {
  /// 原始计划信息对象
  // ignore: unused_field
  final ng.PlanInfo _planInfo;

  /// 计划节点的 ID
  final String _id;

  /// 计划节点的名称
  final String _name;

  /// 计划节点的详细信息，例如聚合操作的分组键、聚合函数等
  final String _details;

  /// 操作的 CPU 时间消耗，timeMs = consumeMs+produceMs+finishMs
  final double _timeMs;

  /// 操作输出的行数
  final int _rows;

  /// 操作符的峰值内存消耗 (KiB)
  final double _memoryKib;

  /// 操作符运行时的阻塞时间
  final double _blockedMs;

  /// 操作符等待被调度的时间
  final double _queuedMs;

  /// 操作符消费输入数据的时间
  final double _consumeMs;

  /// 操作符生成输出数据的时间
  final double _produceMs;

  /// 操作符在完成阶段的耗时
  final double _finishMs;

  /// 操作符生成的批次数量
  final int _batches;

  /// 操作符的并发度
  final int _concurrency;

  /// 其他统计信息（JSON 格式）
  final String _otherStatsJson;

  /// 子计划信息节点列表
  final List<PlanInfoNode> _children;

  /// **创建一个计划信息节点**
  ///
  /// - `planInfo`: 原始计划信息对象
  PlanInfoNode(ng.PlanInfo planInfo)
    : _planInfo = planInfo,
      _id = planInfo.id.toStr(),
      _name = planInfo.name.toStr(),
      _details = planInfo.details.toStr(),
      _timeMs = planInfo.timeMs,
      _rows = planInfo.rows.toInt(),
      _memoryKib = planInfo.memoryKib,
      _blockedMs = planInfo.blockedMs,
      _queuedMs = planInfo.queuedMs,
      _consumeMs = planInfo.consumeMs,
      _produceMs = planInfo.produceMs,
      _finishMs = planInfo.finishMs,
      _batches = planInfo.batches.toInt(),
      _concurrency = planInfo.concurrency.toInt(),
      _otherStatsJson = planInfo.otherStatsJson.toStr(),
      _children =
          planInfo.children.map((ng.PlanInfo child) {
            return PlanInfoNode(child);
          }).toList();

  /// **获取计划 ID**
  String get planId => _id;

  /// **获取节点 ID**
  String get id => _id;

  /// **获取节点名称**
  String get name => _name;

  /// **获取节点详细信息**
  String get details => _details;

  /// **获取时间（毫秒）**
  double get timeMs => _timeMs;

  /// **获取行数**
  int get rows => _rows;

  /// **获取内存使用量（KiB）**
  double get memoryKib => _memoryKib;

  /// **获取阻塞时间（毫秒）**
  double get blockedMs => _blockedMs;

  /// **获取排队时间（毫秒）**
  double get queuedMs => _queuedMs;

  /// **获取消费时间（毫秒）**
  double get consumeMs => _consumeMs;

  /// **获取产生时间（毫秒）**
  double get produceMs => _produceMs;

  /// **获取完成时间（毫秒）**
  double get finishMs => _finishMs;

  /// **获取批次数量**
  int get batches => _batches;

  /// **获取并发度**
  int get concurrency => _concurrency;

  /// **获取其他统计信息（JSON）**
  String get otherStatsJson => _otherStatsJson;

  /// **获取子节点列表**
  List<PlanInfoNode> get children => _children;
}
