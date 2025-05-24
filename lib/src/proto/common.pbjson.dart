//
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use serviceTypeDescriptor instead')
const ServiceType$json = {
  '1': 'ServiceType',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'STORAGE', '2': 1},
    {'1': 'GRAPH', '2': 2},
    {'1': 'META', '2': 3},
    {'1': 'ANALYTIC', '2': 4},
    {'1': 'ALL', '2': 5},
  ],
};

/// Descriptor for `ServiceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List serviceTypeDescriptor = $convert.base64Decode(
    'CgtTZXJ2aWNlVHlwZRILCgdVTktOT1dOEAASCwoHU1RPUkFHRRABEgkKBUdSQVBIEAISCAoETU'
    'VUQRADEgwKCEFOQUxZVElDEAQSBwoDQUxMEAU=');

@$core.Deprecated('Use durationDescriptor instead')
const Duration$json = {
  '1': 'Duration',
  '2': [
    {'1': 'is_month_based', '3': 1, '4': 1, '5': 8, '10': 'isMonthBased'},
    {'1': 'year', '3': 2, '4': 1, '5': 5, '10': 'year'},
    {'1': 'month', '3': 3, '4': 1, '5': 5, '10': 'month'},
    {'1': 'day', '3': 4, '4': 1, '5': 5, '10': 'day'},
    {'1': 'hour', '3': 5, '4': 1, '5': 5, '10': 'hour'},
    {'1': 'minute', '3': 6, '4': 1, '5': 5, '10': 'minute'},
    {'1': 'sec', '3': 7, '4': 1, '5': 5, '10': 'sec'},
    {'1': 'microsec', '3': 8, '4': 1, '5': 5, '10': 'microsec'},
  ],
};

/// Descriptor for `Duration`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List durationDescriptor = $convert.base64Decode(
    'CghEdXJhdGlvbhIkCg5pc19tb250aF9iYXNlZBgBIAEoCFIMaXNNb250aEJhc2VkEhIKBHllYX'
    'IYAiABKAVSBHllYXISFAoFbW9udGgYAyABKAVSBW1vbnRoEhAKA2RheRgEIAEoBVIDZGF5EhIK'
    'BGhvdXIYBSABKAVSBGhvdXISFgoGbWludXRlGAYgASgFUgZtaW51dGUSEAoDc2VjGAcgASgFUg'
    'NzZWMSGgoIbWljcm9zZWMYCCABKAVSCG1pY3Jvc2Vj');

@$core.Deprecated('Use dateDescriptor instead')
const Date$json = {
  '1': 'Date',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 13, '10': 'month'},
    {'1': 'day', '3': 3, '4': 1, '5': 13, '10': 'day'},
  ],
};

/// Descriptor for `Date`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dateDescriptor = $convert.base64Decode(
    'CgREYXRlEhIKBHllYXIYASABKAVSBHllYXISFAoFbW9udGgYAiABKA1SBW1vbnRoEhAKA2RheR'
    'gDIAEoDVIDZGF5');

@$core.Deprecated('Use localTimeDescriptor instead')
const LocalTime$json = {
  '1': 'LocalTime',
  '2': [
    {'1': 'hour', '3': 1, '4': 1, '5': 13, '10': 'hour'},
    {'1': 'minute', '3': 2, '4': 1, '5': 13, '10': 'minute'},
    {'1': 'sec', '3': 3, '4': 1, '5': 13, '10': 'sec'},
    {'1': 'microsec', '3': 4, '4': 1, '5': 13, '10': 'microsec'},
  ],
};

/// Descriptor for `LocalTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localTimeDescriptor = $convert.base64Decode(
    'CglMb2NhbFRpbWUSEgoEaG91chgBIAEoDVIEaG91chIWCgZtaW51dGUYAiABKA1SBm1pbnV0ZR'
    'IQCgNzZWMYAyABKA1SA3NlYxIaCghtaWNyb3NlYxgEIAEoDVIIbWljcm9zZWM=');

