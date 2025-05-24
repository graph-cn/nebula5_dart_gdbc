// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// **包装各种数据类型的包装器类**
class ValueWrapper {
  /// 包装的值
  final dynamic _value;

  /// 值的数据类型
  final ColumnType _type;

  /// 带时区的日期时间格式化器
  static const String zonedDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSSXXXXX";

  /// 本地日期时间格式化器
  static const String localDateTimeFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSSSS";

  /// 带时区的时间格式化器
  static const String zonedTimeFormat = "HH:mm:ss.SSSSSSXXXXX";

  /// 本地时间格式化器
  static const String localTimeFormat = "HH:mm:ss.SSSSSS";

  /// **创建一个值包装器**
  ///
  /// - `value`: 要包装的值
  /// - `type`: 值的类型
  ValueWrapper(this._value, this._type);

  /// **获取数据类型**
  ColumnType get dataType => _type;

  /// **获取数据类型的字符串表示**
  String get dataTypeString {
    switch (_type) {
      case ColumnType.columnTypeBool:
        return "BOOLEAN";
      case ColumnType.columnTypeUint8:
        return "UINT8";
      case ColumnType.columnTypeInt8:
        return "INT8";
      case ColumnType.columnTypeUint16:
        return "UINT16";
      case ColumnType.columnTypeInt16:
        return "INT16";
      case ColumnType.columnTypeUint32:
        return "UINT32";
      case ColumnType.columnTypeInt32:
        return "INT32";
      case ColumnType.columnTypeUint64:
        return "UINT64";
      case ColumnType.columnTypeInt64:
        return "INT64";
      case ColumnType.columnTypeFloat32:
        return "FLOAT";
      case ColumnType.columnTypeFloat64:
        return "DOUBLE";
      case ColumnType.columnTypeString:
        return "STRING";
      case ColumnType.columnTypeNode:
        return "NODE";
      case ColumnType.columnTypeEdge:
        return "EDGE";
      case ColumnType.columnTypeList:
        return "LIST";
      case ColumnType.columnTypeEmbeddingVector:
        return "VECTOR";
      case ColumnType.columnTypeDuration:
        return "DURATION";
      case ColumnType.columnTypeLocalTime:
        return "LOCAL_TIME";
      case ColumnType.columnTypeLocalDateTime:
        return "LOCAL_DATETIME";
      case ColumnType.columnTypeZonedTime:
        return "ZONED_TIME";
      case ColumnType.columnTypeZonedDateTime:
        return "ZONED_DATETIME";
      case ColumnType.columnTypeDate:
        return "DATE";
      case ColumnType.columnTypeRecord:
        return "RECORD";
      case ColumnType.columnTypePath:
        return "PATH";
      case ColumnType.columnTypeDecimal:
        return "DECIMAL";
      case ColumnType.columnTypeAny:
        return "ANY";
      default:
        throw ArgumentError("未知的数据类型: $_type");
    }
  }

  /// **获取包装的值**
  dynamic get value => _value;

  /// **检查值是否为 null**
  bool get isNull => _value == null;

  /// **检查值是否为布尔类型**
  bool get isBoolean => _type == ColumnType.columnTypeBool;

  /// **检查值是否为长整数类型**
  bool get isLong =>
      _type == ColumnType.columnTypeUint64 ||
      _type == ColumnType.columnTypeInt64;

  /// **检查值是否为整数类型**
  bool get isInt =>
      _type == ColumnType.columnTypeUint8 ||
      _type == ColumnType.columnTypeInt8 ||
      _type == ColumnType.columnTypeUint16 ||
      _type == ColumnType.columnTypeInt16 ||
      _type == ColumnType.columnTypeUint32 ||
      _type == ColumnType.columnTypeInt32;

  /// **检查值是否为浮点型**
  bool get isFloat => _type == ColumnType.columnTypeFloat32;

  /// **检查值是否为双精度浮点型**
  bool get isDouble => _type == ColumnType.columnTypeFloat64;

  /// **检查值是否为字符串类型**
  bool get isString => _type == ColumnType.columnTypeString;

