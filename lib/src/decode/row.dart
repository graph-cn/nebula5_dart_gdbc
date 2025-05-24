// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **包含一行记录中多个值的行数据**
class Row {
  /// 行中的值列表
  final List<ValueWrapper> _values = [];

  /// **默认构造函数**
  Row();

  /// **从值列表创建行**
  ///
  /// - `values`: 值封装器列表
  Row.fromValues(List<ValueWrapper>? values) {
    if (values != null) {
      _values.addAll(values);
    }
  }

  /// **向行中添加一个值**
  ///
  /// - `value`: 行中的一个值
  void addValue(ValueWrapper value) {
    _values.add(value);
  }

  /// **获取此行的所有值**
  ///
  /// - 返回: ValueWrapper 对象列表
  List<ValueWrapper> get values => _values;
}
