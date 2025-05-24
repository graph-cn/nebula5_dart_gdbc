//
//  Generated code. Do not modify.
//  source: graph.proto
//
// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'graph.pb.dart' as $0;

export 'graph.pb.dart';

@$pb.GrpcServiceName('nebula.proto.graph.GraphService')
class GraphServiceClient extends $grpc.Client {
  static final _$authenticate = $grpc.ClientMethod<$0.AuthRequest, $0.AuthResponse>(
      '/nebula.proto.graph.GraphService/Authenticate',
      ($0.AuthRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthResponse.fromBuffer(value));
  static final _$execute = $grpc.ClientMethod<$0.ExecuteRequest, $0.ExecuteResponse>(
      '/nebula.proto.graph.GraphService/Execute',
      ($0.ExecuteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ExecuteResponse.fromBuffer(value));
  static final _$streamingExecute = $grpc.ClientMethod<$0.ExecuteRequest, $0.ExecuteResponse>(
      '/nebula.proto.graph.GraphService/StreamingExecute',
      ($0.ExecuteRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ExecuteResponse.fromBuffer(value));

  GraphServiceClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.AuthResponse> authenticate($0.AuthRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$authenticate, request, options: options);
  }

  $grpc.ResponseFuture<$0.ExecuteResponse> execute($0.ExecuteRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$execute, request, options: options);
  }

  $grpc.ResponseStream<$0.ExecuteResponse> streamingExecute($0.ExecuteRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$streamingExecute, $async.Stream.fromIterable([request]), options: options);
  }
}

@$pb.GrpcServiceName('nebula.proto.graph.GraphService')
abstract class GraphServiceBase extends $grpc.Service {
  $core.String get $name => 'nebula.proto.graph.GraphService';

  GraphServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthRequest, $0.AuthResponse>(
        'Authenticate',
        authenticate_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthRequest.fromBuffer(value),
        ($0.AuthResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExecuteRequest, $0.ExecuteResponse>(
        'Execute',
        execute_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ExecuteRequest.fromBuffer(value),
        ($0.ExecuteResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ExecuteRequest, $0.ExecuteResponse>(
        'StreamingExecute',
        streamingExecute_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.ExecuteRequest.fromBuffer(value),
        ($0.ExecuteResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthResponse> authenticate_Pre($grpc.ServiceCall $call, $async.Future<$0.AuthRequest> $request) async {
    return authenticate($call, await $request);
  }

  $async.Future<$0.ExecuteResponse> execute_Pre($grpc.ServiceCall $call, $async.Future<$0.ExecuteRequest> $request) async {
    return execute($call, await $request);
  }

  $async.Stream<$0.ExecuteResponse> streamingExecute_Pre($grpc.ServiceCall $call, $async.Future<$0.ExecuteRequest> $request) async* {
    yield* streamingExecute($call, await $request);
  }

  $async.Future<$0.AuthResponse> authenticate($grpc.ServiceCall call, $0.AuthRequest request);
  $async.Future<$0.ExecuteResponse> execute($grpc.ServiceCall call, $0.ExecuteRequest request);
  $async.Stream<$0.ExecuteResponse> streamingExecute($grpc.ServiceCall call, $0.ExecuteRequest request);
}
