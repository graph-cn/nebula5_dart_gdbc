// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **主机地址类，表示一个主机和端口组合**
class HostAddress {
  /// 主机名
  final String _host;

  /// 端口号
  final int _port;

  /// **创建一个主机地址**
  ///
  /// - `host`: 主机名
  /// - `port`: 端口号
  HostAddress(this._host, this._port);

  /// 获取主机名
  String get host => _host;

  /// 获取端口号
  int get port => _port;

  @override
  int get hashCode => _host.hashCode + _port;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is HostAddress) {
      return _host == other._host && _port == other._port;
    }
    return false;
  }

  @override
  String toString() => '$_host:$_port';
}