@$core.Deprecated('Use zonedTimeDescriptor instead')
const ZonedTime$json = {
  '1': 'ZonedTime',
  '2': [
    {'1': 'hour', '3': 1, '4': 1, '5': 13, '10': 'hour'},
    {'1': 'minute', '3': 2, '4': 1, '5': 13, '10': 'minute'},
    {'1': 'sec', '3': 3, '4': 1, '5': 13, '10': 'sec'},
    {'1': 'microsec', '3': 4, '4': 1, '5': 13, '10': 'microsec'},
    {'1': 'offset', '3': 5, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ZonedTime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List zonedTimeDescriptor = $convert.base64Decode(
    'Cglab25lZFRpbWUSEgoEaG91chgBIAEoDVIEaG91chIWCgZtaW51dGUYAiABKA1SBm1pbnV0ZR'
    'IQCgNzZWMYAyABKA1SA3NlYxIaCghtaWNyb3NlYxgEIAEoDVIIbWljcm9zZWMSFgoGb2Zmc2V0'
    'GAUgASgFUgZvZmZzZXQ=');

@$core.Deprecated('Use localDatetimeDescriptor instead')
const LocalDatetime$json = {
  '1': 'LocalDatetime',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 13, '10': 'month'},
    {'1': 'day', '3': 3, '4': 1, '5': 13, '10': 'day'},
    {'1': 'hour', '3': 4, '4': 1, '5': 13, '10': 'hour'},
    {'1': 'minute', '3': 5, '4': 1, '5': 13, '10': 'minute'},
    {'1': 'sec', '3': 6, '4': 1, '5': 13, '10': 'sec'},
    {'1': 'microsec', '3': 7, '4': 1, '5': 13, '10': 'microsec'},
  ],
};

/// Descriptor for `LocalDatetime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List localDatetimeDescriptor = $convert.base64Decode(
    'Cg1Mb2NhbERhdGV0aW1lEhIKBHllYXIYASABKAVSBHllYXISFAoFbW9udGgYAiABKA1SBW1vbn'
    'RoEhAKA2RheRgDIAEoDVIDZGF5EhIKBGhvdXIYBCABKA1SBGhvdXISFgoGbWludXRlGAUgASgN'
    'UgZtaW51dGUSEAoDc2VjGAYgASgNUgNzZWMSGgoIbWljcm9zZWMYByABKA1SCG1pY3Jvc2Vj');

@$core.Deprecated('Use zonedDatetimeDescriptor instead')
const ZonedDatetime$json = {
  '1': 'ZonedDatetime',
  '2': [
    {'1': 'year', '3': 1, '4': 1, '5': 5, '10': 'year'},
    {'1': 'month', '3': 2, '4': 1, '5': 13, '10': 'month'},
    {'1': 'day', '3': 3, '4': 1, '5': 13, '10': 'day'},
    {'1': 'hour', '3': 4, '4': 1, '5': 13, '10': 'hour'},
    {'1': 'minute', '3': 5, '4': 1, '5': 13, '10': 'minute'},
    {'1': 'sec', '3': 6, '4': 1, '5': 13, '10': 'sec'},
    {'1': 'microsec', '3': 7, '4': 1, '5': 13, '10': 'microsec'},
    {'1': 'offset', '3': 8, '4': 1, '5': 5, '10': 'offset'},
  ],
};

/// Descriptor for `ZonedDatetime`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List zonedDatetimeDescriptor = $convert.base64Decode(
    'Cg1ab25lZERhdGV0aW1lEhIKBHllYXIYASABKAVSBHllYXISFAoFbW9udGgYAiABKA1SBW1vbn'
    'RoEhAKA2RheRgDIAEoDVIDZGF5EhIKBGhvdXIYBCABKA1SBGhvdXISFgoGbWludXRlGAUgASgN'
    'UgZtaW51dGUSEAoDc2VjGAYgASgNUgNzZWMSGgoIbWljcm9zZWMYByABKA1SCG1pY3Jvc2VjEh'
    'YKBm9mZnNldBgIIAEoBVIGb2Zmc2V0');

