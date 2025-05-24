// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **时间类，表示一个不带日期的时间值**
class NTime {
  /// 本地时间
  final LocalTime _localTime;

  /// **创建一个时间对象**
  ///
  /// - `localTime`: 本地时间
  NTime(this._localTime);

  /// **获取 UTC 时间小时**
  int get hour => _localTime.hour;

  /// **获取 UTC 时间分钟**
  int get minute => _localTime.minute;

  /// **获取 UTC 时间秒**
  int get second => _localTime.second;

  /// **获取 UTC 时间微秒**
  int get microsec => _localTime.microsecond;

  @override
  String toString() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:'
        '${second.toString().padLeft(2, '0')}.${microsec.toString().padLeft(6, '0')}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NTime) return false;

    NTime that = other;
    return hour == that.hour &&
        minute == that.minute && // Fixed bug from Java implementation
        second == that.second &&
        microsec == that.microsec;
  }

  @override
  int get hashCode => _localTime.hashCode;
}
