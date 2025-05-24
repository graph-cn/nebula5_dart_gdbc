//
//  Generated code. Do not modify.
//  source: graph.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use queryStatsDescriptor instead')
const QueryStats$json = {
  '1': 'QueryStats',
  '2': [
    {'1': 'num_affected_nodes', '3': 1, '4': 1, '5': 3, '10': 'numAffectedNodes'},
    {'1': 'num_affected_edges', '3': 2, '4': 1, '5': 3, '10': 'numAffectedEdges'},
  ],
};

/// Descriptor for `QueryStats`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List queryStatsDescriptor = $convert.base64Decode(
    'CgpRdWVyeVN0YXRzEiwKEm51bV9hZmZlY3RlZF9ub2RlcxgBIAEoA1IQbnVtQWZmZWN0ZWROb2'
    'RlcxIsChJudW1fYWZmZWN0ZWRfZWRnZXMYAiABKANSEG51bUFmZmVjdGVkRWRnZXM=');

@$core.Deprecated('Use planInfoDescriptor instead')
const PlanInfo$json = {
  '1': 'PlanInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 12, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 12, '10': 'name'},
    {'1': 'details', '3': 3, '4': 1, '5': 12, '10': 'details'},
    {'1': 'columns', '3': 4, '4': 3, '5': 12, '10': 'columns'},
    {'1': 'time_ms', '3': 5, '4': 1, '5': 1, '10': 'timeMs'},
    {'1': 'rows', '3': 6, '4': 1, '5': 3, '10': 'rows'},
    {'1': 'memory_kib', '3': 7, '4': 1, '5': 1, '10': 'memoryKib'},
    {'1': 'blocked_ms', '3': 8, '4': 1, '5': 1, '10': 'blockedMs'},
    {'1': 'queued_ms', '3': 9, '4': 1, '5': 1, '10': 'queuedMs'},
    {'1': 'consume_ms', '3': 10, '4': 1, '5': 1, '10': 'consumeMs'},
    {'1': 'produce_ms', '3': 11, '4': 1, '5': 1, '10': 'produceMs'},
    {'1': 'finish_ms', '3': 12, '4': 1, '5': 1, '10': 'finishMs'},
    {'1': 'batches', '3': 13, '4': 1, '5': 3, '10': 'batches'},
    {'1': 'concurrency', '3': 14, '4': 1, '5': 3, '10': 'concurrency'},
    {'1': 'other_stats_json', '3': 15, '4': 1, '5': 12, '10': 'otherStatsJson'},
    {'1': 'children', '3': 16, '4': 3, '5': 11, '6': '.nebula.proto.graph.PlanInfo', '10': 'children'},
  ],
};

/// Descriptor for `PlanInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List planInfoDescriptor = $convert.base64Decode(
    'CghQbGFuSW5mbxIOCgJpZBgBIAEoDFICaWQSEgoEbmFtZRgCIAEoDFIEbmFtZRIYCgdkZXRhaW'
    'xzGAMgASgMUgdkZXRhaWxzEhgKB2NvbHVtbnMYBCADKAxSB2NvbHVtbnMSFwoHdGltZV9tcxgF'
    'IAEoAVIGdGltZU1zEhIKBHJvd3MYBiABKANSBHJvd3MSHQoKbWVtb3J5X2tpYhgHIAEoAVIJbW'
    'Vtb3J5S2liEh0KCmJsb2NrZWRfbXMYCCABKAFSCWJsb2NrZWRNcxIbCglxdWV1ZWRfbXMYCSAB'
    'KAFSCHF1ZXVlZE1zEh0KCmNvbnN1bWVfbXMYCiABKAFSCWNvbnN1bWVNcxIdCgpwcm9kdWNlX2'
    '1zGAsgASgBUglwcm9kdWNlTXMSGwoJZmluaXNoX21zGAwgASgBUghmaW5pc2hNcxIYCgdiYXRj'
    'aGVzGA0gASgDUgdiYXRjaGVzEiAKC2NvbmN1cnJlbmN5GA4gASgDUgtjb25jdXJyZW5jeRIoCh'
    'BvdGhlcl9zdGF0c19qc29uGA8gASgMUg5vdGhlclN0YXRzSnNvbhI4CghjaGlsZHJlbhgQIAMo'
    'CzIcLm5lYnVsYS5wcm90by5ncmFwaC5QbGFuSW5mb1IIY2hpbGRyZW4=');

