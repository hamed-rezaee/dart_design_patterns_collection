import 'adapter.dart';

void main() {
  final Adaptee adaptee = Adaptee();
  final Target target = Adapter(adaptee);

  clientCode(target);
}
