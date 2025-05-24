// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class VectorType {
  // ignore: unused_field
  final int _type;
  const VectorType._(this._type);

  static const VectorType invalidVector = VectorType._(0);
  static const VectorType flatVector = VectorType._(1);
  static const VectorType constVector = VectorType._(2);
  static const VectorType parallelVector = VectorType._(3);

  static VectorType getVectorType(int type) {
    switch (type) {
      case 0:
        return invalidVector;
      case 1:
        return constVector;
      case 2:
        return flatVector;
      case 3:
        return parallelVector;
      default:
        throw ArgumentError('Invalid vector type: $type');
    }
  }
}
