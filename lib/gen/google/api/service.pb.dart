//
//  Generated code. Do not modify.
//  source: google/api/service.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../protobuf/api.pb.dart' as $9;
import '../protobuf/type.pb.dart' as $10;
import '../protobuf/wrappers.pb.dart' as $18;
import 'auth.pb.dart' as $14;
import 'backend.pb.dart' as $12;
import 'billing.pb.dart' as $23;
import 'client.pb.dart' as $28;
import 'context.pb.dart' as $15;
import 'control.pb.dart' as $19;
import 'documentation.pb.dart' as $11;
import 'endpoint.pb.dart' as $17;
import 'http.pb.dart' as $2;
import 'log.pb.dart' as $20;
import 'logging.pb.dart' as $24;
import 'metric.pb.dart' as $21;
import 'monitored_resource.pb.dart' as $22;
import 'monitoring.pb.dart' as $25;
import 'quota.pb.dart' as $13;
import 'source_info.pb.dart' as $27;
import 'system_parameter.pb.dart' as $26;
import 'usage.pb.dart' as $16;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

///  `Service` is the root object of Google API service configuration (service
///  config). It describes the basic information about a logical service,
///  such as the service name and the user-facing title, and delegates other
///  aspects to sub-sections. Each sub-section is either a proto message or a
///  repeated proto message that configures a specific aspect, such as auth.
///  For more information, see each proto message definition.
///
///  Example:
///
///      type: google.api.Service
///      name: calendar.googleapis.com
///      title: Google Calendar API
///      apis:
///      - name: google.calendar.v3.Calendar
///
///      visibility:
///        rules:
///        - selector: "google.calendar.v3.*"
///          restriction: PREVIEW
///      backend:
///        rules:
///        - selector: "google.calendar.v3.*"
///          address: calendar.example.com
///
///      authentication:
///        providers:
///        - id: google_calendar_auth
///          jwks_uri: https://www.googleapis.com/oauth2/v1/certs
///          issuer: https://securetoken.google.com
///        rules:
///        - selector: "*"
///          requirements:
///            provider_id: google_calendar_auth
class Service extends $pb.GeneratedMessage {
  factory Service({
    $core.String? name,
    $core.String? title,
    $core.Iterable<$9.Api>? apis,
    $core.Iterable<$10.Type>? types,
    $core.Iterable<$10.Enum>? enums,
    $11.Documentation? documentation,
    $12.Backend? backend,
    $2.Http? http,
    $13.Quota? quota,
    $14.Authentication? authentication,
    $15.Context? context,
    $16.Usage? usage,
    $core.Iterable<$17.Endpoint>? endpoints,
    $18.UInt32Value? configVersion,
    $19.Control? control,
    $core.String? producerProjectId,
    $core.Iterable<$20.LogDescriptor>? logs,
    $core.Iterable<$21.MetricDescriptor>? metrics,
    $core.Iterable<$22.MonitoredResourceDescriptor>? monitoredResources,
    $23.Billing? billing,
    $24.Logging? logging,
    $25.Monitoring? monitoring,
    $26.SystemParameters? systemParameters,
    $core.String? id,
    $27.SourceInfo? sourceInfo,
    $28.Publishing? publishing,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (title != null) {
      $result.title = title;
    }
    if (apis != null) {
      $result.apis.addAll(apis);
    }
    if (types != null) {
      $result.types.addAll(types);
    }
    if (enums != null) {
      $result.enums.addAll(enums);
    }
    if (documentation != null) {
      $result.documentation = documentation;
    }
    if (backend != null) {
      $result.backend = backend;
    }
    if (http != null) {
      $result.http = http;
    }
    if (quota != null) {
      $result.quota = quota;
    }
    if (authentication != null) {
      $result.authentication = authentication;
    }
    if (context != null) {
      $result.context = context;
    }
    if (usage != null) {
      $result.usage = usage;
    }
    if (endpoints != null) {
      $result.endpoints.addAll(endpoints);
    }
    if (configVersion != null) {
      $result.configVersion = configVersion;
    }
    if (control != null) {
      $result.control = control;
    }
    if (producerProjectId != null) {
      $result.producerProjectId = producerProjectId;
    }
    if (logs != null) {
      $result.logs.addAll(logs);
    }
    if (metrics != null) {
      $result.metrics.addAll(metrics);
    }
    if (monitoredResources != null) {
      $result.monitoredResources.addAll(monitoredResources);
    }
    if (billing != null) {
      $result.billing = billing;
    }
    if (logging != null) {
      $result.logging = logging;
    }
    if (monitoring != null) {
      $result.monitoring = monitoring;
    }
    if (systemParameters != null) {
      $result.systemParameters = systemParameters;
    }
    if (id != null) {
      $result.id = id;
    }
    if (sourceInfo != null) {
      $result.sourceInfo = sourceInfo;
    }
    if (publishing != null) {
      $result.publishing = publishing;
    }
    return $result;
  }
  Service._() : super();
  factory Service.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Service.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Service', package: const $pb.PackageName(_omitMessageNames ? '' : 'google.api'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..pc<$9.Api>(3, _omitFieldNames ? '' : 'apis', $pb.PbFieldType.PM, subBuilder: $9.Api.create)
    ..pc<$10.Type>(4, _omitFieldNames ? '' : 'types', $pb.PbFieldType.PM, subBuilder: $10.Type.create)
    ..pc<$10.Enum>(5, _omitFieldNames ? '' : 'enums', $pb.PbFieldType.PM, subBuilder: $10.Enum.create)
    ..aOM<$11.Documentation>(6, _omitFieldNames ? '' : 'documentation', subBuilder: $11.Documentation.create)
    ..aOM<$12.Backend>(8, _omitFieldNames ? '' : 'backend', subBuilder: $12.Backend.create)
    ..aOM<$2.Http>(9, _omitFieldNames ? '' : 'http', subBuilder: $2.Http.create)
    ..aOM<$13.Quota>(10, _omitFieldNames ? '' : 'quota', subBuilder: $13.Quota.create)
    ..aOM<$14.Authentication>(11, _omitFieldNames ? '' : 'authentication', subBuilder: $14.Authentication.create)
    ..aOM<$15.Context>(12, _omitFieldNames ? '' : 'context', subBuilder: $15.Context.create)
    ..aOM<$16.Usage>(15, _omitFieldNames ? '' : 'usage', subBuilder: $16.Usage.create)
    ..pc<$17.Endpoint>(18, _omitFieldNames ? '' : 'endpoints', $pb.PbFieldType.PM, subBuilder: $17.Endpoint.create)
    ..aOM<$18.UInt32Value>(20, _omitFieldNames ? '' : 'configVersion', subBuilder: $18.UInt32Value.create)
    ..aOM<$19.Control>(21, _omitFieldNames ? '' : 'control', subBuilder: $19.Control.create)
    ..aOS(22, _omitFieldNames ? '' : 'producerProjectId')
    ..pc<$20.LogDescriptor>(23, _omitFieldNames ? '' : 'logs', $pb.PbFieldType.PM, subBuilder: $20.LogDescriptor.create)
    ..pc<$21.MetricDescriptor>(24, _omitFieldNames ? '' : 'metrics', $pb.PbFieldType.PM, subBuilder: $21.MetricDescriptor.create)
    ..pc<$22.MonitoredResourceDescriptor>(25, _omitFieldNames ? '' : 'monitoredResources', $pb.PbFieldType.PM, subBuilder: $22.MonitoredResourceDescriptor.create)
    ..aOM<$23.Billing>(26, _omitFieldNames ? '' : 'billing', subBuilder: $23.Billing.create)
    ..aOM<$24.Logging>(27, _omitFieldNames ? '' : 'logging', subBuilder: $24.Logging.create)
    ..aOM<$25.Monitoring>(28, _omitFieldNames ? '' : 'monitoring', subBuilder: $25.Monitoring.create)
    ..aOM<$26.SystemParameters>(29, _omitFieldNames ? '' : 'systemParameters', subBuilder: $26.SystemParameters.create)
    ..aOS(33, _omitFieldNames ? '' : 'id')
    ..aOM<$27.SourceInfo>(37, _omitFieldNames ? '' : 'sourceInfo', subBuilder: $27.SourceInfo.create)
    ..aOM<$28.Publishing>(45, _omitFieldNames ? '' : 'publishing', subBuilder: $28.Publishing.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Service clone() => Service()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Service copyWith(void Function(Service) updates) => super.copyWith((message) => updates(message as Service)) as Service;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Service create() => Service._();
  Service createEmptyInstance() => create();
  static $pb.PbList<Service> createRepeated() => $pb.PbList<Service>();
  @$core.pragma('dart2js:noInline')
  static Service getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Service>(create);
  static Service? _defaultInstance;

  /// The service name, which is a DNS-like logical identifier for the
  /// service, such as `calendar.googleapis.com`. The service name
  /// typically goes through DNS verification to make sure the owner
  /// of the service also owns the DNS name.
  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  /// The product title for this service, it is the name displayed in Google
  /// Cloud Console.
  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => $_clearField(2);

  /// A list of API interfaces exported by this service. Only the `name` field
  /// of the [google.protobuf.Api][google.protobuf.Api] needs to be provided by
  /// the configuration author, as the remaining fields will be derived from the
  /// IDL during the normalization process. It is an error to specify an API
  /// interface here which cannot be resolved against the associated IDL files.
  @$pb.TagNumber(3)
  $pb.PbList<$9.Api> get apis => $_getList(2);

  ///  A list of all proto message types included in this API service.
  ///  Types referenced directly or indirectly by the `apis` are automatically
  ///  included.  Messages which are not referenced but shall be included, such as
  ///  types used by the `google.protobuf.Any` type, should be listed here by
  ///  name by the configuration author. Example:
  ///
  ///      types:
  ///      - name: google.protobuf.Int32
  @$pb.TagNumber(4)
  $pb.PbList<$10.Type> get types => $_getList(3);

  ///  A list of all enum types included in this API service.  Enums referenced
  ///  directly or indirectly by the `apis` are automatically included.  Enums
  ///  which are not referenced but shall be included should be listed here by
  ///  name by the configuration author. Example:
  ///
  ///      enums:
  ///      - name: google.someapi.v1.SomeEnum
  @$pb.TagNumber(5)
  $pb.PbList<$10.Enum> get enums => $_getList(4);

  /// Additional API documentation.
  @$pb.TagNumber(6)
  $11.Documentation get documentation => $_getN(5);
  @$pb.TagNumber(6)
  set documentation($11.Documentation v) { $_setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasDocumentation() => $_has(5);
  @$pb.TagNumber(6)
  void clearDocumentation() => $_clearField(6);
  @$pb.TagNumber(6)
  $11.Documentation ensureDocumentation() => $_ensure(5);

  /// API backend configuration.
  @$pb.TagNumber(8)
  $12.Backend get backend => $_getN(6);
  @$pb.TagNumber(8)
  set backend($12.Backend v) { $_setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasBackend() => $_has(6);
  @$pb.TagNumber(8)
  void clearBackend() => $_clearField(8);
  @$pb.TagNumber(8)
  $12.Backend ensureBackend() => $_ensure(6);

  /// HTTP configuration.
  @$pb.TagNumber(9)
  $2.Http get http => $_getN(7);
  @$pb.TagNumber(9)
  set http($2.Http v) { $_setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasHttp() => $_has(7);
  @$pb.TagNumber(9)
  void clearHttp() => $_clearField(9);
  @$pb.TagNumber(9)
  $2.Http ensureHttp() => $_ensure(7);

  /// Quota configuration.
  @$pb.TagNumber(10)
  $13.Quota get quota => $_getN(8);
  @$pb.TagNumber(10)
  set quota($13.Quota v) { $_setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasQuota() => $_has(8);
  @$pb.TagNumber(10)
  void clearQuota() => $_clearField(10);
  @$pb.TagNumber(10)
  $13.Quota ensureQuota() => $_ensure(8);

  /// Auth configuration.
  @$pb.TagNumber(11)
  $14.Authentication get authentication => $_getN(9);
  @$pb.TagNumber(11)
  set authentication($14.Authentication v) { $_setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasAuthentication() => $_has(9);
  @$pb.TagNumber(11)
  void clearAuthentication() => $_clearField(11);
  @$pb.TagNumber(11)
  $14.Authentication ensureAuthentication() => $_ensure(9);

  /// Context configuration.
  @$pb.TagNumber(12)
  $15.Context get context => $_getN(10);
  @$pb.TagNumber(12)
  set context($15.Context v) { $_setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasContext() => $_has(10);
  @$pb.TagNumber(12)
  void clearContext() => $_clearField(12);
  @$pb.TagNumber(12)
  $15.Context ensureContext() => $_ensure(10);

  /// Configuration controlling usage of this service.
  @$pb.TagNumber(15)
  $16.Usage get usage => $_getN(11);
  @$pb.TagNumber(15)
  set usage($16.Usage v) { $_setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasUsage() => $_has(11);
  @$pb.TagNumber(15)
  void clearUsage() => $_clearField(15);
  @$pb.TagNumber(15)
  $16.Usage ensureUsage() => $_ensure(11);

  /// Configuration for network endpoints.  If this is empty, then an endpoint
  /// with the same name as the service is automatically generated to service all
  /// defined APIs.
  @$pb.TagNumber(18)
  $pb.PbList<$17.Endpoint> get endpoints => $_getList(12);

  ///  Obsolete. Do not use.
  ///
  ///  This field has no semantic meaning. The service config compiler always
  ///  sets this field to `3`.
  @$pb.TagNumber(20)
  $18.UInt32Value get configVersion => $_getN(13);
  @$pb.TagNumber(20)
  set configVersion($18.UInt32Value v) { $_setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasConfigVersion() => $_has(13);
  @$pb.TagNumber(20)
  void clearConfigVersion() => $_clearField(20);
  @$pb.TagNumber(20)
  $18.UInt32Value ensureConfigVersion() => $_ensure(13);

  /// Configuration for the service control plane.
  @$pb.TagNumber(21)
  $19.Control get control => $_getN(14);
  @$pb.TagNumber(21)
  set control($19.Control v) { $_setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasControl() => $_has(14);
  @$pb.TagNumber(21)
  void clearControl() => $_clearField(21);
  @$pb.TagNumber(21)
  $19.Control ensureControl() => $_ensure(14);

  /// The Google project that owns this service.
  @$pb.TagNumber(22)
  $core.String get producerProjectId => $_getSZ(15);
  @$pb.TagNumber(22)
  set producerProjectId($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(22)
  $core.bool hasProducerProjectId() => $_has(15);
  @$pb.TagNumber(22)
  void clearProducerProjectId() => $_clearField(22);

  /// Defines the logs used by this service.
  @$pb.TagNumber(23)
  $pb.PbList<$20.LogDescriptor> get logs => $_getList(16);

  /// Defines the metrics used by this service.
  @$pb.TagNumber(24)
  $pb.PbList<$21.MetricDescriptor> get metrics => $_getList(17);

  /// Defines the monitored resources used by this service. This is required
  /// by the [Service.monitoring][google.api.Service.monitoring] and
  /// [Service.logging][google.api.Service.logging] configurations.
  @$pb.TagNumber(25)
  $pb.PbList<$22.MonitoredResourceDescriptor> get monitoredResources => $_getList(18);

  /// Billing configuration.
  @$pb.TagNumber(26)
  $23.Billing get billing => $_getN(19);
  @$pb.TagNumber(26)
  set billing($23.Billing v) { $_setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasBilling() => $_has(19);
  @$pb.TagNumber(26)
  void clearBilling() => $_clearField(26);
  @$pb.TagNumber(26)
  $23.Billing ensureBilling() => $_ensure(19);

  /// Logging configuration.
  @$pb.TagNumber(27)
  $24.Logging get logging => $_getN(20);
  @$pb.TagNumber(27)
  set logging($24.Logging v) { $_setField(27, v); }
  @$pb.TagNumber(27)
  $core.bool hasLogging() => $_has(20);
  @$pb.TagNumber(27)
  void clearLogging() => $_clearField(27);
  @$pb.TagNumber(27)
  $24.Logging ensureLogging() => $_ensure(20);

  /// Monitoring configuration.
  @$pb.TagNumber(28)
  $25.Monitoring get monitoring => $_getN(21);
  @$pb.TagNumber(28)
  set monitoring($25.Monitoring v) { $_setField(28, v); }
  @$pb.TagNumber(28)
  $core.bool hasMonitoring() => $_has(21);
  @$pb.TagNumber(28)
  void clearMonitoring() => $_clearField(28);
  @$pb.TagNumber(28)
  $25.Monitoring ensureMonitoring() => $_ensure(21);

  /// System parameter configuration.
  @$pb.TagNumber(29)
  $26.SystemParameters get systemParameters => $_getN(22);
  @$pb.TagNumber(29)
  set systemParameters($26.SystemParameters v) { $_setField(29, v); }
  @$pb.TagNumber(29)
  $core.bool hasSystemParameters() => $_has(22);
  @$pb.TagNumber(29)
  void clearSystemParameters() => $_clearField(29);
  @$pb.TagNumber(29)
  $26.SystemParameters ensureSystemParameters() => $_ensure(22);

  /// A unique ID for a specific instance of this message, typically assigned
  /// by the client for tracking purpose. Must be no longer than 63 characters
  /// and only lower case letters, digits, '.', '_' and '-' are allowed. If
  /// empty, the server may choose to generate one instead.
  @$pb.TagNumber(33)
  $core.String get id => $_getSZ(23);
  @$pb.TagNumber(33)
  set id($core.String v) { $_setString(23, v); }
  @$pb.TagNumber(33)
  $core.bool hasId() => $_has(23);
  @$pb.TagNumber(33)
  void clearId() => $_clearField(33);

  /// Output only. The source information for this configuration if available.
  @$pb.TagNumber(37)
  $27.SourceInfo get sourceInfo => $_getN(24);
  @$pb.TagNumber(37)
  set sourceInfo($27.SourceInfo v) { $_setField(37, v); }
  @$pb.TagNumber(37)
  $core.bool hasSourceInfo() => $_has(24);
  @$pb.TagNumber(37)
  void clearSourceInfo() => $_clearField(37);
  @$pb.TagNumber(37)
  $27.SourceInfo ensureSourceInfo() => $_ensure(24);

  /// Settings for [Google Cloud Client
  /// libraries](https://cloud.google.com/apis/docs/cloud-client-libraries)
  /// generated from APIs defined as protocol buffers.
  @$pb.TagNumber(45)
  $28.Publishing get publishing => $_getN(25);
  @$pb.TagNumber(45)
  set publishing($28.Publishing v) { $_setField(45, v); }
  @$pb.TagNumber(45)
  $core.bool hasPublishing() => $_has(25);
  @$pb.TagNumber(45)
  void clearPublishing() => $_clearField(45);
  @$pb.TagNumber(45)
  $28.Publishing ensurePublishing() => $_ensure(25);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