@$core.Deprecated('Use list_Descriptor instead')
const List_$json = {
  '1': 'List',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nebula.proto.common.Value', '10': 'values'},
  ],
};

/// Descriptor for `List`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List list_Descriptor = $convert.base64Decode(
    'CgRMaXN0EjIKBnZhbHVlcxgBIAMoCzIaLm5lYnVsYS5wcm90by5jb21tb24uVmFsdWVSBnZhbH'
    'Vlcw==');

@$core.Deprecated('Use vectorDescriptor instead')
const Vector$json = {
  '1': 'Vector',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 2, '10': 'values'},
  ],
};

/// Descriptor for `Vector`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List vectorDescriptor = $convert.base64Decode(
    'CgZWZWN0b3ISFgoGdmFsdWVzGAEgAygCUgZ2YWx1ZXM=');

@$core.Deprecated('Use recordDescriptor instead')
const Record$json = {
  '1': 'Record',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nebula.proto.common.Record.ValuesEntry', '10': 'values'},
  ],
  '3': [Record_ValuesEntry$json],
};

@$core.Deprecated('Use recordDescriptor instead')
const Record_ValuesEntry$json = {
  '1': 'ValuesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nebula.proto.common.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Record`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List recordDescriptor = $convert.base64Decode(
    'CgZSZWNvcmQSPwoGdmFsdWVzGAEgAygLMicubmVidWxhLnByb3RvLmNvbW1vbi5SZWNvcmQuVm'
    'FsdWVzRW50cnlSBnZhbHVlcxpVCgtWYWx1ZXNFbnRyeRIQCgNrZXkYASABKAlSA2tleRIwCgV2'
    'YWx1ZRgCIAEoCzIaLm5lYnVsYS5wcm90by5jb21tb24uVmFsdWVSBXZhbHVlOgI4AQ==');

@$core.Deprecated('Use nodeDescriptor instead')
const Node$json = {
  '1': 'Node',
  '2': [
    {'1': 'node_id', '3': 1, '4': 1, '5': 3, '10': 'nodeId'},
    {'1': 'graph', '3': 2, '4': 1, '5': 9, '10': 'graph'},
    {'1': 'type', '3': 3, '4': 1, '5': 9, '10': 'type'},
    {'1': 'labels', '3': 4, '4': 3, '5': 9, '10': 'labels'},
    {'1': 'properties', '3': 5, '4': 3, '5': 11, '6': '.nebula.proto.common.Node.PropertiesEntry', '10': 'properties'},
  ],
  '3': [Node_PropertiesEntry$json],
};

@$core.Deprecated('Use nodeDescriptor instead')
const Node_PropertiesEntry$json = {
  '1': 'PropertiesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nebula.proto.common.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `Node`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List nodeDescriptor = $convert.base64Decode(
    'CgROb2RlEhcKB25vZGVfaWQYASABKANSBm5vZGVJZBIUCgVncmFwaBgCIAEoCVIFZ3JhcGgSEg'
    'oEdHlwZRgDIAEoCVIEdHlwZRIWCgZsYWJlbHMYBCADKAlSBmxhYmVscxJJCgpwcm9wZXJ0aWVz'
    'GAUgAygLMikubmVidWxhLnByb3RvLmNvbW1vbi5Ob2RlLlByb3BlcnRpZXNFbnRyeVIKcHJvcG'
    'VydGllcxpZCg9Qcm9wZXJ0aWVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAiAB'
    'KAsyGi5uZWJ1bGEucHJvdG8uY29tbW9uLlZhbHVlUgV2YWx1ZToCOAE=');

