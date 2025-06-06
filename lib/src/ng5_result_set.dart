// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class Ng5ResultSet extends ResultSet {
  @override
  final List<ValueMetaData> metas = [];

  @override
  final List<List<dynamic>> rows = [];

  @override
  set code(dynamic value) {
    super.code = value;
    success = value == '00000';
  }

  @override
  String toString() {
    return '$runtimeType{\n\tsuccess: $success,\n\tmetas: ${metas.map((e) => e.toJson()).toList()},\n\tcolumns: $columns,\n\trows: $rows\n,\n\tcode: $code,\n\tmessage: $message\n}';
  }
}
