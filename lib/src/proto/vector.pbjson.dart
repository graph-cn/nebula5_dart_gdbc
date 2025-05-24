//
//  Generated code. Do not modify.
//  source: vector.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use rowDescriptor instead')
const Row$json = {
  '1': 'Row',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nebula.proto.common.Value', '10': 'values'},
  ],
};

/// Descriptor for `Row`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rowDescriptor = $convert.base64Decode(
    'CgNSb3cSMgoGdmFsdWVzGAEgAygLMhoubmVidWxhLnByb3RvLmNvbW1vbi5WYWx1ZVIGdmFsdW'
    'Vz');

@$core.Deprecated('Use valueTypeDescriptor instead')
const ValueType$json = {
  '1': 'ValueType',
  '2': [
    {'1': 'value_type', '3': 1, '4': 1, '5': 12, '10': 'valueType'},
  ],
};

/// Descriptor for `ValueType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueTypeDescriptor = $convert.base64Decode(
    'CglWYWx1ZVR5cGUSHQoKdmFsdWVfdHlwZRgBIAEoDFIJdmFsdWVUeXBl');

@$core.Deprecated('Use rowTypeDescriptor instead')
const RowType$json = {
  '1': 'RowType',
  '2': [
    {'1': 'num_columns', '3': 1, '4': 1, '5': 13, '10': 'numColumns'},
    {'1': 'column_names', '3': 2, '4': 3, '5': 9, '10': 'columnNames'},
    {'1': 'column_types', '3': 3, '4': 3, '5': 11, '6': '.nebula.proto.vector.ValueType', '10': 'columnTypes'},
  ],
};

/// Descriptor for `RowType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List rowTypeDescriptor = $convert.base64Decode(
    'CgdSb3dUeXBlEh8KC251bV9jb2x1bW5zGAEgASgNUgpudW1Db2x1bW5zEiEKDGNvbHVtbl9uYW'
    '1lcxgCIAMoCVILY29sdW1uTmFtZXMSQQoMY29sdW1uX3R5cGVzGAMgAygLMh4ubmVidWxhLnBy'
    'b3RvLnZlY3Rvci5WYWx1ZVR5cGVSC2NvbHVtblR5cGVz');

@$core.Deprecated('Use vectorCommonMetaDataDescriptor instead')
const VectorCommonMetaData$json = {
  '1': 'VectorCommonMetaData',
  '2': [
    {'1': 'num_records', '3': 1, '4': 1, '5': 13, '10': 'numRecords'},
    {'1': 'vector_content_type', '3': 2, '4': 1, '5': 13, '10': 'vectorContentType'},
  ],
};

/// Descriptor for `VectorCommonMetaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vectorCommonMetaDataDescriptor = $convert.base64Decode(
    'ChRWZWN0b3JDb21tb25NZXRhRGF0YRIfCgtudW1fcmVjb3JkcxgBIAEoDVIKbnVtUmVjb3Jkcx'
    'IuChN2ZWN0b3JfY29udGVudF90eXBlGAIgASgNUhF2ZWN0b3JDb250ZW50VHlwZQ==');

@$core.Deprecated('Use nodeTypeDescriptor instead')
const NodeType$json = {
  '1': 'NodeType',
  '2': [
    {'1': 'node_type_id', '3': 1, '4': 1, '5': 5, '10': 'nodeTypeId'},
    {'1': 'node_type_name', '3': 2, '4': 1, '5': 12, '10': 'nodeTypeName'},
    {'1': 'label', '3': 3, '4': 3, '5': 12, '10': 'label'},
  ],
};

/// Descriptor for `NodeType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeTypeDescriptor = $convert.base64Decode(
    'CghOb2RlVHlwZRIgCgxub2RlX3R5cGVfaWQYASABKAVSCm5vZGVUeXBlSWQSJAoObm9kZV90eX'
    'BlX25hbWUYAiABKAxSDG5vZGVUeXBlTmFtZRIUCgVsYWJlbBgDIAMoDFIFbGFiZWw=');

@$core.Deprecated('Use edgeTypeDescriptor instead')
const EdgeType$json = {
  '1': 'EdgeType',
  '2': [
    {'1': 'edge_type_id', '3': 1, '4': 1, '5': 5, '10': 'edgeTypeId'},
    {'1': 'edge_type_name', '3': 2, '4': 1, '5': 12, '10': 'edgeTypeName'},
    {'1': 'label', '3': 3, '4': 3, '5': 12, '10': 'label'},
  ],
};

