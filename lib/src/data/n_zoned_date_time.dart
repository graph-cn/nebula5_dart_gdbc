// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **带时区的日期时间类，表示带有时区信息的日期时间**
class NZonedDateTime {
  /// 本地日期时间
  final LocalDateTime _localDateTime;

  /// 时区偏移量
  final ZoneOffset _zoneOffset;

  /// **创建一个带时区的日期时间对象**
  ///
  /// - `localDateTime`: 本地日期时间
  /// - `zoneOffset`: 时区偏移量
  NZonedDateTime(this._localDateTime, this._zoneOffset);

  /// **获取 UTC 日期时间年份**
  int get year => _localDateTime.year;

  /// **获取 UTC 日期时间月份**
  int get month => _localDateTime.month;

  /// **获取日期时间天**
  int get day => _localDateTime.day;

  /// **获取日期时间小时**
  int get hour => _localDateTime.hour;

  /// **获取日期时间分钟**
  int get minute => _localDateTime.minute;

  /// **获取 UTC 日期时间秒**
  int get second => _localDateTime.second;

  /// **获取 UTC 日期时间微秒**
  int get microsec => _localDateTime.microsecond;

  /// **获取时区偏移量（秒）**
  int get offset => _zoneOffset.totalSeconds;

  @override
  String toString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}'
        'T${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}'
        ':${second.toString().padLeft(2, '0')}.${microsec.toString().padLeft(6, '0')}'
        '${ZoneOffsetUtil.buildOffset(offset)}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NZonedDateTime) return false;

    NZonedDateTime that = other;
    return year == that.year &&
        month == that.month &&
        day == that.day &&
        hour == that.hour &&
        minute == that.minute &&
        second == that.second &&
        microsec == that.microsec &&
        offset == that.offset;
  }

  @override
  int get hashCode => Object.hash(_localDateTime, offset);
}
