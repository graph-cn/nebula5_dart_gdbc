// This is a generated file - do not edit.
//
// Generated from vector.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Row extends $pb.GeneratedMessage {
  factory Row({
    $core.Iterable<$0.Value>? values,
  }) {
    final result = create();
    if (values != null) result.values.addAll(values);
    return result;
  }

  Row._();

  factory Row.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Row.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Row',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..pPM<$0.Value>(1, _omitFieldNames ? '' : 'values',
        subBuilder: $0.Value.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Row clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Row copyWith(void Function(Row) updates) =>
      super.copyWith((message) => updates(message as Row)) as Row;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Row create() => Row._();
  @$core.override
  Row createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Row getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Row>(create);
  static Row? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$0.Value> get values => $_getList(0);
}

class ValueType extends $pb.GeneratedMessage {
  factory ValueType({
    $core.List<$core.int>? valueType,
  }) {
    final result = create();
    if (valueType != null) result.valueType = valueType;
    return result;
  }

  ValueType._();

  factory ValueType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValueType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValueType',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'valueType', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValueType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValueType copyWith(void Function(ValueType) updates) =>
      super.copyWith((message) => updates(message as ValueType)) as ValueType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValueType create() => ValueType._();
  @$core.override
  ValueType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ValueType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ValueType>(create);
  static ValueType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get valueType => $_getN(0);
  @$pb.TagNumber(1)
  set valueType($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasValueType() => $_has(0);
  @$pb.TagNumber(1)
  void clearValueType() => $_clearField(1);
}

class RowType extends $pb.GeneratedMessage {
  factory RowType({
    $core.int? numColumns,
    $core.Iterable<$core.String>? columnNames,
    $core.Iterable<ValueType>? columnTypes,
  }) {
    final result = create();
    if (numColumns != null) result.numColumns = numColumns;
    if (columnNames != null) result.columnNames.addAll(columnNames);
    if (columnTypes != null) result.columnTypes.addAll(columnTypes);
    return result;
  }

  RowType._();