/// Descriptor for `EdgeType`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List edgeTypeDescriptor = $convert.base64Decode(
    'CghFZGdlVHlwZRIgCgxlZGdlX3R5cGVfaWQYASABKAVSCmVkZ2VUeXBlSWQSJAoOZWRnZV90eX'
    'BlX25hbWUYAiABKAxSDGVkZ2VUeXBlTmFtZRIUCgVsYWJlbBgDIAMoDFIFbGFiZWw=');

@$core.Deprecated('Use propertyGraphSchemaDescriptor instead')
const PropertyGraphSchema$json = {
  '1': 'PropertyGraphSchema',
  '2': [
    {'1': 'graph_id', '3': 1, '4': 1, '5': 5, '10': 'graphId'},
    {'1': 'graph_name', '3': 2, '4': 1, '5': 12, '10': 'graphName'},
    {'1': 'node_type', '3': 3, '4': 3, '5': 11, '6': '.nebula.proto.vector.NodeType', '10': 'nodeType'},
    {'1': 'edge_type', '3': 4, '4': 3, '5': 11, '6': '.nebula.proto.vector.EdgeType', '10': 'edgeType'},
  ],
};

/// Descriptor for `PropertyGraphSchema`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List propertyGraphSchemaDescriptor = $convert.base64Decode(
    'ChNQcm9wZXJ0eUdyYXBoU2NoZW1hEhkKCGdyYXBoX2lkGAEgASgFUgdncmFwaElkEh0KCmdyYX'
    'BoX25hbWUYAiABKAxSCWdyYXBoTmFtZRI6Cglub2RlX3R5cGUYAyADKAsyHS5uZWJ1bGEucHJv'
    'dG8udmVjdG9yLk5vZGVUeXBlUghub2RlVHlwZRI6CgllZGdlX3R5cGUYBCADKAsyHS5uZWJ1bG'
    'EucHJvdG8udmVjdG9yLkVkZ2VUeXBlUghlZGdlVHlwZQ==');

@$core.Deprecated('Use vectorTableMetaDataDescriptor instead')
const VectorTableMetaData$json = {
  '1': 'VectorTableMetaData',
  '2': [
    {'1': 'table_type', '3': 1, '4': 1, '5': 13, '10': 'tableType'},
    {'1': 'num_records', '3': 2, '4': 1, '5': 4, '10': 'numRecords'},
    {'1': 'row_type', '3': 3, '4': 1, '5': 11, '6': '.nebula.proto.vector.RowType', '10': 'rowType'},
    {'1': 'num_batches', '3': 4, '4': 1, '5': 13, '10': 'numBatches'},
    {'1': 'time_zone_offset', '3': 5, '4': 1, '5': 13, '10': 'timeZoneOffset'},
    {'1': 'is_little_endian', '3': 6, '4': 1, '5': 8, '10': 'isLittleEndian'},
    {'1': 'graph_schema', '3': 7, '4': 3, '5': 11, '6': '.nebula.proto.vector.PropertyGraphSchema', '10': 'graphSchema'},
  ],
};

/// Descriptor for `VectorTableMetaData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vectorTableMetaDataDescriptor = $convert.base64Decode(
    'ChNWZWN0b3JUYWJsZU1ldGFEYXRhEh0KCnRhYmxlX3R5cGUYASABKA1SCXRhYmxlVHlwZRIfCg'
    'tudW1fcmVjb3JkcxgCIAEoBFIKbnVtUmVjb3JkcxI3Cghyb3dfdHlwZRgDIAEoCzIcLm5lYnVs'
    'YS5wcm90by52ZWN0b3IuUm93VHlwZVIHcm93VHlwZRIfCgtudW1fYmF0Y2hlcxgEIAEoDVIKbn'
    'VtQmF0Y2hlcxIoChB0aW1lX3pvbmVfb2Zmc2V0GAUgASgNUg50aW1lWm9uZU9mZnNldBIoChBp'
    'c19saXR0bGVfZW5kaWFuGAYgASgIUg5pc0xpdHRsZUVuZGlhbhJLCgxncmFwaF9zY2hlbWEYBy'
    'ADKAsyKC5uZWJ1bGEucHJvdG8udmVjdG9yLlByb3BlcnR5R3JhcGhTY2hlbWFSC2dyYXBoU2No'
    'ZW1h');