@$core.Deprecated('Use elapsedTimeDescriptor instead')
const ElapsedTime$json = {
  '1': 'ElapsedTime',
  '2': [
    {'1': 'total_server_time_us', '3': 1, '4': 1, '5': 3, '10': 'totalServerTimeUs'},
    {'1': 'build_time_us', '3': 2, '4': 1, '5': 3, '10': 'buildTimeUs'},
    {'1': 'optimize_time_us', '3': 3, '4': 1, '5': 3, '10': 'optimizeTimeUs'},
    {'1': 'serialize_time_us', '3': 4, '4': 1, '5': 3, '10': 'serializeTimeUs'},
    {'1': 'parse_time_us', '3': 5, '4': 1, '5': 3, '10': 'parseTimeUs'},
  ],
};

/// Descriptor for `ElapsedTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List elapsedTimeDescriptor = $convert.base64Decode(
    'CgtFbGFwc2VkVGltZRIvChR0b3RhbF9zZXJ2ZXJfdGltZV91cxgBIAEoA1IRdG90YWxTZXJ2ZX'
    'JUaW1lVXMSIgoNYnVpbGRfdGltZV91cxgCIAEoA1ILYnVpbGRUaW1lVXMSKAoQb3B0aW1pemVf'
    'dGltZV91cxgDIAEoA1IOb3B0aW1pemVUaW1lVXMSKgoRc2VyaWFsaXplX3RpbWVfdXMYBCABKA'
    'NSD3NlcmlhbGl6ZVRpbWVVcxIiCg1wYXJzZV90aW1lX3VzGAUgASgDUgtwYXJzZVRpbWVVcw==');

@$core.Deprecated('Use summaryDescriptor instead')
const Summary$json = {
  '1': 'Summary',
  '2': [
    {'1': 'elapsed_time', '3': 1, '4': 1, '5': 11, '6': '.nebula.proto.graph.ElapsedTime', '10': 'elapsedTime'},
    {'1': 'explain_type', '3': 2, '4': 1, '5': 12, '10': 'explainType'},
    {'1': 'plan_info', '3': 3, '4': 1, '5': 11, '6': '.nebula.proto.graph.PlanInfo', '10': 'planInfo'},
    {'1': 'query_stats', '3': 4, '4': 1, '5': 11, '6': '.nebula.proto.graph.QueryStats', '10': 'queryStats'},
    {'1': 'log_stream', '3': 5, '4': 1, '5': 12, '10': 'logStream'},
  ],
};

/// Descriptor for `Summary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List summaryDescriptor = $convert.base64Decode(
    'CgdTdW1tYXJ5EkIKDGVsYXBzZWRfdGltZRgBIAEoCzIfLm5lYnVsYS5wcm90by5ncmFwaC5FbG'
    'Fwc2VkVGltZVILZWxhcHNlZFRpbWUSIQoMZXhwbGFpbl90eXBlGAIgASgMUgtleHBsYWluVHlw'
    'ZRI5CglwbGFuX2luZm8YAyABKAsyHC5uZWJ1bGEucHJvdG8uZ3JhcGguUGxhbkluZm9SCHBsYW'
    '5JbmZvEj8KC3F1ZXJ5X3N0YXRzGAQgASgLMh4ubmVidWxhLnByb3RvLmdyYXBoLlF1ZXJ5U3Rh'
    'dHNSCnF1ZXJ5U3RhdHMSHQoKbG9nX3N0cmVhbRgFIAEoDFIJbG9nU3RyZWFt');

