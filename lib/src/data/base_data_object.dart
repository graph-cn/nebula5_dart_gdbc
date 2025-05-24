// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **基础数据对象抽象类**
abstract class BaseDataObject {
  /// 解码类型，默认为 utf-8
  String _decodeType = "utf-8";

  /// 获取解码类型
  String get decodeType => _decodeType;

  /// 设置解码类型
  ///
  /// - `decodeType`: 解码类型
  /// - 返回: 当前对象，用于链式调用
  BaseDataObject setDecodeType(String decodeType) {
    _decodeType = decodeType;
    return this;
  }
}