  /// **检查值是否为列表类型**
  bool get isList => _type == ColumnType.columnTypeList;

  /// **检查值是否为向量类型**
  bool get isVector => _type == ColumnType.columnTypeEmbeddingVector;

  /// **检查值是否为节点类型**
  bool get isNode => _type == ColumnType.columnTypeNode;

  /// **检查值是否为边类型**
  bool get isEdge => _type == ColumnType.columnTypeEdge;

  /// **检查值是否为本地时间类型**
  bool get isLocalTime => _type == ColumnType.columnTypeLocalTime;

  /// **检查值是否为带时区的时间类型**
  bool get isZonedTime => _type == ColumnType.columnTypeZonedTime;

  /// **检查值是否为本地日期时间类型**
  bool get isLocalDateTime => _type == ColumnType.columnTypeLocalDateTime;

  /// **检查值是否为带时区的日期时间类型**
  bool get isZonedDateTime => _type == ColumnType.columnTypeZonedDateTime;

  /// **检查值是否为日期类型**
  bool get isDate => _type == ColumnType.columnTypeDate;

  /// **检查值是否为记录类型**
  bool get isRecord => _type == ColumnType.columnTypeRecord;

  /// **检查值是否为持续时间类型**
  bool get isDuration => _type == ColumnType.columnTypeDuration;

  /// **检查值是否为路径类型**
  bool get isPath => _type == ColumnType.columnTypePath;

  /// **检查值是否为十进制类型**
  bool get isDecimal => _type == ColumnType.columnTypeDecimal;

  /// **将值转换为布尔类型**
  bool get asBoolean {
    if (_type == ColumnType.columnTypeBool) {
      return _value as bool;
    }
    throw ArgumentError(
      "Cannot get field `boolean` because value's type is $dataType",
    );
  }

  /// **将值转换为整数类型**
  int get asInt {
    if (_type == ColumnType.columnTypeInt8 ||
        _type == ColumnType.columnTypeUint8 ||
        _type == ColumnType.columnTypeUint16 ||
        _type == ColumnType.columnTypeInt16 ||
        _type == ColumnType.columnTypeUint32 ||
        _type == ColumnType.columnTypeInt32) {
      return int.parse(_value.toString());
    }
    throw ArgumentError(
      "Cannot get field `int` because value's type is $dataType",
    );
  }

  /// **将值转换为长整数类型**
  int get asLong {
    if (_type == ColumnType.columnTypeInt64 ||
        _type == ColumnType.columnTypeUint64) {
      return _value as int;
    }
    throw ArgumentError(
      "Cannot get field `long` because value's type is $dataType",
    );
  }

  /// **将值转换为字符串类型**
  String get asString {
    if (_type == ColumnType.columnTypeString) {
      return _value as String;
    }
    throw ArgumentError(
      "Cannot get field `string` because value's type is $dataType",
    );
  }

  /// **将值转换为浮点类型**
  double get asFloat {
    if (_type == ColumnType.columnTypeFloat32) {
      return _value as double;
    }
    throw ArgumentError(
      "Cannot get field `float` because value's type is $dataType",
    );
  }

  /// **将值转换为双精度浮点类型**
  double get asDouble {
    if (_type == ColumnType.columnTypeFloat64) {
      return _value as double;
    }
    throw ArgumentError(
      "Cannot get field `double` because value's type is $dataType",
    );
  }

  /// **将值转换为列表类型**
  List<ValueWrapper> get asList {
    if (_type == ColumnType.columnTypeList) {
      return _value as List<ValueWrapper>;
    }
    throw ArgumentError(
      "Cannot get field `list` because value's type is $dataType",
    );
  }

  /// **将值转换为节点类型**
  Node get asNode {
    if (_type == ColumnType.columnTypeNode) {
      return _value as Node;
    }
    throw ArgumentError(
      "cannot get field `node` because value's type is $dataType",
    );
  }

  /// **将值转换为边类型**
  Edge get asEdge {
    if (_type == ColumnType.columnTypeEdge) {
      return _value as Edge;
    }
    throw ArgumentError(
      "cannot get field `edge` because value's type is $dataType",
    );
  }

