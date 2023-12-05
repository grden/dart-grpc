import 'package:grpc/grpc.dart' as grpc;
import 'package:grpc/grpc_connection_interface.dart';

import 'generated/bidirectional.pb.dart';
import 'generated/bidirectional.pbgrpc.dart';

Message makeMessage(String message) {
  //return pb.Message(message: message);
  return Message()..message = message;
}

class Client {
  late BidirectionalClient stub;

  Future<void> main(List<String> args) async {
    final channel = ClientChannel('localhost',
        port: 50051,
        options:
            ChannelOptions(credentials: grpc.ChannelCredentials.insecure()));

    stub = BidirectionalClient(channel);

    final response = stub.getServerResponse(sendMessage());
    await for (var message in response) {
      print('[server to client] $message');
    }

    await channel.shutdown();
  }

  Stream<Message> sendMessage() async* {
    List<Message> messages = [
      makeMessage("message #1"),
      makeMessage("message #2"),
      makeMessage("message #3"),
      makeMessage("message #4"),
      makeMessage("message #5"),
    ];
    for (var message in messages) {
      // 보내는 거는 await 안 씀
      print('[client to server] $message');
      yield message;
    }
  }
}
