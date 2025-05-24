//
//  Generated code. Do not modify.
//  source: google/cloud/extended_operations.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// An enum to be used to mark the essential (for polling) fields in an
/// API-specific Operation object. A custom Operation object may contain many
/// different fields, but only few of them are essential to conduct a successful
/// polling process.
class OperationResponseMapping extends $pb.ProtobufEnum {
  /// Do not use.
  static const OperationResponseMapping UNDEFINED = OperationResponseMapping._(0, _omitEnumNames ? '' : 'UNDEFINED');
  /// A field in an API-specific (custom) Operation object which carries the same
  /// meaning as google.longrunning.Operation.name.
  static const OperationResponseMapping NAME = OperationResponseMapping._(1, _omitEnumNames ? '' : 'NAME');
  /// A field in an API-specific (custom) Operation object which carries the same
  /// meaning as google.longrunning.Operation.done. If the annotated field is of
  /// an enum type, `annotated_field_name == EnumType.DONE` semantics should be
  /// equivalent to `Operation.done == true`. If the annotated field is of type
  /// boolean, then it should follow the same semantics as Operation.done.
  /// Otherwise, a non-empty value should be treated as `Operation.done == true`.
  static const OperationResponseMapping STATUS = OperationResponseMapping._(2, _omitEnumNames ? '' : 'STATUS');
  /// A field in an API-specific (custom) Operation object which carries the same
  /// meaning as google.longrunning.Operation.error.code.
  static const OperationResponseMapping ERROR_CODE = OperationResponseMapping._(3, _omitEnumNames ? '' : 'ERROR_CODE');
  /// A field in an API-specific (custom) Operation object which carries the same
  /// meaning as google.longrunning.Operation.error.message.
  static const OperationResponseMapping ERROR_MESSAGE = OperationResponseMapping._(4, _omitEnumNames ? '' : 'ERROR_MESSAGE');

  static const $core.List<OperationResponseMapping> values = <OperationResponseMapping> [
    UNDEFINED,
    NAME,
    STATUS,
    ERROR_CODE,
    ERROR_MESSAGE,
  ];

  static final $core.Map<$core.int, OperationResponseMapping> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OperationResponseMapping? valueOf($core.int value) => _byValue[value];

  const OperationResponseMapping._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