@$core.Deprecated('Use nestedVectorDescriptor instead')
const NestedVector$json = {
  '1': 'NestedVector',
  '2': [
    {'1': 'num_nested_vectors', '3': 1, '4': 1, '5': 13, '10': 'numNestedVectors'},
    {'1': 'common_meta_data', '3': 2, '4': 1, '5': 11, '6': '.nebula.proto.vector.VectorCommonMetaData', '10': 'commonMetaData'},
    {'1': 'special_meta_data', '3': 3, '4': 1, '5': 12, '10': 'specialMetaData'},
    {'1': 'vector_data', '3': 4, '4': 1, '5': 12, '10': 'vectorData'},
    {'1': 'null_bit_map', '3': 5, '4': 1, '5': 12, '10': 'nullBitMap'},
    {'1': 'nested_vectors', '3': 6, '4': 3, '5': 11, '6': '.nebula.proto.vector.NestedVector', '10': 'nestedVectors'},
  ],
};

/// Descriptor for `NestedVector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nestedVectorDescriptor = $convert.base64Decode(
    'CgxOZXN0ZWRWZWN0b3ISLAoSbnVtX25lc3RlZF92ZWN0b3JzGAEgASgNUhBudW1OZXN0ZWRWZW'
    'N0b3JzElMKEGNvbW1vbl9tZXRhX2RhdGEYAiABKAsyKS5uZWJ1bGEucHJvdG8udmVjdG9yLlZl'
    'Y3RvckNvbW1vbk1ldGFEYXRhUg5jb21tb25NZXRhRGF0YRIqChFzcGVjaWFsX21ldGFfZGF0YR'
    'gDIAEoDFIPc3BlY2lhbE1ldGFEYXRhEh8KC3ZlY3Rvcl9kYXRhGAQgASgMUgp2ZWN0b3JEYXRh'
    'EiAKDG51bGxfYml0X21hcBgFIAEoDFIKbnVsbEJpdE1hcBJICg5uZXN0ZWRfdmVjdG9ycxgGIA'
    'MoCzIhLm5lYnVsYS5wcm90by52ZWN0b3IuTmVzdGVkVmVjdG9yUg1uZXN0ZWRWZWN0b3Jz');

@$core.Deprecated('Use vectorBatchDescriptor instead')
const VectorBatch$json = {
  '1': 'VectorBatch',
  '2': [
    {'1': 'vectors', '3': 1, '4': 3, '5': 11, '6': '.nebula.proto.vector.NestedVector', '10': 'vectors'},
  ],
};

/// Descriptor for `VectorBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vectorBatchDescriptor = $convert.base64Decode(
    'CgtWZWN0b3JCYXRjaBI7Cgd2ZWN0b3JzGAEgAygLMiEubmVidWxhLnByb3RvLnZlY3Rvci5OZX'
    'N0ZWRWZWN0b3JSB3ZlY3RvcnM=');

@$core.Deprecated('Use vectorResultTableDescriptor instead')
const VectorResultTable$json = {
  '1': 'VectorResultTable',
  '2': [
    {'1': 'data_layout_version', '3': 1, '4': 1, '5': 12, '10': 'dataLayoutVersion'},
    {'1': 'meta', '3': 2, '4': 1, '5': 11, '6': '.nebula.proto.vector.VectorTableMetaData', '10': 'meta'},
    {'1': 'batch', '3': 3, '4': 3, '5': 11, '6': '.nebula.proto.vector.VectorBatch', '10': 'batch'},
  ],
};

/// Descriptor for `VectorResultTable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vectorResultTableDescriptor = $convert.base64Decode(
    'ChFWZWN0b3JSZXN1bHRUYWJsZRIuChNkYXRhX2xheW91dF92ZXJzaW9uGAEgASgMUhFkYXRhTG'
    'F5b3V0VmVyc2lvbhI8CgRtZXRhGAIgASgLMigubmVidWxhLnByb3RvLnZlY3Rvci5WZWN0b3JU'
    'YWJsZU1ldGFEYXRhUgRtZXRhEjYKBWJhdGNoGAMgAygLMiAubmVidWxhLnByb3RvLnZlY3Rvci'
    '5WZWN0b3JCYXRjaFIFYmF0Y2g=');

@$core.Deprecated('Use resultTableDescriptor instead')
const ResultTable$json = {
  '1': 'ResultTable',
  '2': [
    {'1': 'column_names', '3': 1, '4': 3, '5': 12, '10': 'columnNames'},
    {'1': 'records', '3': 2, '4': 3, '5': 11, '6': '.nebula.proto.vector.Row', '10': 'records'},
  ],
};

/// Descriptor for `ResultTable`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resultTableDescriptor = $convert.base64Decode(
    'CgtSZXN1bHRUYWJsZRIhCgxjb2x1bW5fbmFtZXMYASADKAxSC2NvbHVtbk5hbWVzEjIKB3JlY2'
    '9yZHMYAiADKAsyGC5uZWJ1bGEucHJvdG8udmVjdG9yLlJvd1IHcmVjb3Jkcw==');

