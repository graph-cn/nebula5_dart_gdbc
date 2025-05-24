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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'common.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'common.pbenum.dart';

/// *
///  Only 4 and 8 byte integers are supported by protobuf.
///  These integers are encoded as varints on wire.
///  If the memory footprint is a concern, we should implement our
///  own codec scheme for some of messages like `Duration' and `Date'.
class Duration extends $pb.GeneratedMessage {
  factory Duration({
    $core.bool? isMonthBased,
    $core.int? year,
    $core.int? month,
    $core.int? day,
    $core.int? hour,
    $core.int? minute,
    $core.int? sec,
    $core.int? microsec,
  }) {
    final $result = create();
    if (isMonthBased != null) {
      $result.isMonthBased = isMonthBased;
    }
    if (year != null) {
      $result.year = year;
    }
    if (month != null) {
      $result.month = month;
    }
    if (day != null) {
      $result.day = day;
    }
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    if (sec != null) {
      $result.sec = sec;
    }
    if (microsec != null) {
      $result.microsec = microsec;
    }
    return $result;
  }
  Duration._() : super();
  factory Duration.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Duration.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Duration', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isMonthBased')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'month', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'day', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'sec', $pb.PbFieldType.O3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'microsec', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Duration clone() => Duration()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Duration copyWith(void Function(Duration) updates) => super.copyWith((message) => updates(message as Duration)) as Duration;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Duration create() => Duration._();
  Duration createEmptyInstance() => create();
  static $pb.PbList<Duration> createRepeated() => $pb.PbList<Duration>();
  @$core.pragma('dart2js:noInline')
  static Duration getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Duration>(create);
  static Duration? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isMonthBased => $_getBF(0);
  @$pb.TagNumber(1)
  set isMonthBased($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasIsMonthBased() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsMonthBased() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get year => $_getIZ(1);
  @$pb.TagNumber(2)
  set year($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasYear() => $_has(1);
  @$pb.TagNumber(2)
  void clearYear() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get month => $_getIZ(2);
  @$pb.TagNumber(3)
  set month($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMonth() => $_has(2);
  @$pb.TagNumber(3)
  void clearMonth() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get day => $_getIZ(3);
  @$pb.TagNumber(4)
  set day($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDay() => $_has(3);
  @$pb.TagNumber(4)
  void clearDay() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get hour => $_getIZ(4);
  @$pb.TagNumber(5)
  set hour($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHour() => $_has(4);
  @$pb.TagNumber(5)
  void clearHour() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get minute => $_getIZ(5);
  @$pb.TagNumber(6)
  set minute($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasMinute() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinute() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get sec => $_getIZ(6);
  @$pb.TagNumber(7)
  set sec($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSec() => $_has(6);
  @$pb.TagNumber(7)
  void clearSec() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get microsec => $_getIZ(7);
  @$pb.TagNumber(8)
  set microsec($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasMicrosec() => $_has(7);
  @$pb.TagNumber(8)
  void clearMicrosec() => $_clearField(8);
}

class Date extends $pb.GeneratedMessage {
  factory Date({
    $core.int? year,
    $core.int? month,
    $core.int? day,
  }) {
    final $result = create();
    if (year != null) {
      $result.year = year;
    }
    if (month != null) {
      $result.month = month;
    }
    if (day != null) {
      $result.day = day;
    }
    return $result;
  }
  Date._() : super();
  factory Date.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Date.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Date', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'month', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'day', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Date clone() => Date()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Date copyWith(void Function(Date) updates) => super.copyWith((message) => updates(message as Date)) as Date;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Date create() => Date._();
  Date createEmptyInstance() => create();
  static $pb.PbList<Date> createRepeated() => $pb.PbList<Date>();
  @$core.pragma('dart2js:noInline')
  static Date getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Date>(create);
  static Date? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get day => $_getIZ(2);
  @$pb.TagNumber(3)
  set day($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDay() => $_clearField(3);
}

class LocalTime extends $pb.GeneratedMessage {
  factory LocalTime({
    $core.int? hour,
    $core.int? minute,
    $core.int? sec,
    $core.int? microsec,
  }) {
    final $result = create();
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    if (sec != null) {
      $result.sec = sec;
    }
    if (microsec != null) {
      $result.microsec = microsec;
    }
    return $result;
  }
  LocalTime._() : super();
  factory LocalTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocalTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocalTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sec', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'microsec', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocalTime clone() => LocalTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocalTime copyWith(void Function(LocalTime) updates) => super.copyWith((message) => updates(message as LocalTime)) as LocalTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalTime create() => LocalTime._();
  LocalTime createEmptyInstance() => create();
  static $pb.PbList<LocalTime> createRepeated() => $pb.PbList<LocalTime>();
  @$core.pragma('dart2js:noInline')
  static LocalTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocalTime>(create);
  static LocalTime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hour => $_getIZ(0);
  @$pb.TagNumber(1)
  set hour($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHour() => $_has(0);
  @$pb.TagNumber(1)
  void clearHour() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get minute => $_getIZ(1);
  @$pb.TagNumber(2)
  set minute($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinute() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinute() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get sec => $_getIZ(2);
  @$pb.TagNumber(3)
  set sec($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSec() => $_has(2);
  @$pb.TagNumber(3)
  void clearSec() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get microsec => $_getIZ(3);
  @$pb.TagNumber(4)
  set microsec($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMicrosec() => $_has(3);
  @$pb.TagNumber(4)
  void clearMicrosec() => $_clearField(4);
}

class ZonedTime extends $pb.GeneratedMessage {
  factory ZonedTime({
    $core.int? hour,
    $core.int? minute,
    $core.int? sec,
    $core.int? microsec,
    $core.int? offset,
  }) {
    final $result = create();
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    if (sec != null) {
      $result.sec = sec;
    }
    if (microsec != null) {
      $result.microsec = microsec;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ZonedTime._() : super();
  factory ZonedTime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ZonedTime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ZonedTime', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'sec', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'microsec', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ZonedTime clone() => ZonedTime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ZonedTime copyWith(void Function(ZonedTime) updates) => super.copyWith((message) => updates(message as ZonedTime)) as ZonedTime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ZonedTime create() => ZonedTime._();
  ZonedTime createEmptyInstance() => create();
  static $pb.PbList<ZonedTime> createRepeated() => $pb.PbList<ZonedTime>();
  @$core.pragma('dart2js:noInline')
  static ZonedTime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ZonedTime>(create);
  static ZonedTime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get hour => $_getIZ(0);
  @$pb.TagNumber(1)
  set hour($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHour() => $_has(0);
  @$pb.TagNumber(1)
  void clearHour() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get minute => $_getIZ(1);
  @$pb.TagNumber(2)
  set minute($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinute() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinute() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get sec => $_getIZ(2);
  @$pb.TagNumber(3)
  set sec($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSec() => $_has(2);
  @$pb.TagNumber(3)
  void clearSec() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get microsec => $_getIZ(3);
  @$pb.TagNumber(4)
  set microsec($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMicrosec() => $_has(3);
  @$pb.TagNumber(4)
  void clearMicrosec() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get offset => $_getIZ(4);
  @$pb.TagNumber(5)
  set offset($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOffset() => $_has(4);
  @$pb.TagNumber(5)
  void clearOffset() => $_clearField(5);
}

class LocalDatetime extends $pb.GeneratedMessage {
  factory LocalDatetime({
    $core.int? year,
    $core.int? month,
    $core.int? day,
    $core.int? hour,
    $core.int? minute,
    $core.int? sec,
    $core.int? microsec,
  }) {
    final $result = create();
    if (year != null) {
      $result.year = year;
    }
    if (month != null) {
      $result.month = month;
    }
    if (day != null) {
      $result.day = day;
    }
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    if (sec != null) {
      $result.sec = sec;
    }
    if (microsec != null) {
      $result.microsec = microsec;
    }
    return $result;
  }
  LocalDatetime._() : super();
  factory LocalDatetime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LocalDatetime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LocalDatetime', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'month', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'day', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'sec', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'microsec', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LocalDatetime clone() => LocalDatetime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LocalDatetime copyWith(void Function(LocalDatetime) updates) => super.copyWith((message) => updates(message as LocalDatetime)) as LocalDatetime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LocalDatetime create() => LocalDatetime._();
  LocalDatetime createEmptyInstance() => create();
  static $pb.PbList<LocalDatetime> createRepeated() => $pb.PbList<LocalDatetime>();
  @$core.pragma('dart2js:noInline')
  static LocalDatetime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LocalDatetime>(create);
  static LocalDatetime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get day => $_getIZ(2);
  @$pb.TagNumber(3)
  set day($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDay() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get hour => $_getIZ(3);
  @$pb.TagNumber(4)
  set hour($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHour() => $_has(3);
  @$pb.TagNumber(4)
  void clearHour() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get minute => $_getIZ(4);
  @$pb.TagNumber(5)
  set minute($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinute() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinute() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get sec => $_getIZ(5);
  @$pb.TagNumber(6)
  set sec($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSec() => $_has(5);
  @$pb.TagNumber(6)
  void clearSec() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get microsec => $_getIZ(6);
  @$pb.TagNumber(7)
  set microsec($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMicrosec() => $_has(6);
  @$pb.TagNumber(7)
  void clearMicrosec() => $_clearField(7);
}

class ZonedDatetime extends $pb.GeneratedMessage {
  factory ZonedDatetime({
    $core.int? year,
    $core.int? month,
    $core.int? day,
    $core.int? hour,
    $core.int? minute,
    $core.int? sec,
    $core.int? microsec,
    $core.int? offset,
  }) {
    final $result = create();
    if (year != null) {
      $result.year = year;
    }
    if (month != null) {
      $result.month = month;
    }
    if (day != null) {
      $result.day = day;
    }
    if (hour != null) {
      $result.hour = hour;
    }
    if (minute != null) {
      $result.minute = minute;
    }
    if (sec != null) {
      $result.sec = sec;
    }
    if (microsec != null) {
      $result.microsec = microsec;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  ZonedDatetime._() : super();
  factory ZonedDatetime.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ZonedDatetime.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ZonedDatetime', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'year', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'month', $pb.PbFieldType.OU3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'day', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'hour', $pb.PbFieldType.OU3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'minute', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'sec', $pb.PbFieldType.OU3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'microsec', $pb.PbFieldType.OU3)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ZonedDatetime clone() => ZonedDatetime()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ZonedDatetime copyWith(void Function(ZonedDatetime) updates) => super.copyWith((message) => updates(message as ZonedDatetime)) as ZonedDatetime;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ZonedDatetime create() => ZonedDatetime._();
  ZonedDatetime createEmptyInstance() => create();
  static $pb.PbList<ZonedDatetime> createRepeated() => $pb.PbList<ZonedDatetime>();
  @$core.pragma('dart2js:noInline')
  static ZonedDatetime getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ZonedDatetime>(create);
  static ZonedDatetime? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get year => $_getIZ(0);
  @$pb.TagNumber(1)
  set year($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasYear() => $_has(0);
  @$pb.TagNumber(1)
  void clearYear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get month => $_getIZ(1);
  @$pb.TagNumber(2)
  set month($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMonth() => $_has(1);
  @$pb.TagNumber(2)
  void clearMonth() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get day => $_getIZ(2);
  @$pb.TagNumber(3)
  set day($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDay() => $_has(2);
  @$pb.TagNumber(3)
  void clearDay() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get hour => $_getIZ(3);
  @$pb.TagNumber(4)
  set hour($core.int v) { $_setUnsignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHour() => $_has(3);
  @$pb.TagNumber(4)
  void clearHour() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get minute => $_getIZ(4);
  @$pb.TagNumber(5)
  set minute($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMinute() => $_has(4);
  @$pb.TagNumber(5)
  void clearMinute() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get sec => $_getIZ(5);
  @$pb.TagNumber(6)
  set sec($core.int v) { $_setUnsignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSec() => $_has(5);
  @$pb.TagNumber(6)
  void clearSec() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get microsec => $_getIZ(6);
  @$pb.TagNumber(7)
  set microsec($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasMicrosec() => $_has(6);
  @$pb.TagNumber(7)
  void clearMicrosec() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.int get offset => $_getIZ(7);
  @$pb.TagNumber(8)
  set offset($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOffset() => $_has(7);
  @$pb.TagNumber(8)
  void clearOffset() => $_clearField(8);
}

class List_ extends $pb.GeneratedMessage {
  factory List_({
    $core.Iterable<Value>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  List_._() : super();
  factory List_.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory List_.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'List', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..pc<Value>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.PM, subBuilder: Value.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  List_ clone() => List_()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  List_ copyWith(void Function(List_) updates) => super.copyWith((message) => updates(message as List_)) as List_;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static List_ create() => List_._();
  List_ createEmptyInstance() => create();
  static $pb.PbList<List_> createRepeated() => $pb.PbList<List_>();
  @$core.pragma('dart2js:noInline')
  static List_ getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<List_>(create);
  static List_? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Value> get values => $_getList(0);
}

class Vector extends $pb.GeneratedMessage {
  factory Vector({
    $core.Iterable<$core.double>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  Vector._() : super();
  factory Vector.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Vector.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Vector', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..p<$core.double>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.KF)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Vector clone() => Vector()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Vector copyWith(void Function(Vector) updates) => super.copyWith((message) => updates(message as Vector)) as Vector;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Vector create() => Vector._();
  Vector createEmptyInstance() => create();
  static $pb.PbList<Vector> createRepeated() => $pb.PbList<Vector>();
  @$core.pragma('dart2js:noInline')
  static Vector getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Vector>(create);
  static Vector? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$core.double> get values => $_getList(0);
}

class Record extends $pb.GeneratedMessage {
  factory Record({
    $core.Iterable<$core.MapEntry<$core.String, Value>>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addEntries(values);
    }
    return $result;
  }
  Record._() : super();
  factory Record.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Record.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Record', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..m<$core.String, Value>(1, _omitFieldNames ? '' : 'values', entryClassName: 'Record.ValuesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, valueDefaultOrMaker: Value.getDefault, packageName: const $pb.PackageName('nebula.proto.common'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Record clone() => Record()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Record copyWith(void Function(Record) updates) => super.copyWith((message) => updates(message as Record)) as Record;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Record create() => Record._();
  Record createEmptyInstance() => create();
  static $pb.PbList<Record> createRepeated() => $pb.PbList<Record>();
  @$core.pragma('dart2js:noInline')
  static Record getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Record>(create);
  static Record? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbMap<$core.String, Value> get values => $_getMap(0);
}

class Node extends $pb.GeneratedMessage {
  factory Node({
    $fixnum.Int64? nodeId,
    $core.String? graph,
    $core.String? type,
    $core.Iterable<$core.String>? labels,
    $core.Iterable<$core.MapEntry<$core.String, Value>>? properties,
  }) {
    final $result = create();
    if (nodeId != null) {
      $result.nodeId = nodeId;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (type != null) {
      $result.type = type;
    }
    if (labels != null) {
      $result.labels.addAll(labels);
    }
    if (properties != null) {
      $result.properties.addEntries(properties);
    }
    return $result;
  }
  Node._() : super();
  factory Node.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Node.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Node', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'nodeId')
    ..aOS(2, _omitFieldNames ? '' : 'graph')
    ..aOS(3, _omitFieldNames ? '' : 'type')
    ..pPS(4, _omitFieldNames ? '' : 'labels')
    ..m<$core.String, Value>(5, _omitFieldNames ? '' : 'properties', entryClassName: 'Node.PropertiesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, valueDefaultOrMaker: Value.getDefault, packageName: const $pb.PackageName('nebula.proto.common'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Node clone() => Node()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Node copyWith(void Function(Node) updates) => super.copyWith((message) => updates(message as Node)) as Node;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Node create() => Node._();
  Node createEmptyInstance() => create();
  static $pb.PbList<Node> createRepeated() => $pb.PbList<Node>();
  @$core.pragma('dart2js:noInline')
  static Node getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Node>(create);
  static Node? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get nodeId => $_getI64(0);
  @$pb.TagNumber(1)
  set nodeId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasNodeId() => $_has(0);
  @$pb.TagNumber(1)
  void clearNodeId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get graph => $_getSZ(1);
  @$pb.TagNumber(2)
  set graph($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGraph() => $_has(1);
  @$pb.TagNumber(2)
  void clearGraph() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get type => $_getSZ(2);
  @$pb.TagNumber(3)
  set type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get labels => $_getList(3);

  @$pb.TagNumber(5)
  $pb.PbMap<$core.String, Value> get properties => $_getMap(4);
}

class Edge extends $pb.GeneratedMessage {
  factory Edge({
    $fixnum.Int64? srcId,
    $fixnum.Int64? dstId,
    Edge_Direction? direction,
    $core.String? graph,
    $core.String? type,
    $core.Iterable<$core.String>? labels,
    $fixnum.Int64? rank,
    $core.Iterable<$core.MapEntry<$core.String, Value>>? properties,
  }) {
    final $result = create();
    if (srcId != null) {
      $result.srcId = srcId;
    }
    if (dstId != null) {
      $result.dstId = dstId;
    }
    if (direction != null) {
      $result.direction = direction;
    }
    if (graph != null) {
      $result.graph = graph;
    }
    if (type != null) {
      $result.type = type;
    }
    if (labels != null) {
      $result.labels.addAll(labels);
    }
    if (rank != null) {
      $result.rank = rank;
    }
    if (properties != null) {
      $result.properties.addEntries(properties);
    }
    return $result;
  }
  Edge._() : super();
  factory Edge.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Edge.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Edge', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'srcId')
    ..aInt64(2, _omitFieldNames ? '' : 'dstId')
    ..e<Edge_Direction>(3, _omitFieldNames ? '' : 'direction', $pb.PbFieldType.OE, defaultOrMaker: Edge_Direction.DIRECTED, valueOf: Edge_Direction.valueOf, enumValues: Edge_Direction.values)
    ..aOS(4, _omitFieldNames ? '' : 'graph')
    ..aOS(5, _omitFieldNames ? '' : 'type')
    ..pPS(6, _omitFieldNames ? '' : 'labels')
    ..aInt64(7, _omitFieldNames ? '' : 'rank')
    ..m<$core.String, Value>(8, _omitFieldNames ? '' : 'properties', entryClassName: 'Edge.PropertiesEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: Value.create, valueDefaultOrMaker: Value.getDefault, packageName: const $pb.PackageName('nebula.proto.common'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Edge clone() => Edge()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Edge copyWith(void Function(Edge) updates) => super.copyWith((message) => updates(message as Edge)) as Edge;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Edge create() => Edge._();
  Edge createEmptyInstance() => create();
  static $pb.PbList<Edge> createRepeated() => $pb.PbList<Edge>();
  @$core.pragma('dart2js:noInline')
  static Edge getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Edge>(create);
  static Edge? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get srcId => $_getI64(0);
  @$pb.TagNumber(1)
  set srcId($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSrcId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSrcId() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get dstId => $_getI64(1);
  @$pb.TagNumber(2)
  set dstId($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDstId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDstId() => $_clearField(2);

  @$pb.TagNumber(3)
  Edge_Direction get direction => $_getN(2);
  @$pb.TagNumber(3)
  set direction(Edge_Direction v) { $_setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasDirection() => $_has(2);
  @$pb.TagNumber(3)
  void clearDirection() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get graph => $_getSZ(3);
  @$pb.TagNumber(4)
  set graph($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGraph() => $_has(3);
  @$pb.TagNumber(4)
  void clearGraph() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get type => $_getSZ(4);
  @$pb.TagNumber(5)
  set type($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasType() => $_has(4);
  @$pb.TagNumber(5)
  void clearType() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get labels => $_getList(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get rank => $_getI64(6);
  @$pb.TagNumber(7)
  set rank($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasRank() => $_has(6);
  @$pb.TagNumber(7)
  void clearRank() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbMap<$core.String, Value> get properties => $_getMap(7);
}

class Decimal extends $pb.GeneratedMessage {
  factory Decimal({
    $core.String? sval,
  }) {
    final $result = create();
    if (sval != null) {
      $result.sval = sval;
    }
    return $result;
  }
  Decimal._() : super();
  factory Decimal.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Decimal.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Decimal', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'sval')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Decimal clone() => Decimal()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Decimal copyWith(void Function(Decimal) updates) => super.copyWith((message) => updates(message as Decimal)) as Decimal;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Decimal create() => Decimal._();
  Decimal createEmptyInstance() => create();
  static $pb.PbList<Decimal> createRepeated() => $pb.PbList<Decimal>();
  @$core.pragma('dart2js:noInline')
  static Decimal getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Decimal>(create);
  static Decimal? _defaultInstance;

  /// int16 ndigits;
  /// int32  weight = 1;
  /// int32  dscale = 2;
  /// int32  sign   = 3;
  /// bytes  digits = 4;
  @$pb.TagNumber(5)
  $core.String get sval => $_getSZ(0);
  @$pb.TagNumber(5)
  set sval($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasSval() => $_has(0);
  @$pb.TagNumber(5)
  void clearSval() => $_clearField(5);
}

class Path extends $pb.GeneratedMessage {
  factory Path({
    $core.Iterable<Value>? values,
  }) {
    final $result = create();
    if (values != null) {
      $result.values.addAll(values);
    }
    return $result;
  }
  Path._() : super();
  factory Path.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Path.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Path', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..pc<Value>(1, _omitFieldNames ? '' : 'values', $pb.PbFieldType.PM, subBuilder: Value.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Path clone() => Path()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Path copyWith(void Function(Path) updates) => super.copyWith((message) => updates(message as Path)) as Path;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Path create() => Path._();
  Path createEmptyInstance() => create();
  static $pb.PbList<Path> createRepeated() => $pb.PbList<Path>();
  @$core.pragma('dart2js:noInline')
  static Path getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Path>(create);
  static Path? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Value> get values => $_getList(0);
}

class Ref extends $pb.GeneratedMessage {
  factory Ref({
    $core.int? code,
    $core.int? offset,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (offset != null) {
      $result.offset = offset;
    }
    return $result;
  }
  Ref._() : super();
  factory Ref.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Ref.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Ref', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OU3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Ref clone() => Ref()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Ref copyWith(void Function(Ref) updates) => super.copyWith((message) => updates(message as Ref)) as Ref;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Ref create() => Ref._();
  Ref createEmptyInstance() => create();
  static $pb.PbList<Ref> createRepeated() => $pb.PbList<Ref>();
  @$core.pragma('dart2js:noInline')
  static Ref getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Ref>(create);
  static Ref? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get code => $_getIZ(0);
  @$pb.TagNumber(1)
  set code($core.int v) { $_setUnsignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get offset => $_getIZ(1);
  @$pb.TagNumber(2)
  set offset($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOffset() => $_has(1);
  @$pb.TagNumber(2)
  void clearOffset() => $_clearField(2);
}

enum Value_Data {
  boolValue, 
  int8Value, 
  uint8Value, 
  int16Value, 
  uint16Value, 
  int32Value, 
  uint32Value, 
  int64Value, 
  uint64Value, 
  floatValue, 
  doubleValue, 
  stringValue, 
  listValue, 
  recordValue, 
  nodeValue, 
  edgeValue, 
  pathValue, 
  durationValue, 
  localTimeValue, 
  zonedTimeValue, 
  dateValue, 
  localDatetimeValue, 
  zonedDatetimeValue, 
  refValue, 
  decimalValue, 
  vectorValue, 
  notSet
}

/// *
///  NOTE
///   - There is no (u)int8 or (u)int16 in protobuf, we use (u)int32 instead.
///   - We use `bytes' for the `string' type, because the latter is subject to
///     the UTF8 checking in the protobuf's encoding.
class Value extends $pb.GeneratedMessage {
  factory Value({
    $core.bool? boolValue,
    $core.int? int8Value,
    $core.int? uint8Value,
    $core.int? int16Value,
    $core.int? uint16Value,
    $core.int? int32Value,
    $core.int? uint32Value,
    $fixnum.Int64? int64Value,
    $fixnum.Int64? uint64Value,
    $core.double? floatValue,
    $core.double? doubleValue,
    $core.List<$core.int>? stringValue,
    List_? listValue,
    Record? recordValue,
    Node? nodeValue,
    Edge? edgeValue,
    Path? pathValue,
    Duration? durationValue,
    LocalTime? localTimeValue,
    ZonedTime? zonedTimeValue,
    Date? dateValue,
    LocalDatetime? localDatetimeValue,
    ZonedDatetime? zonedDatetimeValue,
    Ref? refValue,
    Decimal? decimalValue,
    Vector? vectorValue,
  }) {
    final $result = create();
    if (boolValue != null) {
      $result.boolValue = boolValue;
    }
    if (int8Value != null) {
      $result.int8Value = int8Value;
    }
    if (uint8Value != null) {
      $result.uint8Value = uint8Value;
    }
    if (int16Value != null) {
      $result.int16Value = int16Value;
    }
    if (uint16Value != null) {
      $result.uint16Value = uint16Value;
    }
    if (int32Value != null) {
      $result.int32Value = int32Value;
    }
    if (uint32Value != null) {
      $result.uint32Value = uint32Value;
    }
    if (int64Value != null) {
      $result.int64Value = int64Value;
    }
    if (uint64Value != null) {
      $result.uint64Value = uint64Value;
    }
    if (floatValue != null) {
      $result.floatValue = floatValue;
    }
    if (doubleValue != null) {
      $result.doubleValue = doubleValue;
    }
    if (stringValue != null) {
      $result.stringValue = stringValue;
    }
    if (listValue != null) {
      $result.listValue = listValue;
    }
    if (recordValue != null) {
      $result.recordValue = recordValue;
    }
    if (nodeValue != null) {
      $result.nodeValue = nodeValue;
    }
    if (edgeValue != null) {
      $result.edgeValue = edgeValue;
    }
    if (pathValue != null) {
      $result.pathValue = pathValue;
    }
    if (durationValue != null) {
      $result.durationValue = durationValue;
    }
    if (localTimeValue != null) {
      $result.localTimeValue = localTimeValue;
    }
    if (zonedTimeValue != null) {
      $result.zonedTimeValue = zonedTimeValue;
    }
    if (dateValue != null) {
      $result.dateValue = dateValue;
    }
    if (localDatetimeValue != null) {
      $result.localDatetimeValue = localDatetimeValue;
    }
    if (zonedDatetimeValue != null) {
      $result.zonedDatetimeValue = zonedDatetimeValue;
    }
    if (refValue != null) {
      $result.refValue = refValue;
    }
    if (decimalValue != null) {
      $result.decimalValue = decimalValue;
    }
    if (vectorValue != null) {
      $result.vectorValue = vectorValue;
    }
    return $result;
  }
  Value._() : super();
  factory Value.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Value.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Value_Data> _Value_DataByTag = {
    1 : Value_Data.boolValue,
    2 : Value_Data.int8Value,
    3 : Value_Data.uint8Value,
    4 : Value_Data.int16Value,
    5 : Value_Data.uint16Value,
    6 : Value_Data.int32Value,
    7 : Value_Data.uint32Value,
    8 : Value_Data.int64Value,
    9 : Value_Data.uint64Value,
    10 : Value_Data.floatValue,
    11 : Value_Data.doubleValue,
    12 : Value_Data.stringValue,
    13 : Value_Data.listValue,
    14 : Value_Data.recordValue,
    15 : Value_Data.nodeValue,
    16 : Value_Data.edgeValue,
    17 : Value_Data.pathValue,
    18 : Value_Data.durationValue,
    19 : Value_Data.localTimeValue,
    20 : Value_Data.zonedTimeValue,
    21 : Value_Data.dateValue,
    22 : Value_Data.localDatetimeValue,
    23 : Value_Data.zonedDatetimeValue,
    24 : Value_Data.refValue,
    25 : Value_Data.decimalValue,
    26 : Value_Data.vectorValue,
    0 : Value_Data.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Value', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..oo(0, [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26])
    ..aOB(1, _omitFieldNames ? '' : 'boolValue')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'int8Value', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'uint8Value', $pb.PbFieldType.OU3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'int16Value', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'uint16Value', $pb.PbFieldType.OU3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'int32Value', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'uint32Value', $pb.PbFieldType.OU3)
    ..aInt64(8, _omitFieldNames ? '' : 'int64Value')
    ..a<$fixnum.Int64>(9, _omitFieldNames ? '' : 'uint64Value', $pb.PbFieldType.OU6, defaultOrMaker: $fixnum.Int64.ZERO)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'floatValue', $pb.PbFieldType.OF)
    ..a<$core.double>(11, _omitFieldNames ? '' : 'doubleValue', $pb.PbFieldType.OD)
    ..a<$core.List<$core.int>>(12, _omitFieldNames ? '' : 'stringValue', $pb.PbFieldType.OY)
    ..aOM<List_>(13, _omitFieldNames ? '' : 'listValue', subBuilder: List_.create)
    ..aOM<Record>(14, _omitFieldNames ? '' : 'recordValue', subBuilder: Record.create)
    ..aOM<Node>(15, _omitFieldNames ? '' : 'nodeValue', subBuilder: Node.create)
    ..aOM<Edge>(16, _omitFieldNames ? '' : 'edgeValue', subBuilder: Edge.create)
    ..aOM<Path>(17, _omitFieldNames ? '' : 'pathValue', subBuilder: Path.create)
    ..aOM<Duration>(18, _omitFieldNames ? '' : 'durationValue', subBuilder: Duration.create)
    ..aOM<LocalTime>(19, _omitFieldNames ? '' : 'localTimeValue', subBuilder: LocalTime.create)
    ..aOM<ZonedTime>(20, _omitFieldNames ? '' : 'zonedTimeValue', subBuilder: ZonedTime.create)
    ..aOM<Date>(21, _omitFieldNames ? '' : 'dateValue', subBuilder: Date.create)
    ..aOM<LocalDatetime>(22, _omitFieldNames ? '' : 'localDatetimeValue', subBuilder: LocalDatetime.create)
    ..aOM<ZonedDatetime>(23, _omitFieldNames ? '' : 'zonedDatetimeValue', subBuilder: ZonedDatetime.create)
    ..aOM<Ref>(24, _omitFieldNames ? '' : 'refValue', subBuilder: Ref.create)
    ..aOM<Decimal>(25, _omitFieldNames ? '' : 'decimalValue', subBuilder: Decimal.create)
    ..aOM<Vector>(26, _omitFieldNames ? '' : 'vectorValue', subBuilder: Vector.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Value clone() => Value()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Value copyWith(void Function(Value) updates) => super.copyWith((message) => updates(message as Value)) as Value;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Value create() => Value._();
  Value createEmptyInstance() => create();
  static $pb.PbList<Value> createRepeated() => $pb.PbList<Value>();
  @$core.pragma('dart2js:noInline')
  static Value getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Value>(create);
  static Value? _defaultInstance;

  Value_Data whichData() => _Value_DataByTag[$_whichOneof(0)]!;
  void clearData() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.bool get boolValue => $_getBF(0);
  @$pb.TagNumber(1)
  set boolValue($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoolValue() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoolValue() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get int8Value => $_getIZ(1);
  @$pb.TagNumber(2)
  set int8Value($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasInt8Value() => $_has(1);
  @$pb.TagNumber(2)
  void clearInt8Value() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get uint8Value => $_getIZ(2);
  @$pb.TagNumber(3)
  set uint8Value($core.int v) { $_setUnsignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUint8Value() => $_has(2);
  @$pb.TagNumber(3)
  void clearUint8Value() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get int16Value => $_getIZ(3);
  @$pb.TagNumber(4)
  set int16Value($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInt16Value() => $_has(3);
  @$pb.TagNumber(4)
  void clearInt16Value() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get uint16Value => $_getIZ(4);
  @$pb.TagNumber(5)
  set uint16Value($core.int v) { $_setUnsignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasUint16Value() => $_has(4);
  @$pb.TagNumber(5)
  void clearUint16Value() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get int32Value => $_getIZ(5);
  @$pb.TagNumber(6)
  set int32Value($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasInt32Value() => $_has(5);
  @$pb.TagNumber(6)
  void clearInt32Value() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get uint32Value => $_getIZ(6);
  @$pb.TagNumber(7)
  set uint32Value($core.int v) { $_setUnsignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasUint32Value() => $_has(6);
  @$pb.TagNumber(7)
  void clearUint32Value() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get int64Value => $_getI64(7);
  @$pb.TagNumber(8)
  set int64Value($fixnum.Int64 v) { $_setInt64(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasInt64Value() => $_has(7);
  @$pb.TagNumber(8)
  void clearInt64Value() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get uint64Value => $_getI64(8);
  @$pb.TagNumber(9)
  set uint64Value($fixnum.Int64 v) { $_setInt64(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasUint64Value() => $_has(8);
  @$pb.TagNumber(9)
  void clearUint64Value() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get floatValue => $_getN(9);
  @$pb.TagNumber(10)
  set floatValue($core.double v) { $_setFloat(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasFloatValue() => $_has(9);
  @$pb.TagNumber(10)
  void clearFloatValue() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get doubleValue => $_getN(10);
  @$pb.TagNumber(11)
  set doubleValue($core.double v) { $_setDouble(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasDoubleValue() => $_has(10);
  @$pb.TagNumber(11)
  void clearDoubleValue() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.List<$core.int> get stringValue => $_getN(11);
  @$pb.TagNumber(12)
  set stringValue($core.List<$core.int> v) { $_setBytes(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasStringValue() => $_has(11);
  @$pb.TagNumber(12)
  void clearStringValue() => $_clearField(12);

  @$pb.TagNumber(13)
  List_ get listValue => $_getN(12);
  @$pb.TagNumber(13)
  set listValue(List_ v) { $_setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasListValue() => $_has(12);
  @$pb.TagNumber(13)
  void clearListValue() => $_clearField(13);
  @$pb.TagNumber(13)
  List_ ensureListValue() => $_ensure(12);

  @$pb.TagNumber(14)
  Record get recordValue => $_getN(13);
  @$pb.TagNumber(14)
  set recordValue(Record v) { $_setField(14, v); }
  @$pb.TagNumber(14)
  $core.bool hasRecordValue() => $_has(13);
  @$pb.TagNumber(14)
  void clearRecordValue() => $_clearField(14);
  @$pb.TagNumber(14)
  Record ensureRecordValue() => $_ensure(13);

  @$pb.TagNumber(15)
  Node get nodeValue => $_getN(14);
  @$pb.TagNumber(15)
  set nodeValue(Node v) { $_setField(15, v); }
  @$pb.TagNumber(15)
  $core.bool hasNodeValue() => $_has(14);
  @$pb.TagNumber(15)
  void clearNodeValue() => $_clearField(15);
  @$pb.TagNumber(15)
  Node ensureNodeValue() => $_ensure(14);

  @$pb.TagNumber(16)
  Edge get edgeValue => $_getN(15);
  @$pb.TagNumber(16)
  set edgeValue(Edge v) { $_setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasEdgeValue() => $_has(15);
  @$pb.TagNumber(16)
  void clearEdgeValue() => $_clearField(16);
  @$pb.TagNumber(16)
  Edge ensureEdgeValue() => $_ensure(15);

  @$pb.TagNumber(17)
  Path get pathValue => $_getN(16);
  @$pb.TagNumber(17)
  set pathValue(Path v) { $_setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasPathValue() => $_has(16);
  @$pb.TagNumber(17)
  void clearPathValue() => $_clearField(17);
  @$pb.TagNumber(17)
  Path ensurePathValue() => $_ensure(16);

  @$pb.TagNumber(18)
  Duration get durationValue => $_getN(17);
  @$pb.TagNumber(18)
  set durationValue(Duration v) { $_setField(18, v); }
  @$pb.TagNumber(18)
  $core.bool hasDurationValue() => $_has(17);
  @$pb.TagNumber(18)
  void clearDurationValue() => $_clearField(18);
  @$pb.TagNumber(18)
  Duration ensureDurationValue() => $_ensure(17);

  @$pb.TagNumber(19)
  LocalTime get localTimeValue => $_getN(18);
  @$pb.TagNumber(19)
  set localTimeValue(LocalTime v) { $_setField(19, v); }
  @$pb.TagNumber(19)
  $core.bool hasLocalTimeValue() => $_has(18);
  @$pb.TagNumber(19)
  void clearLocalTimeValue() => $_clearField(19);
  @$pb.TagNumber(19)
  LocalTime ensureLocalTimeValue() => $_ensure(18);

  @$pb.TagNumber(20)
  ZonedTime get zonedTimeValue => $_getN(19);
  @$pb.TagNumber(20)
  set zonedTimeValue(ZonedTime v) { $_setField(20, v); }
  @$pb.TagNumber(20)
  $core.bool hasZonedTimeValue() => $_has(19);
  @$pb.TagNumber(20)
  void clearZonedTimeValue() => $_clearField(20);
  @$pb.TagNumber(20)
  ZonedTime ensureZonedTimeValue() => $_ensure(19);

  @$pb.TagNumber(21)
  Date get dateValue => $_getN(20);
  @$pb.TagNumber(21)
  set dateValue(Date v) { $_setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasDateValue() => $_has(20);
  @$pb.TagNumber(21)
  void clearDateValue() => $_clearField(21);
  @$pb.TagNumber(21)
  Date ensureDateValue() => $_ensure(20);

  @$pb.TagNumber(22)
  LocalDatetime get localDatetimeValue => $_getN(21);
  @$pb.TagNumber(22)
  set localDatetimeValue(LocalDatetime v) { $_setField(22, v); }
  @$pb.TagNumber(22)
  $core.bool hasLocalDatetimeValue() => $_has(21);
  @$pb.TagNumber(22)
  void clearLocalDatetimeValue() => $_clearField(22);
  @$pb.TagNumber(22)
  LocalDatetime ensureLocalDatetimeValue() => $_ensure(21);

  @$pb.TagNumber(23)
  ZonedDatetime get zonedDatetimeValue => $_getN(22);
  @$pb.TagNumber(23)
  set zonedDatetimeValue(ZonedDatetime v) { $_setField(23, v); }
  @$pb.TagNumber(23)
  $core.bool hasZonedDatetimeValue() => $_has(22);
  @$pb.TagNumber(23)
  void clearZonedDatetimeValue() => $_clearField(23);
  @$pb.TagNumber(23)
  ZonedDatetime ensureZonedDatetimeValue() => $_ensure(22);

  @$pb.TagNumber(24)
  Ref get refValue => $_getN(23);
  @$pb.TagNumber(24)
  set refValue(Ref v) { $_setField(24, v); }
  @$pb.TagNumber(24)
  $core.bool hasRefValue() => $_has(23);
  @$pb.TagNumber(24)
  void clearRefValue() => $_clearField(24);
  @$pb.TagNumber(24)
  Ref ensureRefValue() => $_ensure(23);

  @$pb.TagNumber(25)
  Decimal get decimalValue => $_getN(24);
  @$pb.TagNumber(25)
  set decimalValue(Decimal v) { $_setField(25, v); }
  @$pb.TagNumber(25)
  $core.bool hasDecimalValue() => $_has(24);
  @$pb.TagNumber(25)
  void clearDecimalValue() => $_clearField(25);
  @$pb.TagNumber(25)
  Decimal ensureDecimalValue() => $_ensure(24);

  @$pb.TagNumber(26)
  Vector get vectorValue => $_getN(25);
  @$pb.TagNumber(26)
  set vectorValue(Vector v) { $_setField(26, v); }
  @$pb.TagNumber(26)
  $core.bool hasVectorValue() => $_has(25);
  @$pb.TagNumber(26)
  void clearVectorValue() => $_clearField(26);
  @$pb.TagNumber(26)
  Vector ensureVectorValue() => $_ensure(25);
}

class HostAddress extends $pb.GeneratedMessage {
  factory HostAddress({
    $core.List<$core.int>? host,
    $core.int? port,
  }) {
    final $result = create();
    if (host != null) {
      $result.host = host;
    }
    if (port != null) {
      $result.port = port;
    }
    return $result;
  }
  HostAddress._() : super();
  factory HostAddress.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HostAddress.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HostAddress', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'host', $pb.PbFieldType.OY)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'port', $pb.PbFieldType.OU3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HostAddress clone() => HostAddress()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HostAddress copyWith(void Function(HostAddress) updates) => super.copyWith((message) => updates(message as HostAddress)) as HostAddress;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HostAddress create() => HostAddress._();
  HostAddress createEmptyInstance() => create();
  static $pb.PbList<HostAddress> createRepeated() => $pb.PbList<HostAddress>();
  @$core.pragma('dart2js:noInline')
  static HostAddress getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HostAddress>(create);
  static HostAddress? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get host => $_getN(0);
  @$pb.TagNumber(1)
  set host($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHost() => $_has(0);
  @$pb.TagNumber(1)
  void clearHost() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get port => $_getIZ(1);
  @$pb.TagNumber(2)
  set port($core.int v) { $_setUnsignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPort() => $_has(1);
  @$pb.TagNumber(2)
  void clearPort() => $_clearField(2);
}

class Status extends $pb.GeneratedMessage {
  factory Status({
    $core.List<$core.int>? code,
    $core.List<$core.int>? message,
  }) {
    final $result = create();
    if (code != null) {
      $result.code = code;
    }
    if (message != null) {
      $result.message = message;
    }
    return $result;
  }
  Status._() : super();
  factory Status.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Status.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Status', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'code', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'message', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Status clone() => Status()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Status copyWith(void Function(Status) updates) => super.copyWith((message) => updates(message as Status)) as Status;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Status create() => Status._();
  Status createEmptyInstance() => create();
  static $pb.PbList<Status> createRepeated() => $pb.PbList<Status>();
  @$core.pragma('dart2js:noInline')
  static Status getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Status>(create);
  static Status? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get code => $_getN(0);
  @$pb.TagNumber(1)
  set code($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearCode() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get message => $_getN(1);
  @$pb.TagNumber(2)
  set message($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class DirInfo extends $pb.GeneratedMessage {
  factory DirInfo({
    $core.List<$core.int>? installPath,
    $core.Iterable<$core.List<$core.int>>? dataPaths,
  }) {
    final $result = create();
    if (installPath != null) {
      $result.installPath = installPath;
    }
    if (dataPaths != null) {
      $result.dataPaths.addAll(dataPaths);
    }
    return $result;
  }
  DirInfo._() : super();
  factory DirInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DirInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DirInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..a<$core.List<$core.int>>(1, _omitFieldNames ? '' : 'installPath', $pb.PbFieldType.OY)
    ..p<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'dataPaths', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DirInfo clone() => DirInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DirInfo copyWith(void Function(DirInfo) updates) => super.copyWith((message) => updates(message as DirInfo)) as DirInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DirInfo create() => DirInfo._();
  DirInfo createEmptyInstance() => create();
  static $pb.PbList<DirInfo> createRepeated() => $pb.PbList<DirInfo>();
  @$core.pragma('dart2js:noInline')
  static DirInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DirInfo>(create);
  static DirInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get installPath => $_getN(0);
  @$pb.TagNumber(1)
  set installPath($core.List<$core.int> v) { $_setBytes(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInstallPath() => $_has(0);
  @$pb.TagNumber(1)
  void clearInstallPath() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbList<$core.List<$core.int>> get dataPaths => $_getList(1);
}

class ClientInfo extends $pb.GeneratedMessage {
  factory ClientInfo({
    ClientInfo_Language? lang,
    $core.List<$core.int>? protocolVersion,
    $core.List<$core.int>? version,
  }) {
    final $result = create();
    if (lang != null) {
      $result.lang = lang;
    }
    if (protocolVersion != null) {
      $result.protocolVersion = protocolVersion;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  ClientInfo._() : super();
  factory ClientInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ClientInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ClientInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'nebula.proto.common'), createEmptyInstance: create)
    ..e<ClientInfo_Language>(1, _omitFieldNames ? '' : 'lang', $pb.PbFieldType.OE, defaultOrMaker: ClientInfo_Language.UNKNOWN, valueOf: ClientInfo_Language.valueOf, enumValues: ClientInfo_Language.values)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'protocolVersion', $pb.PbFieldType.OY)
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'version', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ClientInfo clone() => ClientInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ClientInfo copyWith(void Function(ClientInfo) updates) => super.copyWith((message) => updates(message as ClientInfo)) as ClientInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ClientInfo create() => ClientInfo._();
  ClientInfo createEmptyInstance() => create();
  static $pb.PbList<ClientInfo> createRepeated() => $pb.PbList<ClientInfo>();
  @$core.pragma('dart2js:noInline')
  static ClientInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ClientInfo>(create);
  static ClientInfo? _defaultInstance;

  @$pb.TagNumber(1)
  ClientInfo_Language get lang => $_getN(0);
  @$pb.TagNumber(1)
  set lang(ClientInfo_Language v) { $_setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLang() => $_has(0);
  @$pb.TagNumber(1)
  void clearLang() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get protocolVersion => $_getN(1);
  @$pb.TagNumber(2)
  set protocolVersion($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProtocolVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearProtocolVersion() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get version => $_getN(2);
  @$pb.TagNumber(3)
  set version($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(3)
  void clearVersion() => $_clearField(3);
}

class Common {
  static final protocolVersion = $pb.Extension<$core.List<$core.int>>(_omitMessageNames ? '' : 'google.protobuf.FileOptions', _omitFieldNames ? '' : 'protocolVersion', 9559, $pb.PbFieldType.OY);
  static final supportedVersions = $pb.Extension<$core.List<$core.int>>.repeated(_omitMessageNames ? '' : 'google.protobuf.FileOptions', _omitFieldNames ? '' : 'supportedVersions', 9560, $pb.PbFieldType.PY, check: $pb.getCheckFunction($pb.PbFieldType.PY));
  static void registerAllExtensions($pb.ExtensionRegistry registry) {
    registry.add(protocolVersion);
    registry.add(supportedVersions);
  }
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