@$core.Deprecated('Use edgeDescriptor instead')
const Edge$json = {
  '1': 'Edge',
  '2': [
    {'1': 'src_id', '3': 1, '4': 1, '5': 3, '10': 'srcId'},
    {'1': 'dst_id', '3': 2, '4': 1, '5': 3, '10': 'dstId'},
    {'1': 'direction', '3': 3, '4': 1, '5': 14, '6': '.nebula.proto.common.Edge.Direction', '10': 'direction'},
    {'1': 'graph', '3': 4, '4': 1, '5': 9, '10': 'graph'},
    {'1': 'type', '3': 5, '4': 1, '5': 9, '10': 'type'},
    {'1': 'labels', '3': 6, '4': 3, '5': 9, '10': 'labels'},
    {'1': 'rank', '3': 7, '4': 1, '5': 3, '10': 'rank'},
    {'1': 'properties', '3': 8, '4': 3, '5': 11, '6': '.nebula.proto.common.Edge.PropertiesEntry', '10': 'properties'},
  ],
  '3': [Edge_PropertiesEntry$json],
  '4': [Edge_Direction$json],
};

@$core.Deprecated('Use edgeDescriptor instead')
const Edge_PropertiesEntry$json = {
  '1': 'PropertiesEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.nebula.proto.common.Value', '10': 'value'},
  ],
  '7': {'7': true},
};

@$core.Deprecated('Use edgeDescriptor instead')
const Edge_Direction$json = {
  '1': 'Direction',
  '2': [
    {'1': 'DIRECTED', '2': 0},
    {'1': 'UNDIRECTED', '2': 1},
  ],
};

/// Descriptor for `Edge`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List edgeDescriptor = $convert.base64Decode(
    'CgRFZGdlEhUKBnNyY19pZBgBIAEoA1IFc3JjSWQSFQoGZHN0X2lkGAIgASgDUgVkc3RJZBJBCg'
    'lkaXJlY3Rpb24YAyABKA4yIy5uZWJ1bGEucHJvdG8uY29tbW9uLkVkZ2UuRGlyZWN0aW9uUglk'
    'aXJlY3Rpb24SFAoFZ3JhcGgYBCABKAlSBWdyYXBoEhIKBHR5cGUYBSABKAlSBHR5cGUSFgoGbG'
    'FiZWxzGAYgAygJUgZsYWJlbHMSEgoEcmFuaxgHIAEoA1IEcmFuaxJJCgpwcm9wZXJ0aWVzGAgg'
    'AygLMikubmVidWxhLnByb3RvLmNvbW1vbi5FZGdlLlByb3BlcnRpZXNFbnRyeVIKcHJvcGVydG'
    'llcxpZCg9Qcm9wZXJ0aWVzRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSMAoFdmFsdWUYAiABKAsy'
    'Gi5uZWJ1bGEucHJvdG8uY29tbW9uLlZhbHVlUgV2YWx1ZToCOAEiKQoJRGlyZWN0aW9uEgwKCE'
    'RJUkVDVEVEEAASDgoKVU5ESVJFQ1RFRBAB');

@$core.Deprecated('Use decimalDescriptor instead')
const Decimal$json = {
  '1': 'Decimal',
  '2': [
    {'1': 'sval', '3': 5, '4': 1, '5': 9, '10': 'sval'},
  ],
};

/// Descriptor for `Decimal`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List decimalDescriptor = $convert.base64Decode(
    'CgdEZWNpbWFsEhIKBHN2YWwYBSABKAlSBHN2YWw=');

@$core.Deprecated('Use pathDescriptor instead')
const Path$json = {
  '1': 'Path',
  '2': [
    {'1': 'values', '3': 1, '4': 3, '5': 11, '6': '.nebula.proto.common.Value', '10': 'values'},
  ],
};

/// Descriptor for `Path`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List pathDescriptor = $convert.base64Decode(
    'CgRQYXRoEjIKBnZhbHVlcxgBIAMoCzIaLm5lYnVsYS5wcm90by5jb21tb24uVmFsdWVSBnZhbH'
    'Vlcw==');

