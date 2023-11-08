import 'package:grpc/grpc.dart';

import 'generated/clientstreaming.pb.dart';
import 'generated/clientstreaming.pbgrpc.dart';

Message makeMessage(String message) {
  //return pb.Message(message: message);
  return Message()..message = message;
}

class Client {
  late ClientStreamingClient stub;

  Future<void> main(List<String> args) async {
    final channel = ClientChannel('localhost',
        port: 50051,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = ClientStreamingClient(channel);

    final response = await stub.getServerResponse(sendMessage());
    print('[server to client] ${response.value}');

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
      print('[client to server] $message');
      yield message;
    }
  }
}
