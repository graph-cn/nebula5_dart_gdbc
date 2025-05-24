// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **持续时间类，表示一个时间段**
class NDuration {
  /// 是否基于月份的持续时间类型
  final bool _isMonthBased;

  /// 年
  final int _year;

  /// 月
  final int _month;

  /// 天
  final int _day;

  /// 小时
  final int _hour;

  /// 分钟
  final int _minute;

  /// 秒
  final int _second;

  /// 微秒
  final int _microSec;

  /// **创建一个持续时间对象**
  ///
  /// - `isMonthBased`: 是否基于月份的持续时间
  /// - `year`: 年
  /// - `month`: 月
  /// - `day`: 天
  /// - `hour`: 小时
  /// - `minute`: 分钟
  /// - `second`: 秒
  /// - `microSec`: 微秒
  NDuration(
    this._isMonthBased,
    this._year,
    this._month,
    this._day,
    this._hour,
    this._minute,
    this._second,
    this._microSec,
  );

  /// **是否基于月份的持续时间类型**
  bool get isMonthBased => _isMonthBased;

  /// **获取年份**
  int get year => _year;

  /// **获取月份**
  int get month => _month;

  /// **获取天数**
  int get day => _day;

  /// **获取小时**
  int get hour => _hour;

  /// **获取分钟**
  int get minute => _minute;

  /// **获取秒数**
  int get second => _second;

  /// **获取微秒数**
  int get microsecond => _microSec;

  @override
  String toString() {
    StringBuffer durationStr = StringBuffer('P');
    if (isMonthBased) {
      if (year != 0) {
        durationStr.write(
          '$year'
          'Y',
        );
      }
      if (month != 0 || year == 0) {
        durationStr.write(
          '$month'
          'M',
        );
      }
    } else {
      if (day != 0) {
        durationStr.write(
          '$day'
          'D',
        );
      }
      if (day == 0 ||
          hour != 0 ||
          minute != 0 ||
          second != 0 ||
          microsecond != 0) {
        durationStr.write('T');
      }
      if (hour != 0) {
        durationStr.write(
          '$hour'
          'H',
        );
      }
      if (minute != 0) {
        durationStr.write(
          '$minute'
          'M',
        );
      }
      if (second != 0 ||
          microsecond != 0 ||
          (day == 0 && hour == 0 && minute == 0 && second == 0)) {
        if (microsecond == 0) {
          durationStr.write(
            '$second'
            'S',
          );
        } else {
          int totalMicroseconds = second * 1000000 + microsecond;
          bool isMinus = totalMicroseconds < 0;
          if (isMinus) {
            totalMicroseconds = -totalMicroseconds;
          }
          int seconds = totalMicroseconds ~/ 1000000;
          int microSec = totalMicroseconds % 1000000;
          String secValue;
          if (isMinus) {
            secValue = '-$seconds.${microSec.toString().padLeft(6, '0')}';
          } else {
            secValue = '$seconds.${microSec.toString().padLeft(6, '0')}';
          }
          // 删除尾部的0
          while (secValue.endsWith('0')) {
            secValue = secValue.substring(0, secValue.length - 1);
          }
          durationStr.write(secValue + 'S');
        }
      }
    }
    return durationStr.toString();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NDuration) return false;

    NDuration that = other;
    return isMonthBased == that.isMonthBased &&
        year == that.year &&
        month == that.month &&
        day == that.day &&
        hour == that.hour &&
        minute == that.minute &&
        second == that.second &&
        microsecond == that.microsecond;
  }

  @override
  int get hashCode => Object.hash(
    _isMonthBased,
    _year,
    _month,
    _day,
    _hour,
    _minute,
    _second,
    _microSec,
  );
}
