import 'proxy.dart';

void main() {
  final Proxy<String> proxy = Proxy<String>();

  proxy.request('Hello World.');
  proxy.request('Hello Dart.');
}