@$core.Deprecated('Use executeRequestDescriptor instead')
const ExecuteRequest$json = {
  '1': 'ExecuteRequest',
  '2': [
    {'1': 'session_id', '3': 1, '4': 1, '5': 3, '10': 'sessionId'},
    {'1': 'stmt', '3': 2, '4': 1, '5': 12, '10': 'stmt'},
  ],
};

/// Descriptor for `ExecuteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeRequestDescriptor = $convert.base64Decode(
    'Cg5FeGVjdXRlUmVxdWVzdBIdCgpzZXNzaW9uX2lkGAEgASgDUglzZXNzaW9uSWQSEgoEc3RtdB'
    'gCIAEoDFIEc3RtdA==');

@$core.Deprecated('Use executeResponseDescriptor instead')
const ExecuteResponse$json = {
  '1': 'ExecuteResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.nebula.proto.common.Status', '10': 'status'},
    {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.nebula.proto.vector.VectorResultTable', '10': 'result'},
    {'1': 'summary', '3': 3, '4': 1, '5': 11, '6': '.nebula.proto.graph.Summary', '10': 'summary'},
    {'1': 'cursor', '3': 4, '4': 1, '5': 12, '10': 'cursor'},
  ],
};

/// Descriptor for `ExecuteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List executeResponseDescriptor = $convert.base64Decode(
    'Cg9FeGVjdXRlUmVzcG9uc2USMwoGc3RhdHVzGAEgASgLMhsubmVidWxhLnByb3RvLmNvbW1vbi'
    '5TdGF0dXNSBnN0YXR1cxI+CgZyZXN1bHQYAiABKAsyJi5uZWJ1bGEucHJvdG8udmVjdG9yLlZl'
    'Y3RvclJlc3VsdFRhYmxlUgZyZXN1bHQSNQoHc3VtbWFyeRgDIAEoCzIbLm5lYnVsYS5wcm90by'
    '5ncmFwaC5TdW1tYXJ5UgdzdW1tYXJ5EhYKBmN1cnNvchgEIAEoDFIGY3Vyc29y');

@$core.Deprecated('Use authRequestDescriptor instead')
const AuthRequest$json = {
  '1': 'AuthRequest',
  '2': [
    {'1': 'username', '3': 1, '4': 1, '5': 12, '10': 'username'},
    {'1': 'auth_info', '3': 2, '4': 1, '5': 12, '10': 'authInfo'},
    {'1': 'client_info', '3': 3, '4': 1, '5': 11, '6': '.nebula.proto.common.ClientInfo', '10': 'clientInfo'},
  ],
};

/// Descriptor for `AuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRequestDescriptor = $convert.base64Decode(
    'CgtBdXRoUmVxdWVzdBIaCgh1c2VybmFtZRgBIAEoDFIIdXNlcm5hbWUSGwoJYXV0aF9pbmZvGA'
    'IgASgMUghhdXRoSW5mbxJACgtjbGllbnRfaW5mbxgDIAEoCzIfLm5lYnVsYS5wcm90by5jb21t'
    'b24uQ2xpZW50SW5mb1IKY2xpZW50SW5mbw==');

@$core.Deprecated('Use authResponseDescriptor instead')
const AuthResponse$json = {
  '1': 'AuthResponse',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 11, '6': '.nebula.proto.common.Status', '10': 'status'},
    {'1': 'session_id', '3': 2, '4': 1, '5': 3, '10': 'sessionId'},
    {'1': 'version', '3': 3, '4': 1, '5': 12, '10': 'version'},
  ],
};

/// Descriptor for `AuthResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authResponseDescriptor = $convert.base64Decode(
    'CgxBdXRoUmVzcG9uc2USMwoGc3RhdHVzGAEgASgLMhsubmVidWxhLnByb3RvLmNvbW1vbi5TdG'
    'F0dXNSBnN0YXR1cxIdCgpzZXNzaW9uX2lkGAIgASgDUglzZXNzaW9uSWQSGAoHdmVyc2lvbhgD'
    'IAEoDFIHdmVyc2lvbg==');

