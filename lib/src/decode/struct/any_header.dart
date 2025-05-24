// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

/*
public class AnyHeader {

    // uint32, the index of vector where the value data located, start from 1.
    // index 0 indicate the data type vector
    private long chunkIndex;

    // uint 32, the offset of the vector where the value data located.
    private long offset;


    public AnyHeader(ByteString data, ColumnType type, ByteOrder byteOrder) {
        switch (type) {
            case COLUMN_TYPE_NULL:
            case COLUMN_TYPE_BOOL:
            case COLUMN_TYPE_INT8:
            case COLUMN_TYPE_UINT8:
            case COLUMN_TYPE_INT16:
            case COLUMN_TYPE_UINT16:
            case COLUMN_TYPE_INT32:
            case COLUMN_TYPE_UINT32:
            case COLUMN_TYPE_INT64:
            case COLUMN_TYPE_UINT64:
            case COLUMN_TYPE_FLOAT32:
            case COLUMN_TYPE_FLOAT64:
            case COLUMN_TYPE_DATE:
            case COLUMN_TYPE_LOCALTIME:
            case COLUMN_TYPE_ZONEDTIME:
            case COLUMN_TYPE_LOCALDATETIME:
            case COLUMN_TYPE_ZONEDDATETIME:
            case COLUMN_TYPE_DURATION:
            case COLUMN_TYPE_DECIMAL:
                break;
            default:
                BytesReader reader = new BytesReader(data);
                this.chunkIndex = DecodeUtils.bytesToUInt32(reader.read(INT32_SIZE), byteOrder) + 1;
                this.offset = DecodeUtils.bytesToUInt32(reader.read(INT32_SIZE), byteOrder);
        }
    }

    public long getChunkIndex() {
        return chunkIndex;
    }

    public long getOffset() {
        return offset;
    }
}

*/
part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class AnyHeader {
  // uint32, the index of vector where the value data located, start from 1.
  // index 0 indicate the data type vector
  final int chunkIndex;

  // uint 32, the offset of the vector where the value data located.
  final int offset;

  AnyHeader(Uint8List data, ColumnType type, Endian byteOrder)
    : chunkIndex =
          (type == ColumnType.columnTypeNull ||
                  type == ColumnType.columnTypeBool ||
                  type == ColumnType.columnTypeInt8 ||
                  type == ColumnType.columnTypeUint8 ||
                  type == ColumnType.columnTypeInt16 ||
                  type == ColumnType.columnTypeUint16 ||
                  type == ColumnType.columnTypeInt32 ||
                  type == ColumnType.columnTypeUint32 ||
                  type == ColumnType.columnTypeInt64 ||
                  type == ColumnType.columnTypeUint64 ||
                  type == ColumnType.columnTypeFloat32 ||
                  type == ColumnType.columnTypeFloat64 ||
                  type == ColumnType.columnTypeDate ||
                  type == ColumnType.columnTypeLocalTime ||
                  type == ColumnType.columnTypeZonedTime ||
                  type == ColumnType.columnTypeLocalDateTime ||
                  type == ColumnType.columnTypeZonedDateTime ||
                  type == ColumnType.columnTypeDuration ||
                  type == ColumnType.columnTypeDecimal)
              ? 0
              : DecodeUtils.bytesToUInt32(
                    data.sublist(0, SizeConstant.int32Size),
                    byteOrder,
                  ) +
                  1,
      offset = DecodeUtils.bytesToUInt32(
        data.sublist(SizeConstant.int32Size, SizeConstant.int32Size * 2),
        byteOrder,
      );
}
