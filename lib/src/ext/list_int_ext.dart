part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

extension ListIntExt on List<int> {
  String toStr([String charset = 'utf-8']) {
    if (isEmpty) {
      return '';
    }
    if (charset == 'utf-8') {
      return utf8.decode(this);
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