  factory RowType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RowType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RowType',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numColumns', fieldType: $pb.PbFieldType.OU3)
    ..pPS(2, _omitFieldNames ? '' : 'columnNames')
    ..pPM<ValueType>(3, _omitFieldNames ? '' : 'columnTypes',
        subBuilder: ValueType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RowType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RowType copyWith(void Function(RowType) updates) =>
      super.copyWith((message) => updates(message as RowType)) as RowType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RowType create() => RowType._();
  @$core.override
  RowType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RowType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RowType>(create);
  static RowType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numColumns => $_getIZ(0);
  @$pb.TagNumber(1)
  set numColumns($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumColumns() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumColumns() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get columnNames => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<ValueType> get columnTypes => $_getList(2);
}

class VectorCommonMetaData extends $pb.GeneratedMessage {
  factory VectorCommonMetaData({
    $core.int? numRecords,
    $core.int? vectorContentType,
  }) {
    final result = create();
    if (numRecords != null) result.numRecords = numRecords;
    if (vectorContentType != null) result.vectorContentType = vectorContentType;
    return result;
  }

  VectorCommonMetaData._();

  factory VectorCommonMetaData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VectorCommonMetaData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VectorCommonMetaData',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numRecords', fieldType: $pb.PbFieldType.OU3)
    ..aI(2, _omitFieldNames ? '' : 'vectorContentType',
        fieldType: $pb.PbFieldType.OU3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorCommonMetaData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorCommonMetaData copyWith(void Function(VectorCommonMetaData) updates) =>
      super.copyWith((message) => updates(message as VectorCommonMetaData))
          as VectorCommonMetaData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VectorCommonMetaData create() => VectorCommonMetaData._();
  @$core.override
  VectorCommonMetaData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VectorCommonMetaData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VectorCommonMetaData>(create);
  static VectorCommonMetaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numRecords => $_getIZ(0);
  @$pb.TagNumber(1)
  set numRecords($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumRecords() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumRecords() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get vectorContentType => $_getIZ(1);
  @$pb.TagNumber(2)
  set vectorContentType($core.int value) => $_setUnsignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVectorContentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearVectorContentType() => $_clearField(2);
}

/// Schema for a node type.
/// Properties are not stored here. they are stored in the row type, if any.
class NodeType extends $pb.GeneratedMessage {
  factory NodeType({
    $core.int? nodeTypeId,
    $core.List<$core.int>? nodeTypeName,
    $core.Iterable<$core.List<$core.int>>? label,
  }) {
    final result = create();
    if (nodeTypeId != null) result.nodeTypeId = nodeTypeId;
    if (nodeTypeName != null) result.nodeTypeName = nodeTypeName;
    if (label != null) result.label.addAll(label);
    return result;
  }

  NodeType._();

  factory NodeType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NodeType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NodeType',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'nodeTypeId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'nodeTypeName', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'label', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NodeType copyWith(void Function(NodeType) updates) =>
      super.copyWith((message) => updates(message as NodeType)) as NodeType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NodeType create() => NodeType._();
  @$core.override
  NodeType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NodeType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NodeType>(create);
  static NodeType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get nodeTypeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set nodeTypeId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNodeTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeTypeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get nodeTypeName => $_getN(1);
  @$pb.TagNumber(2)
  set nodeTypeName($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNodeTypeName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNodeTypeName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get label => $_getList(2);
}

/// for an edge type
class EdgeType extends $pb.GeneratedMessage {
  factory EdgeType({
    $core.int? edgeTypeId,
    $core.List<$core.int>? edgeTypeName,
    $core.Iterable<$core.List<$core.int>>? label,
  }) {
    final result = create();
    if (edgeTypeId != null) result.edgeTypeId = edgeTypeId;
    if (edgeTypeName != null) result.edgeTypeName = edgeTypeName;
    if (label != null) result.label.addAll(label);
    return result;
  }

  EdgeType._();

  factory EdgeType.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory EdgeType.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'EdgeType',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'edgeTypeId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'edgeTypeName', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'label', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EdgeType clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  EdgeType copyWith(void Function(EdgeType) updates) =>
      super.copyWith((message) => updates(message as EdgeType)) as EdgeType;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static EdgeType create() => EdgeType._();
  @$core.override
  EdgeType createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static EdgeType getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<EdgeType>(create);
  static EdgeType? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get edgeTypeId => $_getIZ(0);
  @$pb.TagNumber(1)
  set edgeTypeId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEdgeTypeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearEdgeTypeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get edgeTypeName => $_getN(1);
  @$pb.TagNumber(2)
  set edgeTypeName($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEdgeTypeName() => $_has(1);
  @$pb.TagNumber(2)
  void clearEdgeTypeName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get label => $_getList(2);
}

class PropertyGraphSchema extends $pb.GeneratedMessage {
  factory PropertyGraphSchema({
    $core.int? graphId,
    $core.List<$core.int>? graphName,
    $core.Iterable<NodeType>? nodeType,
    $core.Iterable<EdgeType>? edgeType,
  }) {
    final result = create();
    if (graphId != null) result.graphId = graphId;
    if (graphName != null) result.graphName = graphName;
    if (nodeType != null) result.nodeType.addAll(nodeType);
    if (edgeType != null) result.edgeType.addAll(edgeType);
    return result;
  }

  PropertyGraphSchema._();

  factory PropertyGraphSchema.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PropertyGraphSchema.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PropertyGraphSchema',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'graphId')
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'graphName', $pb.PbFieldType.OY)
    ..pPM<NodeType>(3, _omitFieldNames ? '' : 'nodeType',
        subBuilder: NodeType.create)
    ..pPM<EdgeType>(4, _omitFieldNames ? '' : 'edgeType',
        subBuilder: EdgeType.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PropertyGraphSchema clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PropertyGraphSchema copyWith(void Function(PropertyGraphSchema) updates) =>
      super.copyWith((message) => updates(message as PropertyGraphSchema))
          as PropertyGraphSchema;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PropertyGraphSchema create() => PropertyGraphSchema._();
  @$core.override
  PropertyGraphSchema createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PropertyGraphSchema getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PropertyGraphSchema>(create);
  static PropertyGraphSchema? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get graphId => $_getIZ(0);
  @$pb.TagNumber(1)
  set graphId($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGraphId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGraphId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get graphName => $_getN(1);
  @$pb.TagNumber(2)
  set graphName($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGraphName() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraphName() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<NodeType> get nodeType => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<EdgeType> get edgeType => $_getList(3);
}

class VectorTableMetaData extends $pb.GeneratedMessage {
  factory VectorTableMetaData({
    $core.int? tableType,
    $fixnum.Int64? numRecords,
    RowType? rowType,
    $core.int? numBatches,
    $core.int? timeZoneOffset,
    $core.bool? isLittleEndian,
    $core.Iterable<PropertyGraphSchema>? graphSchema,
  }) {
    final result = create();
    if (tableType != null) result.tableType = tableType;
    if (numRecords != null) result.numRecords = numRecords;
    if (rowType != null) result.rowType = rowType;
    if (numBatches != null) result.numBatches = numBatches;
    if (timeZoneOffset != null) result.timeZoneOffset = timeZoneOffset;
    if (isLittleEndian != null) result.isLittleEndian = isLittleEndian;
    if (graphSchema != null) result.graphSchema.addAll(graphSchema);
    return result;
  }

  VectorTableMetaData._();

  factory VectorTableMetaData.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VectorTableMetaData.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VectorTableMetaData',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'tableType', fieldType: $pb.PbFieldType.OU3)
    ..a<$fixnum.Int64>(
        2, _omitFieldNames ? '' : 'numRecords', $pb.PbFieldType.OU6,
        defaultOrMaker: $fixnum.Int64.ZERO)
    ..aOM<RowType>(3, _omitFieldNames ? '' : 'rowType',
        subBuilder: RowType.create)
    ..aI(4, _omitFieldNames ? '' : 'numBatches', fieldType: $pb.PbFieldType.OU3)
    ..aI(5, _omitFieldNames ? '' : 'timeZoneOffset',
        fieldType: $pb.PbFieldType.OU3)
    ..aOB(6, _omitFieldNames ? '' : 'isLittleEndian')
    ..pPM<PropertyGraphSchema>(7, _omitFieldNames ? '' : 'graphSchema',
        subBuilder: PropertyGraphSchema.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorTableMetaData clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorTableMetaData copyWith(void Function(VectorTableMetaData) updates) =>
      super.copyWith((message) => updates(message as VectorTableMetaData))
          as VectorTableMetaData;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VectorTableMetaData create() => VectorTableMetaData._();
  @$core.override
  VectorTableMetaData createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VectorTableMetaData getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VectorTableMetaData>(create);
  static VectorTableMetaData? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get tableType => $_getIZ(0);
  @$pb.TagNumber(1)
  set tableType($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTableType() => $_has(0);
  @$pb.TagNumber(1)
  void clearTableType() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get numRecords => $_getI64(1);
  @$pb.TagNumber(2)
  set numRecords($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNumRecords() => $_has(1);
  @$pb.TagNumber(2)
  void clearNumRecords() => $_clearField(2);

  @$pb.TagNumber(3)
  RowType get rowType => $_getN(2);
  @$pb.TagNumber(3)
  set rowType(RowType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasRowType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRowType() => $_clearField(3);
  @$pb.TagNumber(3)
  RowType ensureRowType() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get numBatches => $_getIZ(3);
  @$pb.TagNumber(4)
  set numBatches($core.int value) => $_setUnsignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNumBatches() => $_has(3);
  @$pb.TagNumber(4)
  void clearNumBatches() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get timeZoneOffset => $_getIZ(4);
  @$pb.TagNumber(5)
  set timeZoneOffset($core.int value) => $_setUnsignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTimeZoneOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearTimeZoneOffset() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.bool get isLittleEndian => $_getBF(5);
  @$pb.TagNumber(6)
  set isLittleEndian($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsLittleEndian() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsLittleEndian() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<PropertyGraphSchema> get graphSchema => $_getList(6);
}

class NestedVector extends $pb.GeneratedMessage {
  factory NestedVector({
    $core.int? numNestedVectors,
    VectorCommonMetaData? commonMetaData,
    $core.List<$core.int>? specialMetaData,
    $core.List<$core.int>? vectorData,
    $core.List<$core.int>? nullBitMap,
    $core.Iterable<NestedVector>? nestedVectors,
  }) {
    final result = create();
    if (numNestedVectors != null) result.numNestedVectors = numNestedVectors;
    if (commonMetaData != null) result.commonMetaData = commonMetaData;
    if (specialMetaData != null) result.specialMetaData = specialMetaData;
    if (vectorData != null) result.vectorData = vectorData;
    if (nullBitMap != null) result.nullBitMap = nullBitMap;
    if (nestedVectors != null) result.nestedVectors.addAll(nestedVectors);
    return result;
  }

  NestedVector._();

  factory NestedVector.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NestedVector.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NestedVector',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'numNestedVectors',
        fieldType: $pb.PbFieldType.OU3)
    ..aOM<VectorCommonMetaData>(2, _omitFieldNames ? '' : 'commonMetaData',
        subBuilder: VectorCommonMetaData.create)
    ..a<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'specialMetaData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'vectorData', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(
        5, _omitFieldNames ? '' : 'nullBitMap', $pb.PbFieldType.OY)
    ..pPM<NestedVector>(6, _omitFieldNames ? '' : 'nestedVectors',
        subBuilder: NestedVector.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NestedVector clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NestedVector copyWith(void Function(NestedVector) updates) =>
      super.copyWith((message) => updates(message as NestedVector))
          as NestedVector;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NestedVector create() => NestedVector._();
  @$core.override
  NestedVector createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NestedVector getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NestedVector>(create);
  static NestedVector? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get numNestedVectors => $_getIZ(0);
  @$pb.TagNumber(1)
  set numNestedVectors($core.int value) => $_setUnsignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasNumNestedVectors() => $_has(0);
  @$pb.TagNumber(1)
  void clearNumNestedVectors() => $_clearField(1);

  @$pb.TagNumber(2)
  VectorCommonMetaData get commonMetaData => $_getN(1);
  @$pb.TagNumber(2)
  set commonMetaData(VectorCommonMetaData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCommonMetaData() => $_has(1);
  @$pb.TagNumber(2)
  void clearCommonMetaData() => $_clearField(2);
  @$pb.TagNumber(2)
  VectorCommonMetaData ensureCommonMetaData() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.List<$core.int> get specialMetaData => $_getN(2);
  @$pb.TagNumber(3)
  set specialMetaData($core.List<$core.int> value) => $_setBytes(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSpecialMetaData() => $_has(2);
  @$pb.TagNumber(3)
  void clearSpecialMetaData() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get vectorData => $_getN(3);
  @$pb.TagNumber(4)
  set vectorData($core.List<$core.int> value) => $_setBytes(3, value);
  @$pb.TagNumber(4)
  $core.bool hasVectorData() => $_has(3);
  @$pb.TagNumber(4)
  void clearVectorData() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get nullBitMap => $_getN(4);
  @$pb.TagNumber(5)
  set nullBitMap($core.List<$core.int> value) => $_setBytes(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNullBitMap() => $_has(4);
  @$pb.TagNumber(5)
  void clearNullBitMap() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<NestedVector> get nestedVectors => $_getList(5);
}

class VectorBatch extends $pb.GeneratedMessage {
  factory VectorBatch({
    $core.Iterable<NestedVector>? vectors,
  }) {
    final result = create();
    if (vectors != null) result.vectors.addAll(vectors);
    return result;
  }

  VectorBatch._();

  factory VectorBatch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VectorBatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VectorBatch',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..pPM<NestedVector>(1, _omitFieldNames ? '' : 'vectors',
        subBuilder: NestedVector.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorBatch clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorBatch copyWith(void Function(VectorBatch) updates) =>
      super.copyWith((message) => updates(message as VectorBatch))
          as VectorBatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VectorBatch create() => VectorBatch._();
  @$core.override
  VectorBatch createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VectorBatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VectorBatch>(create);
  static VectorBatch? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<NestedVector> get vectors => $_getList(0);
}

class VectorResultTable extends $pb.GeneratedMessage {
  factory VectorResultTable({
    $core.List<$core.int>? dataLayoutVersion,
    VectorTableMetaData? meta,
    $core.Iterable<VectorBatch>? batch,
  }) {
    final result = create();
    if (dataLayoutVersion != null) result.dataLayoutVersion = dataLayoutVersion;
    if (meta != null) result.meta = meta;
    if (batch != null) result.batch.addAll(batch);
    return result;
  }

  VectorResultTable._();

  factory VectorResultTable.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VectorResultTable.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VectorResultTable',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..a<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'dataLayoutVersion', $pb.PbFieldType.OY)
    ..aOM<VectorTableMetaData>(2, _omitFieldNames ? '' : 'meta',
        subBuilder: VectorTableMetaData.create)
    ..pPM<VectorBatch>(3, _omitFieldNames ? '' : 'batch',
        subBuilder: VectorBatch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorResultTable clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VectorResultTable copyWith(void Function(VectorResultTable) updates) =>
      super.copyWith((message) => updates(message as VectorResultTable))
          as VectorResultTable;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VectorResultTable create() => VectorResultTable._();
  @$core.override
  VectorResultTable createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VectorResultTable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VectorResultTable>(create);
  static VectorResultTable? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get dataLayoutVersion => $_getN(0);
  @$pb.TagNumber(1)
  set dataLayoutVersion($core.List<$core.int> value) => $_setBytes(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDataLayoutVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearDataLayoutVersion() => $_clearField(1);

  @$pb.TagNumber(2)
  VectorTableMetaData get meta => $_getN(1);
  @$pb.TagNumber(2)
  set meta(VectorTableMetaData value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMeta() => $_has(1);
  @$pb.TagNumber(2)
  void clearMeta() => $_clearField(2);
  @$pb.TagNumber(2)
  VectorTableMetaData ensureMeta() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<VectorBatch> get batch => $_getList(2);
}

class ResultTable extends $pb.GeneratedMessage {
  factory ResultTable({
    $core.Iterable<$core.List<$core.int>>? columnNames,
    $core.Iterable<Row>? records,
  }) {
    final result = create();
    if (columnNames != null) result.columnNames.addAll(columnNames);
    if (records != null) result.records.addAll(records);
    return result;
  }

  ResultTable._();

  factory ResultTable.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResultTable.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResultTable',
      package:
          const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.vector'),
      createEmptyInstance: create)
    ..p<$core.List<$core.int>>(
        1, _omitFieldNames ? '' : 'columnNames', $pb.PbFieldType.PY)
    ..pPM<Row>(2, _omitFieldNames ? '' : 'records', subBuilder: Row.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResultTable clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResultTable copyWith(void Function(ResultTable) updates) =>
      super.copyWith((message) => updates(message as ResultTable))
          as ResultTable;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResultTable create() => ResultTable._();
  @$core.override
  ResultTable createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ResultTable getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResultTable>(create);
  static ResultTable? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.List<$core.int>> get columnNames => $_getList(0);

  @$pb.TagNumber(2)
  $pb.PbList<Row> get records => $_getList(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
