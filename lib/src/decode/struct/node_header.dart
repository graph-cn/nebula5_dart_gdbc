// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

/// NodeHeader includes nodeId, graphId， NodeHeader is 16 bytes.
/// The nodeTypeId is not stored in the header, but exists in nodeId.
/// NodeId = NodeTypeId + BucketId + NodeSeqId, the first 16 bytes of nodeId is node type id.
class NodeHeader {
  // Constants needed for byte size calculations
  static const int NODE_ID_SIZE = 8;
  static const int GRAPH_ID_SIZE = 4;

  final Endian byteOrder;

  // int64, node id
  int _nodeId = 0;
  // int32, graph id
  int _graphId = 0;
  // int16, node type id
  int _nodeTypeId = 0;

  NodeHeader(Uint8List byteString, this.byteOrder) {
    ByteData buffer = ByteData.view(byteString.buffer);

    // Read node id (int64)
    _nodeId = buffer.getInt64(0, byteOrder);

    // Extract node type id from node id
    _nodeTypeId = (_nodeId >> 48).toInt();

    // Read graph id (int32)
    _graphId = _bytesToInt32(byteString, NODE_ID_SIZE, GRAPH_ID_SIZE);
  }

  int _bytesToInt32(Uint8List bytes, int offset, int size) {
    ByteData buffer = ByteData(size);
    for (int i = 0; i < size; i++) {
      buffer.setUint8(i, bytes[offset + i]);
    }
    return buffer.getInt32(0, byteOrder);
  }

  int get nodeId => _nodeId;

  int get graphId => _graphId;

  int get nodeTypeId => _nodeTypeId;
}
