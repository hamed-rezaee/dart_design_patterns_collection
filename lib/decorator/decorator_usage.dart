import 'decorator.dart';

void main() {
  Component component = ConcreteComponent();

  component = ConcreteDecoratorA(component);
  component = ConcreteDecoratorB(component);

  component.operation();
}
