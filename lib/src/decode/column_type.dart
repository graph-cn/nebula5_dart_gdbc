// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class ColumnType {
  final int _type;
  const ColumnType._(this._type);

  static const columnTypeNode = ColumnType._(0x1);
  static const columnTypeEdge = ColumnType._(0x2);
  static const columnTypeNull = ColumnType._(0x3);
  static const columnTypeBool = ColumnType._(0x4);
  static const columnTypeInt8 = ColumnType._(0x5);
  static const columnTypeUint8 = ColumnType._(0x6);
  static const columnTypeInt16 = ColumnType._(0x7);
  static const columnTypeUint16 = ColumnType._(0x8);
  static const columnTypeInt32 = ColumnType._(0x9);
  static const columnTypeUint32 = ColumnType._(0xA);
  static const columnTypeInt64 = ColumnType._(0xB);
  static const columnTypeUint64 = ColumnType._(0xC);
  static const columnTypeFloat32 = ColumnType._(0xD);
  static const columnTypeFloat64 = ColumnType._(0xE);
  // not support
  // static const columnTypeBytes = ColumnType._(0xF);
  static const columnTypeString = ColumnType._(0x10);
  static const columnTypeList = ColumnType._(0x11);
  static const columnTypePath = ColumnType._(0x12);
  static const columnTypeRecord = ColumnType._(0x13);
  static const columnTypeEmbeddingVector = ColumnType._(0x14);
  static const columnTypeLocalTime = ColumnType._(0x15);
  static const columnTypeDuration = ColumnType._(0x16);
  static const columnTypeDate = ColumnType._(0x17);
  static const columnTypeLocalDateTime = ColumnType._(0x18);
  static const columnTypeZonedTime = ColumnType._(0x19);
  static const columnTypeZonedDateTime = ColumnType._(0x20);
  static const columnTypeReference = ColumnType._(0x21);
  static const columnTypeDecimal = ColumnType._(0x22);
  static const columnTypeAny = ColumnType._(0xFE);
  static const columnTypeInvalid = ColumnType._(0xFF);

  static final Map<int, ColumnType> _typeMap = {
    0x1: columnTypeNode,
    0x2: columnTypeEdge,
    0x3: columnTypeNull,
    0x4: columnTypeBool,
    0x5: columnTypeInt8,
    0x6: columnTypeUint8,
    0x7: columnTypeInt16,
    0x8: columnTypeUint16,
    0x9: columnTypeInt32,
    0xA: columnTypeUint32,
    0xB: columnTypeInt64,
    0xC: columnTypeUint64,
    0xD: columnTypeFloat32,
    0xE: columnTypeFloat64,
    // not support
    // 0xF: columnTypeBytes,
    0x10: columnTypeString,
    0x11: columnTypeList,
    0x12: columnTypePath,
    0x13: columnTypeRecord,
    0x14: columnTypeEmbeddingVector,
    0x15: columnTypeLocalTime,
    0x16: columnTypeDuration,
    0x17: columnTypeDate,
    0x18: columnTypeLocalDateTime,
    0x19: columnTypeZonedTime,
    0x20: columnTypeZonedDateTime,
    0x21: columnTypeReference,
    0x22: columnTypeDecimal,
    0xFE: columnTypeAny,
    0xFF: columnTypeInvalid,
  };

  static ColumnType getColumnType(int type) {
    ColumnType? columnType = _typeMap[type];
    if (columnType != null) {
      return columnType;
    } else {
      throw Exception("does not define the column type: $type");
    }
  }

  bool isBasic() {
    switch (_type) {
      case 0x3:
      case 0x4:
      case 0x5:
      case 0x6:
      case 0x7:
      case 0x8:
      case 0x9:
      case 0xA:
      case 0xB:
      case 0xC:
      case 0xD:
      case 0xE:
      case 0x17:
      case 0x15:
      case 0x19:
      case 0x18:
      case 0x16:
        return true;
      default:
        return false;
    }
  }

  bool isComposite() {
    switch (_type) {
      case 0x11:
      case 0x12:
      case 0x13:
      case 0x14:
      case 0x1:
      case 0x2:
        return true;
      default:
        return false;
    }
  }
}
