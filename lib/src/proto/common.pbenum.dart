//
//  Generated code. Do not modify.
//  source: common.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ServiceType extends $pb.ProtobufEnum {
  static const ServiceType UNKNOWN = ServiceType._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const ServiceType STORAGE = ServiceType._(1, _omitEnumNames ? '' : 'STORAGE');
  static const ServiceType GRAPH = ServiceType._(2, _omitEnumNames ? '' : 'GRAPH');
  static const ServiceType META = ServiceType._(3, _omitEnumNames ? '' : 'META');
  static const ServiceType ANALYTIC = ServiceType._(4, _omitEnumNames ? '' : 'ANALYTIC');
  static const ServiceType ALL = ServiceType._(5, _omitEnumNames ? '' : 'ALL');

  static const $core.List<ServiceType> values = <ServiceType> [
    UNKNOWN,
    STORAGE,
    GRAPH,
    META,
    ANALYTIC,
    ALL,
  ];

  static final $core.Map<$core.int, ServiceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ServiceType? valueOf($core.int value) => _byValue[value];

  const ServiceType._(super.v, super.n);
}

class Edge_Direction extends $pb.ProtobufEnum {
  static const Edge_Direction DIRECTED = Edge_Direction._(0, _omitEnumNames ? '' : 'DIRECTED');
  static const Edge_Direction UNDIRECTED = Edge_Direction._(1, _omitEnumNames ? '' : 'UNDIRECTED');

  static const $core.List<Edge_Direction> values = <Edge_Direction> [
    DIRECTED,
    UNDIRECTED,
  ];

  static final $core.Map<$core.int, Edge_Direction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Edge_Direction? valueOf($core.int value) => _byValue[value];

  const Edge_Direction._(super.v, super.n);
}

class Value_Type extends $pb.ProtobufEnum {
  static const Value_Type kNull = Value_Type._(0, _omitEnumNames ? '' : 'kNull');
  static const Value_Type kBool = Value_Type._(1, _omitEnumNames ? '' : 'kBool');
  static const Value_Type kInt8 = Value_Type._(2, _omitEnumNames ? '' : 'kInt8');
  static const Value_Type kUInt8 = Value_Type._(3, _omitEnumNames ? '' : 'kUInt8');
  static const Value_Type kInt16 = Value_Type._(4, _omitEnumNames ? '' : 'kInt16');
  static const Value_Type kUInt16 = Value_Type._(5, _omitEnumNames ? '' : 'kUInt16');
  static const Value_Type kInt32 = Value_Type._(6, _omitEnumNames ? '' : 'kInt32');
  static const Value_Type kUInt32 = Value_Type._(7, _omitEnumNames ? '' : 'kUInt32');
  static const Value_Type kInt64 = Value_Type._(8, _omitEnumNames ? '' : 'kInt64');
  static const Value_Type kUInt64 = Value_Type._(9, _omitEnumNames ? '' : 'kUInt64');
  static const Value_Type kFloat = Value_Type._(10, _omitEnumNames ? '' : 'kFloat');
  static const Value_Type kDouble = Value_Type._(11, _omitEnumNames ? '' : 'kDouble');
  static const Value_Type kString = Value_Type._(12, _omitEnumNames ? '' : 'kString');
  static const Value_Type kList = Value_Type._(13, _omitEnumNames ? '' : 'kList');
  static const Value_Type kRecord = Value_Type._(14, _omitEnumNames ? '' : 'kRecord');
  static const Value_Type kNode = Value_Type._(15, _omitEnumNames ? '' : 'kNode');
  static const Value_Type kEdge = Value_Type._(16, _omitEnumNames ? '' : 'kEdge');
  static const Value_Type kPath = Value_Type._(17, _omitEnumNames ? '' : 'kPath');
  static const Value_Type kDuration = Value_Type._(18, _omitEnumNames ? '' : 'kDuration');
  static const Value_Type kLocalTime = Value_Type._(19, _omitEnumNames ? '' : 'kLocalTime');
  static const Value_Type kZonedTime = Value_Type._(20, _omitEnumNames ? '' : 'kZonedTime');
  static const Value_Type kDate = Value_Type._(21, _omitEnumNames ? '' : 'kDate');
  static const Value_Type kLocalDatetime = Value_Type._(22, _omitEnumNames ? '' : 'kLocalDatetime');
  static const Value_Type kZonedDatetime = Value_Type._(23, _omitEnumNames ? '' : 'kZonedDatetime');
  static const Value_Type kRef = Value_Type._(24, _omitEnumNames ? '' : 'kRef');
  static const Value_Type kDecimal = Value_Type._(25, _omitEnumNames ? '' : 'kDecimal');
  static const Value_Type kVector = Value_Type._(26, _omitEnumNames ? '' : 'kVector');

  static const $core.List<Value_Type> values = <Value_Type> [
    kNull,
    kBool,
    kInt8,
    kUInt8,
    kInt16,
    kUInt16,
    kInt32,
    kUInt32,
    kInt64,
    kUInt64,
    kFloat,
    kDouble,
    kString,
    kList,
    kRecord,
    kNode,
    kEdge,
    kPath,
    kDuration,
    kLocalTime,
    kZonedTime,
    kDate,
    kLocalDatetime,
    kZonedDatetime,
    kRef,
    kDecimal,
    kVector,
  ];

  static final $core.Map<$core.int, Value_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Value_Type? valueOf($core.int value) => _byValue[value];

  const Value_Type._(super.v, super.n);
}

class ClientInfo_Language extends $pb.ProtobufEnum {
  static const ClientInfo_Language UNKNOWN = ClientInfo_Language._(0, _omitEnumNames ? '' : 'UNKNOWN');
  static const ClientInfo_Language CPP = ClientInfo_Language._(1, _omitEnumNames ? '' : 'CPP');
  static const ClientInfo_Language GO = ClientInfo_Language._(2, _omitEnumNames ? '' : 'GO');
  static const ClientInfo_Language JAVA = ClientInfo_Language._(3, _omitEnumNames ? '' : 'JAVA');
  static const ClientInfo_Language PYTHON = ClientInfo_Language._(4, _omitEnumNames ? '' : 'PYTHON');
  static const ClientInfo_Language JAVASCRIPT = ClientInfo_Language._(5, _omitEnumNames ? '' : 'JAVASCRIPT');

  static const $core.List<ClientInfo_Language> values = <ClientInfo_Language> [
    UNKNOWN,
    CPP,
    GO,
    JAVA,
    PYTHON,
    JAVASCRIPT,
  ];

  static final $core.Map<$core.int, ClientInfo_Language> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ClientInfo_Language? valueOf($core.int value) => _byValue[value];

  const ClientInfo_Language._(super.v, super.n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
