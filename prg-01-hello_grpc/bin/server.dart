import 'package:hello_grpc/src/server.dart';

Future<void> main(List<String> args) async {
  await Server().main(args);
}