  /// **将值转换为本地时间类型**
  NTime get asLocalTime {
    if (_type == ColumnType.columnTypeLocalTime) {
      return _value as NTime;
    }
    throw ArgumentError(
      "cannot get field `localtime` because value's type is $dataType",
    );
  }

  /// **将值转换为带时区的时间类型**
  NZonedTime get asZonedTime {
    if (_type == ColumnType.columnTypeZonedTime) {
      return _value as NZonedTime;
    }
    throw ArgumentError(
      "cannot get field `zonedtime` because value's type is $dataType",
    );
  }

  /// **将值转换为日期类型**
  NDate get asDate {
    if (_type == ColumnType.columnTypeDate) {
      return _value as NDate;
    }
    throw ArgumentError(
      "cannot get field `date` because value's type is $dataType",
    );
  }

  /// **将值转换为本地日期时间类型**
  NDateTime get asLocalDateTime {
    if (_type == ColumnType.columnTypeLocalDateTime) {
      return _value as NDateTime;
    }
    throw ArgumentError(
      "cannot get field `localdatetime` because value's type is $dataType",
    );
  }

  /// **将值转换为带时区的日期时间类型**
  NZonedDateTime get asZonedDateTime {
    if (_type == ColumnType.columnTypeZonedDateTime) {
      return _value as NZonedDateTime;
    }
    throw ArgumentError(
      "cannot get field `zoneddatetime` because value's type is $dataType",
    );
  }

  /// **将值转换为持续时间类型**
  NDuration get asDuration {
    if (_type == ColumnType.columnTypeDuration) {
      return _value as NDuration;
    }
    throw ArgumentError(
      "cannot get field `duration` because value's type is $dataType",
    );
  }

  /// **将值转换为记录类型**
  NRecord get asRecord {
    if (_type == ColumnType.columnTypeRecord) {
      return _value as NRecord;
    }
    throw ArgumentError(
      "cannot get field `record` because value's type is $dataType",
    );
  }

  /// **将值转换为路径类型**
  Path get asPath {
    if (_type == ColumnType.columnTypePath) {
      return _value as Path;
    }
    throw ArgumentError(
      "cannot get field `path` because value's type is $dataType",
    );
  }

  /// **将值转换为十进制类型**
  Decimal get asDecimal {
    if (_type == ColumnType.columnTypeDecimal) {
      return _value as Decimal;
    }
    throw ArgumentError(
      "cannot get field `decimal` because value's type is $dataType",
    );
  }

  /// **将值转换为向量类型**
  EmbeddingVector get asVector {
    if (_type == ColumnType.columnTypeEmbeddingVector) {
      return _value as EmbeddingVector;
    }
    throw ArgumentError(
      "cannot get field `vector` because value's type is $dataType",
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ValueWrapper) return false;

    return _value == other._value;
  }

  @override
  int get hashCode => _value.hashCode;

  @override
  String toString() {
    if (isNull) {
      return 'null';
    } else if (isBoolean) {
      return asBoolean.toString();
    } else if (isInt) {
      return asInt.toString();
    } else if (isLong) {
      return asLong.toString();
    } else if (isFloat) {
      return asFloat.toString();
    } else if (isDouble) {
      return asDouble.toString();
    } else if (isString) {
      return asString;
    } else if (isList) {
      return asList.toString();
    } else if (isRecord) {
      return asRecord.toString();
    } else if (isNode) {
      return asNode.toString();
    } else if (isEdge) {
      return asEdge.toString();
    } else if (isLocalTime) {
      return asLocalTime.toString();
    } else if (isZonedTime) {
      return asZonedTime.toString();
    } else if (isLocalDateTime) {
      return asLocalDateTime.toString();
    } else if (isZonedDateTime) {
      return asZonedDateTime.toString();
    } else if (isDate) {
      return asDate.toString();
    } else if (isDuration) {
      return asDuration.toString();
    } else if (isPath) {
      return asPath.toString();
    } else if (isDecimal) {
      return asDecimal.toString();
    } else if (isVector) {
      return asVector.toString();
    }
    return "Unknown type: $dataType";
  }
}
