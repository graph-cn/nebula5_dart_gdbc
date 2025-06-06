// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

library;

import 'dart:convert';
import 'dart:typed_data';

import 'package:decimal/decimal.dart';
import 'package:dart_gdbc/dart_gdbc.dart';
import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc/src/client/http2_connection.dart';
import 'package:grpc/src/client/http2_channel.dart';
import 'package:nebula5_dart_gdbc/src/proto/common.pb.dart' as ng;
import 'package:nebula5_dart_gdbc/src/proto/graph.pbgrpc.dart' as ng;
import 'package:nebula5_dart_gdbc/src/proto/vector.pb.dart' as ng;

export 'package:dart_gdbc/dart_gdbc.dart';

part 'src/ng5_driver.dart';
part 'src/ng5_connection.dart';
part 'src/ng5_statement.dart';
part 'src/ng5_result_set.dart';
part 'src/ng5_result_set_meta_data.dart';
part 'src/ng5_result_handler.dart';
part 'src/ng5_prepared_statement.dart';

part 'src/decode//batch.dart';
part 'src/decode//bytes_reader.dart';
part 'src/decode//column_type.dart';
part 'src/decode/datatype/basic_type.dart';
part 'src/decode/datatype/data_type.dart';
part 'src/decode/datatype/edge_type.dart';
part 'src/decode/datatype/embedding_vector_type.dart';
part 'src/decode/datatype/list_type.dart';
part 'src/decode/datatype/node_type.dart';
part 'src/decode/datatype/path_type.dart';
part 'src/decode/datatype/record_type.dart';
part 'src/decode/datatype/value_type_parser.dart';
part 'src/decode/datatype/vector_type.dart';
part 'src/decode//decode_utils.dart';
part 'src/decode//result_table.dart';
part 'src/decode//row.dart';
part 'src/decode/struct/any_header.dart';
part 'src/decode/struct/any_value.dart';
part 'src/decode/struct/edge_header.dart';
part 'src/decode/struct/edge_schema.dart';
part 'src/decode/struct/graph_schema.dart';
part 'src/decode/struct/list_header.dart';
part 'src/decode/struct/node_header.dart';
part 'src/decode/struct/node_schema.dart';
part 'src/decode/struct/path_adj_header.dart';
part 'src/decode/struct/path_header.dart';
part 'src/decode/struct/path_special_meta_data.dart';
part 'src/decode/struct/path_vector_pair.dart';
part 'src/decode/struct/result_graph_schemas.dart';
part 'src/decode/struct/size_constant.dart';
part 'src/decode//vector_wrapper.dart';

// data

part 'src/data//base_data_object.dart';
part 'src/data//edge.dart';
part 'src/data//embedding_vector.dart';
part 'src/data//extra_info.dart';
part 'src/data//host_address.dart';
part 'src/data//n_date.dart';
part 'src/data//n_date_time.dart';
part 'src/data//n_duration.dart';
part 'src/data//node.dart';
part 'src/data//n_record.dart';
part 'src/data//n_time.dart';
part 'src/data//n_zoned_date_time.dart';
part 'src/data//n_zoned_time.dart';
part 'src/data//path.dart';
part 'src/data//plan_info_node.dart';
part 'src/data//value_wrapper.dart';

// utils
part 'src/utils/zone_offset_util.dart';
part 'src/utils/object_utils.dart';

// ext
part 'src/ext/list_int_ext.dart';
