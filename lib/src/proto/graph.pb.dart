// This is a generated file - do not edit.
//
// Generated from graph.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $1;
import 'vector.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class QueryStats extends $pb.GeneratedMessage {
  factory QueryStats({
    $fixnum.Int64? numAffectedNodes,
    $fixnum.Int64? numAffectedEdges,
  }) {
    final result = create();
    if (numAffectedNodes != null) result.numAffectedNodes = numAffectedNodes;
    if (numAffectedEdges != null) result.numAffectedEdges = numAffectedEdges;
    return result;
  }

  QueryStats._();

  factory QueryStats.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QueryStats.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QueryStats',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'numAffectedNodes')
    ..aInt64(2, _omitFieldNames ? '' : 'numAffectedEdges')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryStats clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QueryStats copyWith(void Function(QueryStats) updates) =>
      super.copyWith((message) => updates(message as QueryStats)) as QueryStats;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QueryStats create() => QueryStats._();
  @$core.override
  QueryStats createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QueryStats getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QueryStats>(create);
  static QueryStats? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get numAffectedNodes => $_getI64(0);
  @$pb.TagNumber(1)
  set numAffectedNodes($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumAffectedNodes() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumAffectedNodes() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get numAffectedEdges => $_getI64(1);
  @$pb.TagNumber(2)
  set numAffectedEdges($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNumAffectedEdges() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumAffectedEdges() => $_clearField(2);
}

class PlanInfo extends $pb.GeneratedMessage {
  factory PlanInfo({
    $core.List<$core.int>? id,
    $core.List<$core.int>? name,
    $core.List<$core.int>? details,
    $core.Iterable<$core.List<$core.int>>? columns,
    $core.double? timeMs,
    $fixnum.Int64? rows,
    $core.double? memoryKib,
    $core.double? blockedMs,
    $core.double? queuedMs,
    $core.double? consumeMs,
    $core.double? produceMs,
    $core.double? finishMs,
    $fixnum.Int64? batches,
    $fixnum.Int64? concurrency,
    $core.List<$core.int>? otherStatsJson,
    $core.Iterable<PlanInfo>? children,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (name != null) result.name = name;
    if (details != null) result.details = details;
    if (columns != null) result.columns.addAll(columns);
    if (timeMs != null) result.timeMs = timeMs;
    if (rows != null) result.rows = rows;
    if (memoryKib != null) result.memoryKib = memoryKib;
    if (blockedMs != null) result.blockedMs = blockedMs;
    if (queuedMs != null) result.queuedMs = queuedMs;
    if (consumeMs != null) result.consumeMs = consumeMs;
    if (produceMs != null) result.produceMs = produceMs;
    if (finishMs != null) result.finishMs = finishMs;
    if (batches != null) result.batches = batches;
    if (concurrency != null) result.concurrency = concurrency;
    if (otherStatsJson != null) result.otherStatsJson = otherStatsJson;
    if (children != null) result.children.addAll(children);
    return result;
  }

  PlanInfo._();

  factory PlanInfo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PlanInfo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PlanInfo',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'id', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'name', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'details', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'columns', $pb.PbFieldType.PY)
    ..aD(5, _omitFieldNames ? '' : 'timeMs')
    ..aInt64(6, _omitFieldNames ? '' : 'rows')
    ..aD(7, _omitFieldNames ? '' : 'memoryKib')
    ..aD(8, _omitFieldNames ? '' : 'blockedMs')
    ..aD(9, _omitFieldNames ? '' : 'queuedMs')
    ..aD(10, _omitFieldNames ? '' : 'consumeMs')
    ..aD(11, _omitFieldNames ? '' : 'produceMs')
    ..aD(12, _omitFieldNames ? '' : 'finishMs')
    ..aInt64(13, _omitFieldNames ? '' : 'batches')
    ..aInt64(14, _omitFieldNames ? '' : 'concurrency')
    ..a<$core.List<$core.int>>(
        15, _omitFieldNames ? '' : 'otherStatsJson', $pb.PbFieldType.OY)
    ..pPM<PlanInfo>(16, _omitFieldNames ? '' : 'children',
        subBuilder: PlanInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlanInfo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PlanInfo copyWith(void Function(PlanInfo) updates) =>
      super.copyWith((message) => updates(message as PlanInfo)) as PlanInfo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PlanInfo create() => PlanInfo._();
  @$core.override
  PlanInfo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PlanInfo getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PlanInfo>(create);
  static PlanInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get id => $_getN(0);
  @$pb.TagNumber(1)
  set id($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get name => $_getN(1);
  @$pb.TagNumber(2)
  set name($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get details => $_getN(2);
  @$pb.TagNumber(3)
  set details($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDetails() => $_has(2);
  @$pb.TagNumber(3)
  void clearDetails() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get columns => $_getList(3);

  @$pb.TagNumber(5)
  $core.double get timeMs => $_getN(4);
  @$pb.TagNumber(5)
  set timeMs($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTimeMs() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeMs() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get rows => $_getI64(5);
  @$pb.TagNumber(6)
  set rows($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRows() => $_has(5);
  @$pb.TagNumber(6)
  void clearRows() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get memoryKib => $_getN(6);
  @$pb.TagNumber(7)
  set memoryKib($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMemoryKib() => $_has(6);
  @$pb.TagNumber(7)
  void clearMemoryKib() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get blockedMs => $_getN(7);
  @$pb.TagNumber(8)
  set blockedMs($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasBlockedMs() => $_has(7);
  @$pb.TagNumber(8)
  void clearBlockedMs() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get queuedMs => $_getN(8);
  @$pb.TagNumber(9)
  set queuedMs($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasQueuedMs() => $_has(8);
  @$pb.TagNumber(9)
  void clearQueuedMs() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get consumeMs => $_getN(9);
  @$pb.TagNumber(10)
  set consumeMs($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasConsumeMs() => $_has(9);
  @$pb.TagNumber(10)
  void clearConsumeMs() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get produceMs => $_getN(10);
  @$pb.TagNumber(11)
  set produceMs($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasProduceMs() => $_has(10);
  @$pb.TagNumber(11)
  void clearProduceMs() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get finishMs => $_getN(11);
  @$pb.TagNumber(12)
  set finishMs($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasFinishMs() => $_has(11);
  @$pb.TagNumber(12)
  void clearFinishMs() => $_clearField(12);

  @$pb.TagNumber(13)
  $fixnum.Int64 get batches => $_getI64(12);
  @$pb.TagNumber(13)
  set batches($fixnum.Int64 value) => $_setInt64(12, value);
  @$pb.TagNumber(13)
  $core.bool hasBatches() => $_has(12);
  @$pb.TagNumber(13)
  void clearBatches() => $_clearField(13);

  @$pb.TagNumber(14)
  $fixnum.Int64 get concurrency => $_getI64(13);
  @$pb.TagNumber(14)
  set concurrency($fixnum.Int64 value) => $_setInt64(13, value);
  @$pb.TagNumber(14)
  $core.bool hasConcurrency() => $_has(13);
  @$pb.TagNumber(14)
  void clearConcurrency() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.List<$core.int> get otherStatsJson => $_getN(14);
  @$pb.TagNumber(15)
  set otherStatsJson($core.List<$core.int> value) => $_setBytes(14, value);
  @$pb.TagNumber(15)
  $core.bool hasOtherStatsJson() => $_has(14);
  @$pb.TagNumber(15)
  void clearOtherStatsJson() => $_clearField(15);

  @$pb.TagNumber(16)
  $pb.PbList<PlanInfo> get children => $_getList(15);
}

class ElapsedTime extends $pb.GeneratedMessage {
  factory ElapsedTime({
    $fixnum.Int64? totalServerTimeUs,
    $fixnum.Int64? buildTimeUs,
    $fixnum.Int64? optimizeTimeUs,
    $fixnum.Int64? serializeTimeUs,
    $fixnum.Int64? parseTimeUs,
  }) {
    final result = create();
    if (totalServerTimeUs != null) result.totalServerTimeUs = totalServerTimeUs;
    if (buildTimeUs != null) result.buildTimeUs = buildTimeUs;
    if (optimizeTimeUs != null) result.optimizeTimeUs = optimizeTimeUs;
    if (serializeTimeUs != null) result.serializeTimeUs = serializeTimeUs;
    if (parseTimeUs != null) result.parseTimeUs = parseTimeUs;
    return result;
  }

  ElapsedTime._();

  factory ElapsedTime.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ElapsedTime.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ElapsedTime',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'totalServerTimeUs')
    ..aInt64(2, _omitFieldNames ? '' : 'buildTimeUs')
    ..aInt64(3, _omitFieldNames ? '' : 'optimizeTimeUs')
    ..aInt64(4, _omitFieldNames ? '' : 'serializeTimeUs')
    ..aInt64(5, _omitFieldNames ? '' : 'parseTimeUs')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ElapsedTime clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ElapsedTime copyWith(void Function(ElapsedTime) updates) =>
      super.copyWith((message) => updates(message as ElapsedTime))
          as ElapsedTime;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ElapsedTime create() => ElapsedTime._();
  @$core.override
  ElapsedTime createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ElapsedTime getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ElapsedTime>(create);
  static ElapsedTime? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get totalServerTimeUs => $_getI64(0);
  @$pb.TagNumber(1)
  set totalServerTimeUs($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalServerTimeUs() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalServerTimeUs() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get buildTimeUs => $_getI64(1);
  @$pb.TagNumber(2)
  set buildTimeUs($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBuildTimeUs() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuildTimeUs() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get optimizeTimeUs => $_getI64(2);
  @$pb.TagNumber(3)
  set optimizeTimeUs($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOptimizeTimeUs() => $_has(2);
  @$pb.TagNumber(3)
  void clearOptimizeTimeUs() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get serializeTimeUs => $_getI64(3);
  @$pb.TagNumber(4)
  set serializeTimeUs($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSerializeTimeUs() => $_has(3);
  @$pb.TagNumber(4)
  void clearSerializeTimeUs() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get parseTimeUs => $_getI64(4);
  @$pb.TagNumber(5)
  set parseTimeUs($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasParseTimeUs() => $_has(4);
  @$pb.TagNumber(5)
  void clearParseTimeUs() => $_clearField(5);
}

class Summary extends $pb.GeneratedMessage {
  factory Summary({
    ElapsedTime? elapsedTime,
    $core.List<$core.int>? explainType,
    PlanInfo? planInfo,
    QueryStats? queryStats,
    $core.List<$core.int>? logStream,
  }) {
    final result = create();
    if (elapsedTime != null) result.elapsedTime = elapsedTime;
    if (explainType != null) result.explainType = explainType;
    if (planInfo != null) result.planInfo = planInfo;
    if (queryStats != null) result.queryStats = queryStats;
    if (logStream != null) result.logStream = logStream;
    return result;
  }

  Summary._();

  factory Summary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Summary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Summary',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..aOM<ElapsedTime>(1, _omitFieldNames ? '' : 'elapsedTime',
        subBuilder: ElapsedTime.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'explainType', $pb.PbFieldType.OY)
    ..aOM<PlanInfo>(3, _omitFieldNames ? '' : 'planInfo',
        subBuilder: PlanInfo.create)
    ..aOM<QueryStats>(4, _omitFieldNames ? '' : 'queryStats',
        subBuilder: QueryStats.create)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'logStream', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Summary clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Summary copyWith(void Function(Summary) updates) =>
      super.copyWith((message) => updates(message as Summary)) as Summary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Summary create() => Summary._();
  @$core.override
  Summary createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Summary getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Summary>(create);
  static Summary? _defaultInstance;

  @$pb.TagNumber(1)
  ElapsedTime get elapsedTime => $_getN(0);
  @$pb.TagNumber(1)
  set elapsedTime(ElapsedTime value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasElapsedTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearElapsedTime() => $_clearField(1);
  @$pb.TagNumber(1)
  ElapsedTime ensureElapsedTime() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.List<$core.int> get explainType => $_getN(1);
  @$pb.TagNumber(2)
  set explainType($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasExplainType() => $_has(1);
  @$pb.TagNumber(2)
  void clearExplainType() => $_clearField(2);

  @$pb.TagNumber(3)
  PlanInfo get planInfo => $_getN(2);
  @$pb.TagNumber(3)
  set planInfo(PlanInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPlanInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlanInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  PlanInfo ensurePlanInfo() => $_ensure(2);

  @$pb.TagNumber(4)
  QueryStats get queryStats => $_getN(3);
  @$pb.TagNumber(4)
  set queryStats(QueryStats value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasQueryStats() => $_has(3);
  @$pb.TagNumber(4)
  void clearQueryStats() => $_clearField(4);
  @$pb.TagNumber(4)
  QueryStats ensureQueryStats() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.List<$core.int> get logStream => $_getN(4);
  @$pb.TagNumber(5)
  set logStream($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLogStream() => $_has(4);
  @$pb.TagNumber(5)
  void clearLogStream() => $_clearField(5);
}

class ExecuteRequest extends $pb.GeneratedMessage {
  factory ExecuteRequest({
    $fixnum.Int64? sessionId,
    $core.List<$core.int>? stmt,
  }) {
    final result = create();
    if (sessionId != null) result.sessionId = sessionId;
    if (stmt != null) result.stmt = stmt;
    return result;
  }

  ExecuteRequest._();

  factory ExecuteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecuteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecuteRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'sessionId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'stmt', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteRequest copyWith(void Function(ExecuteRequest) updates) =>
      super.copyWith((message) => updates(message as ExecuteRequest))
          as ExecuteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteRequest create() => ExecuteRequest._();
  @$core.override
  ExecuteRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecuteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecuteRequest>(create);
  static ExecuteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get sessionId => $_getI64(0);
  @$pb.TagNumber(1)
  set sessionId($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSessionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get stmt => $_getN(1);
  @$pb.TagNumber(2)
  set stmt($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStmt() => $_has(1);
  @$pb.TagNumber(2)
  void clearStmt() => $_clearField(2);
}

class ExecuteResponse extends $pb.GeneratedMessage {
  factory ExecuteResponse({
    $1.Status? status,
    $2.VectorResultTable? result,
    Summary? summary,
    $core.List<$core.int>? cursor,
  }) {
    final result$ = create();
    if (status != null) result$.status = status;
    if (result != null) result$.result = result;
    if (summary != null) result$.summary = summary;
    if (cursor != null) result$.cursor = cursor;
    return result$;
  }

  ExecuteResponse._();

  factory ExecuteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExecuteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExecuteResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..aOM<$1.Status>(1, _omitFieldNames ? '' : 'status',
        subBuilder: $1.Status.create)
    ..aOM<$2.VectorResultTable>(2, _omitFieldNames ? '' : 'result',
        subBuilder: $2.VectorResultTable.create)
    ..aOM<Summary>(3, _omitFieldNames ? '' : 'summary',
        subBuilder: Summary.create)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'cursor', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExecuteResponse copyWith(void Function(ExecuteResponse) updates) =>
      super.copyWith((message) => updates(message as ExecuteResponse))
          as ExecuteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExecuteResponse create() => ExecuteResponse._();
  @$core.override
  ExecuteResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExecuteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExecuteResponse>(create);
  static ExecuteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($1.Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Status ensureStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $2.VectorResultTable get result => $_getN(1);
  @$pb.TagNumber(2)
  set result($2.VectorResultTable value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.VectorResultTable ensureResult() => $_ensure(1);

  @$pb.TagNumber(3)
  Summary get summary => $_getN(2);
  @$pb.TagNumber(3)
  set summary(Summary value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSummary() => $_clearField(3);
  @$pb.TagNumber(3)
  Summary ensureSummary() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.List<$core.int> get cursor => $_getN(3);
  @$pb.TagNumber(4)
  set cursor($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCursor() => $_has(3);
  @$pb.TagNumber(4)
  void clearCursor() => $_clearField(4);
}

class AuthRequest extends $pb.GeneratedMessage {
  factory AuthRequest({
    $core.List<$core.int>? username,
    $core.List<$core.int>? authInfo,
    $1.ClientInfo? clientInfo,
  }) {
    final result = create();
    if (username != null) result.username = username;
    if (authInfo != null) result.authInfo = authInfo;
    if (clientInfo != null) result.clientInfo = clientInfo;
    return result;
  }

  AuthRequest._();

  factory AuthRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthRequest',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'username', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'authInfo', $pb.PbFieldType.OY)
    ..aOM<$1.ClientInfo>(3, _omitFieldNames ? '' : 'clientInfo',
        subBuilder: $1.ClientInfo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthRequest copyWith(void Function(AuthRequest) updates) =>
      super.copyWith((message) => updates(message as AuthRequest))
          as AuthRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthRequest create() => AuthRequest._();
  @$core.override
  AuthRequest createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthRequest>(create);
  static AuthRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get username => $_getN(0);
  @$pb.TagNumber(1)
  set username($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUsername() => $_has(0);
  @$pb.TagNumber(1)
  void clearUsername() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get authInfo => $_getN(1);
  @$pb.TagNumber(2)
  set authInfo($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAuthInfo() => $_has(1);
  @$pb.TagNumber(2)
  void clearAuthInfo() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.ClientInfo get clientInfo => $_getN(2);
  @$pb.TagNumber(3)
  set clientInfo($1.ClientInfo value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasClientInfo() => $_has(2);
  @$pb.TagNumber(3)
  void clearClientInfo() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.ClientInfo ensureClientInfo() => $_ensure(2);
}

class AuthResponse extends $pb.GeneratedMessage {
  factory AuthResponse({
    $1.Status? status,
    $fixnum.Int64? sessionId,
    $core.List<$core.int>? version,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (sessionId != null) result.sessionId = sessionId;
    if (version != null) result.version = version;
    return result;
  }

  AuthResponse._();

  factory AuthResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AuthResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AuthResponse',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.graph'),
      createEmptyInstance: create)
    ..aOM<$1.Status>(1, _omitFieldNames ? '' : 'status',
        subBuilder: $1.Status.create)
    ..aInt64(2, _omitFieldNames ? '' : 'sessionId')
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AuthResponse copyWith(void Function(AuthResponse) updates) =>
      super.copyWith((message) => updates(message as AuthResponse))
          as AuthResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AuthResponse create() => AuthResponse._();
  @$core.override
  AuthResponse createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AuthResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AuthResponse>(create);
  static AuthResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Status get status => $_getN(0);
  @$pb.TagNumber(1)
  set status($1.Status value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);
  @$pb.TagNumber(1)
  $1.Status ensureStatus() => $_ensure(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get sessionId => $_getI64(1);
  @$pb.TagNumber(2)
  set sessionId($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSessionId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSessionId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get version => $_getN(2);
  @$pb.TagNumber(3)
  set version($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
