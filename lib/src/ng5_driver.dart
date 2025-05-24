part of 'package:nebula5_dart_gdbc/nebula5_dart_gdbc.dart';

class Ng5Driver extends Driver {
  @override
  bool acceptsURL(String url) {
    return url.startsWith('gdbc.nebula5:');
  }

  @override
  Future<Connection> connect(
    String url, {
    Map<String, dynamic>? properties,
  }) async {
    var address = _parseURL(url);
    address.queryParameters.forEach((key, value) {
      properties![key] = value;
    });
    var conn = Ng5Connection._create(address, properties: properties);
    await conn._open();
    return conn;
  }

  Uri _parseURL(String url) {
    var uri = Uri.parse(url);
    if (uri.scheme != 'gdbc.nebula5' || uri.host.isEmpty || uri.port <= 0) {
      throw ArgumentError('Invalid URL: $url');
    }
    return uri;
  }
}
