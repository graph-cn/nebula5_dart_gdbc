// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **日期类，表示一个日期值**
class NDate {
  /// 内部日期对象
  final DateTime _date;

  /// **创建一个日期对象**
  ///
  /// - `date`: 日期对象
  NDate(this._date);

  /// 获取年份
  int get year => _date.year;

  /// 获取月份
  int get month => _date.month;

  /// 获取日
  int get day => _date.day;

  @override
  String toString() {
    return '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NDate) return false;

    NDate that = other;
    return year == that.year && month == that.month && day == that.day;
  }

  @override
  int get hashCode => Object.hash(_date.year, _date.month, _date.day);
}
