// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

extension ListIntExt on List<int> {
  String utf8String() {
    return utf8.decode(Uint8List.fromList(this), allowMalformed: true);
  }

  String toStr([String charset = 'utf-8']) {
    if (isEmpty) {
      return '';
    }
    if (charset == 'utf-8') {
      return utf8String();
      // } else if (charset == 'gbk') {
      //   return gbk.decode(this);
      // } else if (charset == 'gb18030') {
      //   return gb18030.decode(this);
    } else if (charset == 'iso-8859-1') {
      return latin1.decode(this);
    } else {
      throw Exception('Unsupported charset: $charset');
    }
  }
}
