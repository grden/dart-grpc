//
//  Generated code. Do not modify.
//  source: bidirectional.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'bidirectional.pb.dart' as $0;

export 'bidirectional.pb.dart';

@$pb.GrpcServiceName('bidirectional.Bidirectional')
class BidirectionalClient extends $grpc.Client {
  static final _$getServerResponse = $grpc.ClientMethod<$0.Message, $0.Message>(
      '/bidirectional.Bidirectional/GetServerResponse',
      ($0.Message value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Message.fromBuffer(value));

  BidirectionalClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseStream<$0.Message> getServerResponse($async.Stream<$0.Message> request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getServerResponse, request, options: options);
  }
}

@$pb.GrpcServiceName('bidirectional.Bidirectional')
abstract class BidirectionalServiceBase extends $grpc.Service {
  $core.String get $name => 'bidirectional.Bidirectional';

  BidirectionalServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Message, $0.Message>(
        'GetServerResponse',
        getServerResponse,
        true,
        true,
        ($core.List<$core.int> value) => $0.Message.fromBuffer(value),
        ($0.Message value) => value.writeToBuffer()));
  }

  $async.Stream<$0.Message> getServerResponse($grpc.ServiceCall call, $async.Stream<$0.Message> request);
}
