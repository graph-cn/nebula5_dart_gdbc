// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class EdgeHeader {
  // Constants needed for byte size calculations
  static const int NODE_ID_SIZE = 8;
  static const int RANK_SIZE = 8;
  static const int GRAPH_ID_SIZE = 4;
  static const int EDGE_TYPE_ID_SIZE = 4;

  final Endian byteOrder;

  // int32, edge type id
  int _edgeTypeId = 0;
  // int32, graph id
  int _graphId = 0;

  // int64, rank
  int _rank = 0;

  // int64, dst node id
  int _dstId = 0;
  // int64, src node id
  int _srcId = 0;

  EdgeHeader(Uint8List byteString, this.byteOrder) {
    ByteData buffer = ByteData.view(byteString.buffer);

    // Read src id (int64)
    _srcId = buffer.getInt64(0, byteOrder);

    // Read dst id (int64)
    _dstId = _bytesToInt64(byteString, 8, NODE_ID_SIZE);

    // Read rank (int64)
    _rank = _bytesToInt64(byteString, 16, RANK_SIZE);

    // Read graph id (int32)
    _graphId = _bytesToInt32(byteString, 24, GRAPH_ID_SIZE);

    // Read edge type id (int32)
    _edgeTypeId = _bytesToInt32(byteString, 28, EDGE_TYPE_ID_SIZE);
  }

  int _bytesToInt64(Uint8List bytes, int offset, int size) {
    ByteData buffer = ByteData(size);
    for (int i = 0; i < size; i++) {
      buffer.setUint8(i, bytes[offset + i]);
    }
    return buffer.getInt64(0, byteOrder);
  }

  int _bytesToInt32(Uint8List bytes, int offset, int size) {
    ByteData buffer = ByteData(size);
    for (int i = 0; i < size; i++) {
      buffer.setInt8(i, bytes[offset + i]);
    }
    return buffer.getInt32(0, byteOrder);
  }

  int get edgeTypeId => _edgeTypeId;

  int get graphId => _graphId;

  int get rank => _rank;

  int get dstId => _dstId;

  int get srcId => _srcId;
}
