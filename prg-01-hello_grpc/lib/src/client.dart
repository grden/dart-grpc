import 'package:grpc/grpc.dart';

import 'generated/hello_grpc.pb.dart';
import 'generated/hello_grpc.pbgrpc.dart';

class Client {
  late MyServiceClient stub;

  Future<void> main(List<String> args) async {
    final channel = ClientChannel('localhost',
        port: 50051,
        options: ChannelOptions(credentials: ChannelCredentials.insecure()));

    stub = MyServiceClient(channel);

    final request = MyNumber()..value = 4;
    final response = await stub.myFunction(request);

    print('gRPC result: ${response.value}');

    await channel.shutdown();
  }
}
