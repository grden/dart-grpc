import 'package:grpc/grpc.dart';

import 'generated/serverstreaming.pb.dart';
import 'generated/serverstreaming.pbgrpc.dart';

class Client {
  late ServerstreamingClient stub;

  Future<void> main(List<String> args) async {
    final channel = ClientChannel('localhost',
        port: 50051,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = ServerstreamingClient(channel);

    try {
      await recvMessage();
    } catch (e) {
      print('error: $e');
    }
    await channel.shutdown();
  }

  Future<void> recvMessage() async {
    final request = Number()..value = 5;
    await for (var message in stub.getServerResponse(request)) {
      print('[server to client] $message');
    }
  }
}
