abstract class Component {
  void operation();
}

class ConcreteComponent implements Component {
  @override
  void operation() => print('$runtimeType operation');
}

abstract class Decorator implements Component {
  Decorator(Component component) {
    _component = component;
  }

  late Component _component;

  @override
  void operation() => _component.operation();
}

class ConcreteDecoratorA extends Decorator {
  ConcreteDecoratorA(Component component) : super(component);

  @override
  void operation() {
    super.operation();

    print('$runtimeType operation');
  }
}

class ConcreteDecoratorB extends Decorator {
  ConcreteDecoratorB(Component component) : super(component);

  @override
  void operation() {
    super.operation();

    print('$runtimeType operation');
  }
}
