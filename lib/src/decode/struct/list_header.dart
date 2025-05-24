// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// ListHeader includes offset and list size, ListHeader is 8 Bytes.
/// list.size() is int, so here we use int but not long for offset and size.
class ListHeader {
  // uint32, the offset of vector where the first element of list is located.
  int _offset = 0;

  // uint32, the number of element in the list
  int _size = 0;

  ListHeader(Uint8List byteString, Endian byteOrder) {
    ByteData buffer = ByteData.view(byteString.buffer);
    _offset = buffer.getUint32(0, byteOrder);
    _size = buffer.getUint32(4, byteOrder);
  }

  /// The offset of vector where the first element of list is located.
  int get offset => _offset;

  /// The number of elements in the list
  int get size => _size;
}