@$core.Deprecated('Use refDescriptor instead')
const Ref$json = {
  '1': 'Ref',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 13, '10': 'code'},
    {'1': 'offset', '3': 2, '4': 1, '5': 13, '10': 'offset'},
  ],
};

/// Descriptor for `Ref`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List refDescriptor = $convert.base64Decode(
    'CgNSZWYSEgoEY29kZRgBIAEoDVIEY29kZRIWCgZvZmZzZXQYAiABKA1SBm9mZnNldA==');

@$core.Deprecated('Use valueDescriptor instead')
const Value$json = {
  '1': 'Value',
  '2': [
    {'1': 'bool_value', '3': 1, '4': 1, '5': 8, '9': 0, '10': 'boolValue'},
    {'1': 'int8_value', '3': 2, '4': 1, '5': 5, '9': 0, '10': 'int8Value'},
    {'1': 'uint8_value', '3': 3, '4': 1, '5': 13, '9': 0, '10': 'uint8Value'},
    {'1': 'int16_value', '3': 4, '4': 1, '5': 5, '9': 0, '10': 'int16Value'},
    {'1': 'uint16_value', '3': 5, '4': 1, '5': 13, '9': 0, '10': 'uint16Value'},
    {'1': 'int32_value', '3': 6, '4': 1, '5': 5, '9': 0, '10': 'int32Value'},
    {'1': 'uint32_value', '3': 7, '4': 1, '5': 13, '9': 0, '10': 'uint32Value'},
    {'1': 'int64_value', '3': 8, '4': 1, '5': 3, '9': 0, '10': 'int64Value'},
    {'1': 'uint64_value', '3': 9, '4': 1, '5': 4, '9': 0, '10': 'uint64Value'},
    {'1': 'float_value', '3': 10, '4': 1, '5': 2, '9': 0, '10': 'floatValue'},
    {'1': 'double_value', '3': 11, '4': 1, '5': 1, '9': 0, '10': 'doubleValue'},
    {'1': 'string_value', '3': 12, '4': 1, '5': 12, '9': 0, '10': 'stringValue'},
    {'1': 'list_value', '3': 13, '4': 1, '5': 11, '6': '.nebula.proto.common.List', '9': 0, '10': 'listValue'},
    {'1': 'record_value', '3': 14, '4': 1, '5': 11, '6': '.nebula.proto.common.Record', '9': 0, '10': 'recordValue'},
    {'1': 'node_value', '3': 15, '4': 1, '5': 11, '6': '.nebula.proto.common.Node', '9': 0, '10': 'nodeValue'},
    {'1': 'edge_value', '3': 16, '4': 1, '5': 11, '6': '.nebula.proto.common.Edge', '9': 0, '10': 'edgeValue'},
    {'1': 'path_value', '3': 17, '4': 1, '5': 11, '6': '.nebula.proto.common.Path', '9': 0, '10': 'pathValue'},
    {'1': 'duration_value', '3': 18, '4': 1, '5': 11, '6': '.nebula.proto.common.Duration', '9': 0, '10': 'durationValue'},
    {'1': 'local_time_value', '3': 19, '4': 1, '5': 11, '6': '.nebula.proto.common.LocalTime', '9': 0, '10': 'localTimeValue'},
    {'1': 'zoned_time_value', '3': 20, '4': 1, '5': 11, '6': '.nebula.proto.common.ZonedTime', '9': 0, '10': 'zonedTimeValue'},
    {'1': 'date_value', '3': 21, '4': 1, '5': 11, '6': '.nebula.proto.common.Date', '9': 0, '10': 'dateValue'},
    {'1': 'local_datetime_value', '3': 22, '4': 1, '5': 11, '6': '.nebula.proto.common.LocalDatetime', '9': 0, '10': 'localDatetimeValue'},
    {'1': 'zoned_datetime_value', '3': 23, '4': 1, '5': 11, '6': '.nebula.proto.common.ZonedDatetime', '9': 0, '10': 'zonedDatetimeValue'},
    {'1': 'ref_value', '3': 24, '4': 1, '5': 11, '6': '.nebula.proto.common.Ref', '9': 0, '10': 'refValue'},
    {'1': 'decimal_value', '3': 25, '4': 1, '5': 11, '6': '.nebula.proto.common.Decimal', '9': 0, '10': 'decimalValue'},
    {'1': 'vector_value', '3': 26, '4': 1, '5': 11, '6': '.nebula.proto.common.Vector', '9': 0, '10': 'vectorValue'},
  ],
  '4': [Value_Type$json],
  '8': [
    {'1': 'data'},
  ],
};

