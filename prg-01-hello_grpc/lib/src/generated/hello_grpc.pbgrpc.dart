//
//  Generated code. Do not modify.
//  source: hello_grpc.proto
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

import 'hello_grpc.pb.dart' as $0;

export 'hello_grpc.pb.dart';

@$pb.GrpcServiceName('MyService')
class MyServiceClient extends $grpc.Client {
  static final _$myFunction = $grpc.ClientMethod<$0.MyNumber, $0.MyNumber>(
      '/MyService/MyFunction',
      ($0.MyNumber value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.MyNumber.fromBuffer(value));

  MyServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.MyNumber> myFunction($0.MyNumber request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$myFunction, request, options: options);
  }
}

@$pb.GrpcServiceName('MyService')
abstract class MyServiceBase extends $grpc.Service {
  $core.String get $name => 'MyService';

  MyServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.MyNumber, $0.MyNumber>(
        'MyFunction',
        myFunction_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MyNumber.fromBuffer(value),
        ($0.MyNumber value) => value.writeToBuffer()));
  }

  $async.Future<$0.MyNumber> myFunction_Pre($grpc.ServiceCall call, $async.Future<$0.MyNumber> request) async {
    return myFunction(call, await request);
  }

  $async.Future<$0.MyNumber> myFunction($grpc.ServiceCall call, $0.MyNumber request);
}
