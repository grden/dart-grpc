import 'package:grpc/grpc.dart' as grpc;

import 'generated/serverstreaming.pb.dart';
import 'generated/serverstreaming.pbgrpc.dart';

Message makeMessage(String message) {
  //return pb.Message(message: message);
  return Message()..message = message;
}

class ServerStreamingService extends ServerstreamingServiceBase {
  @override
  Stream<Message> getServerResponse(
      grpc.ServiceCall call, Number request) async* {
    List<Message> messages = [
      makeMessage("message #1"),
      makeMessage("message #2"),
      makeMessage("message #3"),
      makeMessage("message #4"),
      makeMessage("message #5"),
    ];
    print('Server processing gRPC server-streaming ${request.value}.');
    for (var message in messages) {
      yield message;
    }
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server.create(services: [ServerStreamingService()]);
    await server.serve(port: 50051);
    print('Starting server. Listening on port ${server.port}.');
  }
}
