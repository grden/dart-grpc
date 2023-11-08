import 'package:grpc/grpc.dart' as grpc;

import 'generated/clientstreaming.pb.dart';
import 'generated/clientstreaming.pbgrpc.dart';

class ClientStreamingService extends ClientStreamingServiceBase {
  @override
  Future<Number> getServerResponse(
      grpc.ServiceCall call, Stream<Message> request) async {
    print('Server processing gRPC client-streaming.');
    int count = 0;
    await for (var message in request) {
      count++;
    }
    return Number()..value = count;
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server.create(services: [ClientStreamingService()]);
    await server.serve(port: 50051);
    print('Starting server. Listening on port ${server.port}.');
  }
}
