// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **记录类，表示一个键值对记录集合**
class NRecord {
  /// 记录类型
  // ignore: unused_field
  final ColumnType _type = ColumnType.columnTypeRecord;

  /// 记录的属性映射
  final Map<String, ValueWrapper> _map = {};

  /// **创建一个记录对象**
  ///
  /// - `map`: 属性映射
  NRecord(Map<String, ValueWrapper> map) {
    _map.addAll(map);
  }

  /// **检查是否包含指定键**
  ///
  /// - `key`: 属性名称
  /// - 返回: 如果包含则为 true
  /// - 抛出: 如果键为 null，则抛出 ArgumentError
  bool containsKey(String key) {
    if (key == null) {
      throw ArgumentError("null map key");
    }
    return _map.containsKey(key);
  }

  /// **获取指定键的属性值**
  ///
  /// - `key`: 属性名称
  /// - 返回: 属性值，如果不存在则返回 null
  ValueWrapper? getValue(String key) {
    if (!containsKey(key)) {
      return null;
    }
    return _map[key];
  }

  /// **检查记录是否为空**
  ///
  /// - 返回: 如果记录没有键值映射则为 true
  bool get isEmpty => _map.isEmpty;

  /// **获取记录中键值映射的数量**
  ///
  /// - 返回: 记录中键值映射的数量
  int get size => _map.length;

  /// **获取记录的所有属性**
  ///
  /// - 返回: 属性名称 -> 属性值的映射
  Map<String, ValueWrapper> get valuesMap => _map;

  /// **获取属性名称列表**
  ///
  /// - 返回: 属性名称列表
  List<String> get keys => _map.keys.toList();

  /// **获取属性值列表**
  ///
  /// - 返回: 属性值列表
  List<ValueWrapper> get values => _map.values.toList();

  /// **获取指定键的属性值**
  ///
  /// - `key`: 属性名称
  /// - 返回: 属性值，如果不存在则返回 null
  ValueWrapper? operator [](String key) => getValue(key);

  @override
  String toString() => _map.toString();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! NRecord) return false;

    return _map == other.valuesMap;
  }

  @override
  int get hashCode => _map.hashCode;
}
