// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **带时区的时间类，表示带有时区信息的时间**
class NZonedTime {
  /// 小时
  final int _hour;

  /// 分钟
  final int _minute;

  /// 秒
  final int _second;

  /// 微秒
  final int _microSec;

  /// 时区偏移量
  final ZoneOffset _timeZoneOffset;

  /// **创建一个带时区的时间对象**
  ///
  /// - `hour`: 小时
  /// - `minute`: 分钟
  /// - `second`: 秒
  /// - `microSec`: 微秒
  /// - `timeZoneOffset`: 时区偏移量
  NZonedTime(
    this._hour,
    this._minute,
    this._second,
    this._microSec,
    this._timeZoneOffset,
  );

  /// **使用本地时间和时区偏移量创建一个带时区的时间对象**
  ///
  /// - `localTime`: 本地时间
  /// - `timeZoneOffset`: 时区偏移量
  NZonedTime.fromLocalTime(LocalTime localTime, ZoneOffset timeZoneOffset)
    : _hour = localTime.hour,
      _minute = localTime.minute,
      _second = localTime.second,
      _microSec = localTime.microsecond,
      _timeZoneOffset = timeZoneOffset;

  /// **获取小时**
  int get hour => _hour;

  /// **获取分钟**
  int get minute => _minute;

  /// **获取秒**
  int get second => _second;

  /// **获取微秒**
  int get microsec => _microSec;

  /// **获取时区偏移量（秒）**
  int get offset => _timeZoneOffset.totalSeconds;

  @override
  String toString() {
    return '${_hour.toString().padLeft(2, '0')}:${_minute.toString().padLeft(2, '0')}:'
        '${_second.toString().padLeft(2, '0')}.${_microSec.toString().padLeft(6, '0')}'
        '${ZoneOffsetUtil.buildOffset(offset)}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NZonedTime) return false;

    NZonedTime that = other;
    return _hour == that.hour &&
        _minute == that.minute &&
        _second == that.second &&
        _microSec == that.microsec &&
        offset == that.offset;
  }

  @override
  int get hashCode => Object.hash(_hour, _minute, _second, _microSec, offset);
}
