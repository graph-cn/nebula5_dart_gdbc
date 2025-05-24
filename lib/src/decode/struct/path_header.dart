// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **PathHeader 存储在向量数据中，路径头部为 16 字节**
///
/// - **headNodeId**: 8 字节
/// - **tailNodeId**: 8 字节
/// - **size**: 4 字节
/// - **length**: 4 字节
/// - **headOffset**: 4 字节
/// - **tailOffset**: 4 字节
class PathHeader {
  /// 节点数 + 边数，uint32
  int _size = 0;

  /// 头节点索引，uint16
  int _headNodeIndex = 0;

  /// 尾节点索引，uint16
  int _tailNodeIndex = 0;

  /// 向量中头节点的偏移量，uint32
  int _headOffset = 0;

  /// 向量中尾节点的偏移量，uint32
  int _tailOffset = 0;

  PathHeader(Uint8List byteString, Endian order) {
    ByteData buffer = ByteData.view(byteString.buffer);

    // 读取 size (uint32)
    _size = buffer.getUint32(0, order);

    // 读取 headNodeIndex (uint16)
    _headNodeIndex = buffer.getUint16(4, order);

    // 读取 tailNodeIndex (uint16)
    _tailNodeIndex = buffer.getUint16(6, order);

    // 读取 headOffset (uint32)
    _headOffset = buffer.getUint32(8, order);

    // 读取 tailOffset (uint32)
    _tailOffset = buffer.getUint32(12, order);
  }

  /// 获取头节点索引
  int get headNodeIndex => _headNodeIndex;

  /// 获取尾节点索引
  int get tailNodeIndex => _tailNodeIndex;

  /// 获取大小（节点数 + 边数）
  int get size => _size;

  /// 获取头节点偏移量
  int get headOffset => _headOffset;

  /// 获取尾节点偏移量
  int get tailOffset => _tailOffset;
}
