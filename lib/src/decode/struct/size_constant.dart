// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.
//
// Translated from [nebula-driver](https://central.sonatype.com/artifact/com.vesoft/driver)

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class SizeConstant {
  /*
  
    public static final int VALUE_TYPE_SIZE                              = 1;
    // Byte size for different data type
    public static final int INT8_SIZE                                    = 1;
    public static final int INT16_SIZE                                   = 2;
    public static final int INT32_SIZE                                   = 4;
    public static final int INT64_SIZE                                   = 8;
    public static final int FLOAT_SIZE                                   = 4;
    public static final int DOUBLE_SIZE                                  = 8;
    public static final int BOOL_SIZE                                    = 1;
    // string size: 4 byte string value length + 4 byte prefix string
    // + 4 byte chunk offset + 4 byte chunk index
    public static final int STRING_SIZE                                  = 16;
    public static final int CHUNK_INDEX_LENGTH_IN_STRING_HEADER          = 4;
    public static final int CHUNK_INDEX_START_POSITION_IN_STRING_HEADER  = 12;
    public static final int CHUNK_OFFSET_LENGTH_IN_STRING_HEADER         = 4;
    public static final int CHUNK_OFFSET_START_POSITION_IN_STRING_HEADER = 8;
    public static final int STRING_VALUE_LENGTH_SIZE                     = 4;
    public static final int STRING_MAX_VALUE_LENGTH_IN_HEADER            = 12;

    public static final int YEAR_SIZE     = 2;
    public static final int MONTH_SIZE    = 1;
    public static final int DAY_SIZE      = 1;
    public static final int HOUR_SIZE     = 1;
    public static final int MINUTE_SIZE   = 1;
    public static final int SECOND_SIZE   = 1;
    public static final int MICROSEC_SIZE = 4;

    public static final int DATE_SIZE            = YEAR_SIZE + MONTH_SIZE + DAY_SIZE;
    public static final int DATE_TIME_SIZE       = 8;
    public static final int ZONED_DATE_TIME_SIZE = 8;
    public static final int LOCAL_TIME_SIZE      = 8;

    public static final int ZONED_TIME_SIZE = 8;

    public static final int DURATION_SIZE = 8;


    // list
    // list header size
    public static final int LIST_HEADER_SIZE = 8;
    // list size size
    public static final int LIST_SIZE_SIZE   = 4;

    public static final int RECORD_HEADER_SIZE = 8;
    public static final int ANY_HEADER_SIZE    = 8;

    // Byte size for the element
    public static final int GRAPH_ID_SIZE     = 4;
    public static final int NODE_TYPE_ID_SIZE = 2;
    public static final int EDGE_TYPE_ID_SIZE = 4;
    public static final int NODE_ID_SIZE      = 8;


    public static final int RANK_SIZE = 8;


    // node or edge type num size
    public static final int GRAPH_ELEMENT_TYPE_NUM_SIZE = 4;
    public static final int PROPERTY_NUM_SIZE           = 4;

    // path
    // element num size for path
    public static final int PATH_ELEMENT_NUM_SIZE               = 4;
    // size for value for nodeTypes or edgeTypes for path: map<NodeTypeId, uint16_t> in server
    public static final int PATH_META_DATA_NODE_EDGE_TYPE_INDEX = 2;
    public static final int PATH_HEADER_SIZE_SIZE               = 4;
    public static final int PATH_HEADER_LENGTH_SIZE             = 4;
    public static final int PATH_HEADER_HEAD_OFFSET_SIZE        = 4;
    public static final int PATH_HEADER_TAIL_OFFSET_SIZE        = 4;


    // filed num size for record
    public static final int RECORD_FIELD_NUM_SIZE = 4;

    // size for vector
    public static final int VECTOR_NODE_HEADER_SIZE = 16;
    public static final int VECTOR_EDGE_HEADER_SIZE = 32;
    public static final int VECTOR_PATH_HEADER_SIZE = 16;
    public static final int VECTOR_INDEX_SIZE       = 4;

    // value for time
    public static final long MICRO_SECONDS_OF_SECOND = 1_000_000L;
    public static final long MICRO_SECONDS_OF_MINUTE = 60L * MICRO_SECONDS_OF_SECOND;
    public static final long MICRO_SECONDS_OF_HOUR   = 60L * MICRO_SECONDS_OF_MINUTE;
    public static final long MICRO_SECONDS_OF_DAY    = 24L * MICRO_SECONDS_OF_HOUR;

    // size for any
    public static final int ELEMENT_NUMBER_SIZE_FOR_ANY_VALUE = 2;

    // dim size for embeddingVector
    public static final int EMBEDDING_VECTOR_DIM_SIZE = 4;
    public static final int ELEMENT_NUMBER_SIZE_FOR_VECTOR_VALUE = 2;
    public static final int EMBEDDING_VECTOR_FLOAT_VALUE_SIZE = 4;

   */
  static const int valueTypeSize = 1;
  // Byte size for different data type
  static const int int8Size = 1;
  static const int int16Size = 2;
  static const int int32Size = 4;
  static const int int64Size = 8;
  static const int floatSize = 4;
  static const int doubleSize = 8;
  static const int boolSize = 1;
  // string size: 4 byte string value length + 4 byte prefix string
  // + 4 byte chunk offset + 4 byte chunk index
  static const int stringSize = 16;
  static const int chunkIndexLengthInStringHeader = 4;
  static const int chunkIndexStartPositionInStringHeader = 12;
  static const int chunkOffsetLengthInStringHeader = 4;
  static const int chunkOffsetStartPositionInStringHeader = 8;
  static const int stringValueLengthSize = 4;
  static const int stringMaxValueLengthInHeader = 12;

  static const int yearSize = 2;
  static const int monthSize = 1;
  static const int daySize = 1;
  static const int hourSize = 1;
  static const int minuteSize = 1;
  static const int secondSize = 1;
  static const int microsecSize = 4;

  static const int dateSize = yearSize + monthSize + daySize;
  static const int dateTimeSize = 8;
  static const int zonedDateTimeSize = 8;
  static const int localTimeSize = 8;

  static const int zonedTimeSize = 8;

  static const int durationSize = 8;

  // list
  // list header size
  static const int listHeaderSize = 8;
  // list size size
  static const int listSizeSize = 4;

  static const int recordHeaderSize = 8;
  static const int anyHeaderSize = 8;

  // Byte size for the element
  static const int graphIdSize = 4;
  static const int nodeTypeIdSize = 2;
  static const int edgeTypeIdSize = 4;
  static const int nodeIdSize = 8;

  static const int rankSize = 8;

  // node or edge type num size
  static const int graphElementTypeNumSize = 4;
  static const int propertyNumSize = 4;

  // path
  // element num size for path
  static const int pathElementNumSize = 4;
  // size for value for nodeTypes or edgeTypes for path: map<NodeTypeId, uint16_t> in server
  static const int pathMetaDataNodeEdgeTypeIndex = 2;
  static const int pathHeaderSizeSize = 4;
  static const int pathHeaderLengthSize = 4;
  static const int pathHeaderHeadOffsetSize = 4;
  static const int pathHeaderTailOffsetSize = 4;

  // filed num size for record
  static const int recordFieldNumSize = 4;

  // size for vector
  static const int vectorNodeHeaderSize = 16;
  static const int vectorEdgeHeaderSize = 32;
  static const int vectorPathHeaderSize = 16;
  static const int vectorIndexSize = 4;

  // value for time
  static const int microSecondsOfSecond = 1_000_000;
  static const int microSecondsOfMinute = 60 * microSecondsOfSecond;
  static const int microSecondsOfHour = 60 * microSecondsOfMinute;
  static const int microSecondsOfDay = 24 * microSecondsOfHour;

  // size for any
  static const int elementNumberSizeForAnyValue = 2;

  // dim size for embeddingVector
  static const int embeddingVectorDimSize = 4;
  static const int elementNumberSizeForVectorValue = 2;
  static const int embeddingVectorFloatValueSize = 4;
}
