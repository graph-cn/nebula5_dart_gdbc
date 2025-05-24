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

import 'extended_operations.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'extended_operations.pbenum.dart';

class Extended_operations {
  static final operationField = $pb.Extension<OperationResponseMapping>(_omitMessageNames ? '' : 'google.protobuf.FieldOptions', _omitFieldNames ? '' : 'operationField', 1149, $pb.PbFieldType.OE, defaultOrMaker: OperationResponseMapping.UNDEFINED, valueOf: OperationResponseMapping.valueOf, enumValues: OperationResponseMapping.values);
  static final operationRequestField = $pb.Extension<$core.String>(_omitMessageNames ? '' : 'google.protobuf.FieldOptions', _omitFieldNames ? '' : 'operationRequestField', 1150, $pb.PbFieldType.OS);
  static final operationResponseField = $pb.Extension<$core.String>(_omitMessageNames ? '' : 'google.protobuf.FieldOptions', _omitFieldNames ? '' : 'operationResponseField', 1151, $pb.PbFieldType.OS);
  static final operationService = $pb.Extension<$core.String>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'operationService', 1249, $pb.PbFieldType.OS);
  static final operationPollingMethod = $pb.Extension<$core.bool>(_omitMessageNames ? '' : 'google.protobuf.MethodOptions', _omitFieldNames ? '' : 'operationPollingMethod', 1250, $pb.PbFieldType.OB);
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(operationField);
    registry.add(operationRequestField);
    registry.add(operationResponseField);
    registry.add(operationService);
    registry.add(operationPollingMethod);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
