import 'package:grpc/grpc.dart' as grpc;

import 'generated/hello_grpc.pb.dart';
import 'generated/hello_grpc.pbgrpc.dart';

import 'hello_grpc.dart' as hello_grpc;

class MyServiceServicer extends MyServiceBase {
  @override
  Future<MyNumber> myFunction(grpc.ServiceCall call, MyNumber request) async {
    return MyNumber()..value = hello_grpc.myFunc(request.value);
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server.create(services: [MyServiceServicer()]);
    await server.serve(port: 50051);
    print('Starting server. Listening on port ${server.port}.');
  }
}
