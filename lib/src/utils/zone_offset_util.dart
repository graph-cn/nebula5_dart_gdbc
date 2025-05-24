// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **时区偏移量工具类**
class ZoneOffsetUtil {
  /// 每分钟的秒数
  static const int SECONDS_PER_MINUTE = 60;

  /// 每小时的分钟数
  static const int MINUTES_PER_HOUR = 60;

  /// 每小时的秒数
  static const int SECONDS_PER_HOUR = SECONDS_PER_MINUTE * MINUTES_PER_HOUR;

  /// **将时区偏移量秒数构建为字符串偏移量**
  ///
  /// - `offsetSeconds`: 偏移量秒数
  /// - 返回: 偏移量字符串，例如 +08:00
  static String buildOffset(int offsetSeconds) {
    if (offsetSeconds == 0) {
      return "Z";
    } else {
      int absOffsetSeconds = offsetSeconds.abs();
      StringBuffer buf = StringBuffer();
      int absHours = absOffsetSeconds ~/ SECONDS_PER_HOUR;
      int absMinutes =
          (absOffsetSeconds ~/ SECONDS_PER_MINUTE) % MINUTES_PER_HOUR;

      buf
        ..write(offsetSeconds < 0 ? "-" : "+")
        ..write(absHours < 10 ? "0" : "")
        ..write(absHours)
        ..write(absMinutes < 10 ? ":0" : ":")
        ..write(absMinutes);

      int absSeconds = absOffsetSeconds % SECONDS_PER_MINUTE;
      if (absSeconds != 0) {
        buf
          ..write(absSeconds < 10 ? ":0" : ":")
          ..write(absSeconds);
      }

      return buf.toString();
    }
  }
}
