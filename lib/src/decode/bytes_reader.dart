// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class BytesReader {
  Uint8List data;
  int index;

  BytesReader(this.data) : index = 0;

  Uint8List read(int len) {
    Uint8List byteString = data.sublist(index, index + len);
    index += len;
    return byteString;
  }

  String readSizedString(Endian byteOrder) {
    int length = DecodeUtils.bytesToInt16(
      read(SizeConstant.elementNumberSizeForAnyValue),
      byteOrder,
    );
    int startIndex = index;
    index += length;
    Uint8List strBytes = data.sublist(startIndex, index);
    var rs = utf8.decode(strBytes);
    return rs;
  }
}