@$core.Deprecated('Use valueDescriptor instead')
const Value_Type$json = {
  '1': 'Type',
  '2': [
    {'1': 'kNull', '2': 0},
    {'1': 'kBool', '2': 1},
    {'1': 'kInt8', '2': 2},
    {'1': 'kUInt8', '2': 3},
    {'1': 'kInt16', '2': 4},
    {'1': 'kUInt16', '2': 5},
    {'1': 'kInt32', '2': 6},
    {'1': 'kUInt32', '2': 7},
    {'1': 'kInt64', '2': 8},
    {'1': 'kUInt64', '2': 9},
    {'1': 'kFloat', '2': 10},
    {'1': 'kDouble', '2': 11},
    {'1': 'kString', '2': 12},
    {'1': 'kList', '2': 13},
    {'1': 'kRecord', '2': 14},
    {'1': 'kNode', '2': 15},
    {'1': 'kEdge', '2': 16},
    {'1': 'kPath', '2': 17},
    {'1': 'kDuration', '2': 18},
    {'1': 'kLocalTime', '2': 19},
    {'1': 'kZonedTime', '2': 20},
    {'1': 'kDate', '2': 21},
    {'1': 'kLocalDatetime', '2': 22},
    {'1': 'kZonedDatetime', '2': 23},
    {'1': 'kRef', '2': 24},
    {'1': 'kDecimal', '2': 25},
    {'1': 'kVector', '2': 26},
  ],
};

