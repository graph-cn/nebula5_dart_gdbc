// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class Ng5Statement implements Statement {
  Ng5Connection _conn;

  Ng5Statement(this._conn);

  @override
  Future<bool> execute({Map<String, dynamic>? params, String? gql}) async {
    var rs = await executeQuery(gql: gql);
    return rs.success;
  }

  @override
  Future<ResultSet> executeQuery({
    Map<String, dynamic>? params,
    String? gql,
  }) async {
    if (gql == null) {
      throw GdbcQueryException(message: 'gql is null');
    }
    return await _conn.executeQuery(gql, params: params);
  }

  @override
  Future<int> executeUpdate({Map<String, dynamic>? params, String? gql}) {
    // TODO: implement executeUpdate
    throw UnimplementedError();
  }
}
