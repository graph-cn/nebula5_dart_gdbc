// Copyright (c) 2025- All nebula5_dart_gdbc authors. All rights reserved.
//
// This source code is licensed under Apache 2.0 License.

part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class Ng5Connection extends Connection {
  late Map<String, dynamic> properties;
  late ng.GraphServiceClient client;
  Int64? _sessionId;
  ClientTransportConnectorChannel? channel;
  String? schema;

  Ng5Connection._create(
    Uri address, {
    Map<String, dynamic>? properties,
    Function()? onClose,
  }) {
    this.onClose = onClose;
    this.properties = properties ?? <String, dynamic>{};
    channel = ClientTransportConnectorChannel(
      SocketTransportConnector(
        address.host,
        address.port,
        ChannelOptions(
          // 增大接收消息的最大尺寸（默认 4MB）
          codecRegistry: CodecRegistry(
            codecs: const [GzipCodec(), IdentityCodec()],
          ),
          credentials: ChannelCredentials.insecure(),
        ),
      ),
    );
    client = ng.GraphServiceClient(channel!);
    schema = properties?['schema'] as String?;
  }

  Future<void> _open() async {
    await authencate();
    if (databaseName != null) {
      await executeQuery("SESSION SET home_schema_path = '$databaseName'");
    }
  }

  @override
  Future<void> close() async {
    await executeQuery("SESSION CLOSE");
    await channel?.shutdown();
    onClose?.call();
  }

  @override
  Future<void> commit() {
    // TODO: implement commit
    throw UnimplementedError();
  }

  @override
  Future<Statement> createStatement() async {
    return Ng5Statement(this);
  }

  @override
  String? get databaseName => schema;

  @override
  Future<ResultSet> executeQuery(
    String gql, {
    Map<String, dynamic>? params,
  }) async {
    var stmtBytes = Int8List.fromList(utf8.encode(gql));
    ng.ExecuteResponse resp = await client.execute(
      ng.ExecuteRequest(sessionId: _sessionId, stmt: stmtBytes),
    );
    // var rs = handleResult(resp, 0);
    // print(rs);

    var gdbParser = Ng5ResultHandler(resp);
    var rs = gdbParser.toResultSet();
    if (rs.success) {
      return rs;
    } else {
      throw GdbcQueryException(message: rs.message, code: rs.code);
    }
  }

  @override
  Future<int> executeUpdate(String gql) {
    // TODO: implement executeUpdate
    throw UnimplementedError();
  }

  @override
  Future<bool> getAutoCommit() {
    // TODO: implement getAutoCommit
    throw UnimplementedError();
  }

  @override
  Future<ResultSetMetaData> getMetaData() {
    // TODO: implement getMetaData
    throw UnimplementedError();
  }

  @override
  Future<bool> isClosed() {
    // TODO: implement isClosed
    throw UnimplementedError();
  }

  @override
  Future<PreparedStatement> prepareStatement(
    String gql, {
    String Function(String p1, Map<String, dynamic>? p2)? render,
  }) async {
    return Ng5PreparedStatement(this, gql: gql, render: render);
  }

  @override
  Future<PreparedStatement> prepareStatementWithParameters(
    String gql,
    List<ParameterMetaData> parameters,
  ) {
    // TODO: implement prepareStatementWithParameters
    throw UnimplementedError();
  }

  @override
  Future<void> rollback() {
    // TODO: implement rollback
    throw UnimplementedError();
  }

  @override
  Future<void> setAutoCommit(bool autoCommit) {
    // TODO: implement setAutoCommit
    throw UnimplementedError();
  }

  /// authenticate the user
  ///
  /// 认证用户
  Future<void> authencate() async {
    var clientInfo = ng.ClientInfo(
      lang: ng.ClientInfo_Language.UNKNOWN,
      protocolVersion: "5.0.0".codeUnits,
      version: "5.0.0".codeUnits,
    );
    var authOptions = {"password": properties[DriverManager.pwdKey]};
    var req = ng.AuthRequest(
      username: properties[DriverManager.usrKey].codeUnits,
      authInfo: jsonEncode(authOptions).codeUnits,
      clientInfo: clientInfo,
    );
    ng.AuthResponse authRes = await client.authenticate(
      req,
      options: CallOptions(timeout: Duration(seconds: 5)),
    );
    _sessionId = authRes.sessionId;
  }
}
