import 'package:grpc/grpc.dart' as grpc;

import 'generated/bidirectional.pb.dart';
import 'generated/bidirectional.pbgrpc.dart';

class BidirectionalService extends BidirectionalServiceBase {
  @override
  Stream<Message> getServerResponse(
      grpc.ServiceCall call, Stream<Message> request) async* {
    print('Server processing gRPC bidirectional-streaming.');
    await for (var message in request) {
      yield message;
    }
  }
}

class Server {
  Future<void> main(List<String> args) async {
    final server = grpc.Server.create(services: [BidirectionalService()]);
    await server.serve(port: 50051);
    print('Starting server. Listening on port ${server.port}.');
  }
}
