abstract class Target {
  void request();
}

class Adaptee {
  void specificRequest() => print("Adaptee's specificRequest called.");
}

class Adapter implements Target {
  Adapter(Adaptee adaptee) {
    _adaptee = adaptee;
  }

  late Adaptee _adaptee;

  @override
  void request() => _adaptee.specificRequest();
}

void clientCode(Target target) => target.request();