/// Descriptor for `Value`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List valueDescriptor = $convert.base64Decode(
    'CgVWYWx1ZRIfCgpib29sX3ZhbHVlGAEgASgISABSCWJvb2xWYWx1ZRIfCgppbnQ4X3ZhbHVlGA'
    'IgASgFSABSCWludDhWYWx1ZRIhCgt1aW50OF92YWx1ZRgDIAEoDUgAUgp1aW50OFZhbHVlEiEK'
    'C2ludDE2X3ZhbHVlGAQgASgFSABSCmludDE2VmFsdWUSIwoMdWludDE2X3ZhbHVlGAUgASgNSA'
    'BSC3VpbnQxNlZhbHVlEiEKC2ludDMyX3ZhbHVlGAYgASgFSABSCmludDMyVmFsdWUSIwoMdWlu'
    'dDMyX3ZhbHVlGAcgASgNSABSC3VpbnQzMlZhbHVlEiEKC2ludDY0X3ZhbHVlGAggASgDSABSCm'
    'ludDY0VmFsdWUSIwoMdWludDY0X3ZhbHVlGAkgASgESABSC3VpbnQ2NFZhbHVlEiEKC2Zsb2F0'
    'X3ZhbHVlGAogASgCSABSCmZsb2F0VmFsdWUSIwoMZG91YmxlX3ZhbHVlGAsgASgBSABSC2RvdW'
    'JsZVZhbHVlEiMKDHN0cmluZ192YWx1ZRgMIAEoDEgAUgtzdHJpbmdWYWx1ZRI6CgpsaXN0X3Zh'
    'bHVlGA0gASgLMhkubmVidWxhLnByb3RvLmNvbW1vbi5MaXN0SABSCWxpc3RWYWx1ZRJACgxyZW'
    'NvcmRfdmFsdWUYDiABKAsyGy5uZWJ1bGEucHJvdG8uY29tbW9uLlJlY29yZEgAUgtyZWNvcmRW'
    'YWx1ZRI6Cgpub2RlX3ZhbHVlGA8gASgLMhkubmVidWxhLnByb3RvLmNvbW1vbi5Ob2RlSABSCW'
    '5vZGVWYWx1ZRI6CgplZGdlX3ZhbHVlGBAgASgLMhkubmVidWxhLnByb3RvLmNvbW1vbi5FZGdl'
    'SABSCWVkZ2VWYWx1ZRI6CgpwYXRoX3ZhbHVlGBEgASgLMhkubmVidWxhLnByb3RvLmNvbW1vbi'
    '5QYXRoSABSCXBhdGhWYWx1ZRJGCg5kdXJhdGlvbl92YWx1ZRgSIAEoCzIdLm5lYnVsYS5wcm90'
    'by5jb21tb24uRHVyYXRpb25IAFINZHVyYXRpb25WYWx1ZRJKChBsb2NhbF90aW1lX3ZhbHVlGB'
    'MgASgLMh4ubmVidWxhLnByb3RvLmNvbW1vbi5Mb2NhbFRpbWVIAFIObG9jYWxUaW1lVmFsdWUS'
    'SgoQem9uZWRfdGltZV92YWx1ZRgUIAEoCzIeLm5lYnVsYS5wcm90by5jb21tb24uWm9uZWRUaW'
    '1lSABSDnpvbmVkVGltZVZhbHVlEjoKCmRhdGVfdmFsdWUYFSABKAsyGS5uZWJ1bGEucHJvdG8u'
    'Y29tbW9uLkRhdGVIAFIJZGF0ZVZhbHVlElYKFGxvY2FsX2RhdGV0aW1lX3ZhbHVlGBYgASgLMi'
    'IubmVidWxhLnByb3RvLmNvbW1vbi5Mb2NhbERhdGV0aW1lSABSEmxvY2FsRGF0ZXRpbWVWYWx1'
    'ZRJWChR6b25lZF9kYXRldGltZV92YWx1ZRgXIAEoCzIiLm5lYnVsYS5wcm90by5jb21tb24uWm'
    '9uZWREYXRldGltZUgAUhJ6b25lZERhdGV0aW1lVmFsdWUSNwoJcmVmX3ZhbHVlGBggASgLMhgu'
    'bmVidWxhLnByb3RvLmNvbW1vbi5SZWZIAFIIcmVmVmFsdWUSQwoNZGVjaW1hbF92YWx1ZRgZIA'
    'EoCzIcLm5lYnVsYS5wcm90by5jb21tb24uRGVjaW1hbEgAUgxkZWNpbWFsVmFsdWUSQAoMdmVj'
    'dG9yX3ZhbHVlGBogASgLMhsubmVidWxhLnByb3RvLmNvbW1vbi5WZWN0b3JIAFILdmVjdG9yVm'
    'FsdWUi5AIKBFR5cGUSCQoFa051bGwQABIJCgVrQm9vbBABEgkKBWtJbnQ4EAISCgoGa1VJbnQ4'
    'EAMSCgoGa0ludDE2EAQSCwoHa1VJbnQxNhAFEgoKBmtJbnQzMhAGEgsKB2tVSW50MzIQBxIKCg'
    'ZrSW50NjQQCBILCgdrVUludDY0EAkSCgoGa0Zsb2F0EAoSCwoHa0RvdWJsZRALEgsKB2tTdHJp'
    'bmcQDBIJCgVrTGlzdBANEgsKB2tSZWNvcmQQDhIJCgVrTm9kZRAPEgkKBWtFZGdlEBASCQoFa1'
    'BhdGgQERINCglrRHVyYXRpb24QEhIOCgprTG9jYWxUaW1lEBMSDgoKa1pvbmVkVGltZRAUEgkK'
    'BWtEYXRlEBUSEgoOa0xvY2FsRGF0ZXRpbWUQFhISCg5rWm9uZWREYXRldGltZRAXEggKBGtSZW'
    'YQGBIMCghrRGVjaW1hbBAZEgsKB2tWZWN0b3IQGkIGCgRkYXRh');

