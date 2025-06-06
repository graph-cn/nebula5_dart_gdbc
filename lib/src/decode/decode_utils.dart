// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class DecodeUtils {
  /// Decode binary to byte
  /// @param data binary data
  /// @return int value
  static int bytesToInt8(Uint8List data) {
    return data[0];
  }

  /// Decode binary to unsigned byte
  /// @param data binary data
  /// @return uint value
  static int bytesToUInt8(Uint8List data) {
    return data[0] & 0xFF;
  }

  /// Decode binary to short
  /// @param data binary data
  /// @return short value
  static int bytesToInt16(Uint8List data, Endian order) {
    return ByteData.sublistView(data).getInt16(0, order);
  }

  /// Decode binary to unsigned short
  /// @param data binary data
  /// @return short value
  static int bytesToUInt16(Uint8List data, Endian order) {
    return bytesToInt16(data, order) & 0xFFFF;
  }

  /// Decode binary to int
  /// @param data binary data
  /// @return int value
  static int bytesToInt32(Uint8List data, Endian order) {
    return ByteData.sublistView(data).getInt32(0, order);
  }

  /// Decode binary to unsigned int
  /// @param data binary data
  /// @return int value
  static int bytesToUInt32(Uint8List data, Endian order) {
    return bytesToInt32(data, order) & 0xFFFFFFFF;
  }

  /// Decode binary to long
  /// @param data binary data
  /// @return long value
  static int bytesToInt64(Uint8List data, Endian order) {
    return ByteData.sublistView(data).getInt64(0, order);
  }

  /// Decode binary to float
  /// @param data binary data
  /// @return float value
  static double bytesToFloat(Uint8List data, Endian order) {
    return ByteData.sublistView(data).getFloat32(0, order);
  }

  /// Decode binary to double
  /// @param data binary data
  /// @return double value
  static double bytesToDouble(Uint8List data, Endian order) {
    return ByteData.sublistView(data).getFloat64(0, order);
  }

  /// Decode binary to bool
  /// @param data binary data
  /// @return Boolean value
  static bool bytesToBool(Uint8List data) {
    return data[0] == 0x01;
  }

  /// Decode binary to String with specific size. Used for Any vector.
  /// In Any vector, the string binary includes: 2 bytes size for the string + string binary
  /// @param data binary data
  /// @param startPos start position for the string
  /// @return String value
  static String bytesToSizedString(
    Uint8List data,
    int startPos,
    Endian byteOrder,
  ) {
    int length = bytesToInt16(
      data.sublist(
        startPos,
        startPos + SizeConstant.elementNumberSizeForAnyValue,
      ),
      byteOrder,
    );
    startPos += SizeConstant.elementNumberSizeForAnyValue;
    Uint8List strBytes = data.sublist(startPos, startPos + length);
    return strBytes.utf8String();
  }

  /// Get the type of vector
  /// @param vector NestedVector
  /// @return {@link  VectorType}
  static VectorType getVectorType(ng.NestedVector vector) {
    int type = vector.commonMetaData.vectorContentType;
    return VectorType.getVectorType(type & 0xFF);
  }

  /// If all vector data is not null.
  /// @param vector NestedVector
  /// @return true if no data is null.
  static bool isNullBitMapAllSet(ng.NestedVector vector) {
    int type = vector.commonMetaData.vectorContentType;
    return (type & (1 << 8)) != 0;
  }
}