@$core.Deprecated('Use hostAddressDescriptor instead')
const HostAddress$json = {
  '1': 'HostAddress',
  '2': [
    {'1': 'host', '3': 1, '4': 1, '5': 12, '10': 'host'},
    {'1': 'port', '3': 2, '4': 1, '5': 13, '10': 'port'},
  ],
};

/// Descriptor for `HostAddress`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List hostAddressDescriptor = $convert.base64Decode(
    'CgtIb3N0QWRkcmVzcxISCgRob3N0GAEgASgMUgRob3N0EhIKBHBvcnQYAiABKA1SBHBvcnQ=');

@$core.Deprecated('Use statusDescriptor instead')
const Status$json = {
  '1': 'Status',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 12, '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 12, '10': 'message'},
  ],
};

/// Descriptor for `Status`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusDescriptor = $convert.base64Decode(
    'CgZTdGF0dXMSEgoEY29kZRgBIAEoDFIEY29kZRIYCgdtZXNzYWdlGAIgASgMUgdtZXNzYWdl');

@$core.Deprecated('Use dirInfoDescriptor instead')
const DirInfo$json = {
  '1': 'DirInfo',
  '2': [
    {'1': 'install_path', '3': 1, '4': 1, '5': 12, '10': 'installPath'},
    {'1': 'data_paths', '3': 2, '4': 3, '5': 12, '10': 'dataPaths'},
  ],
};

/// Descriptor for `DirInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List dirInfoDescriptor = $convert.base64Decode(
    'CgdEaXJJbmZvEiEKDGluc3RhbGxfcGF0aBgBIAEoDFILaW5zdGFsbFBhdGgSHQoKZGF0YV9wYX'
    'RocxgCIAMoDFIJZGF0YVBhdGhz');

@$core.Deprecated('Use clientInfoDescriptor instead')
const ClientInfo$json = {
  '1': 'ClientInfo',
  '2': [
    {'1': 'lang', '3': 1, '4': 1, '5': 14, '6': '.nebula.proto.common.ClientInfo.Language', '10': 'lang'},
    {'1': 'protocol_version', '3': 2, '4': 1, '5': 12, '10': 'protocolVersion'},
    {'1': 'version', '3': 3, '4': 1, '5': 12, '10': 'version'},
  ],
  '4': [ClientInfo_Language$json],
};

@$core.Deprecated('Use clientInfoDescriptor instead')
const ClientInfo_Language$json = {
  '1': 'Language',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'CPP', '2': 1},
    {'1': 'GO', '2': 2},
    {'1': 'JAVA', '2': 3},
    {'1': 'PYTHON', '2': 4},
    {'1': 'JAVASCRIPT', '2': 5},
  ],
};

/// Descriptor for `ClientInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List clientInfoDescriptor = $convert.base64Decode(
    'CgpDbGllbnRJbmZvEjwKBGxhbmcYASABKA4yKC5uZWJ1bGEucHJvdG8uY29tbW9uLkNsaWVudE'
    'luZm8uTGFuZ3VhZ2VSBGxhbmcSKQoQcHJvdG9jb2xfdmVyc2lvbhgCIAEoDFIPcHJvdG9jb2xW'
    'ZXJzaW9uEhgKB3ZlcnNpb24YAyABKAxSB3ZlcnNpb24iTgoITGFuZ3VhZ2USCwoHVU5LTk9XTh'
    'AAEgcKA0NQUBABEgYKAkdPEAISCAoESkFWQRADEgoKBlBZVEhPThAEEg4KCkpBVkFTQ1JJUFQQ'
    'BQ==');

