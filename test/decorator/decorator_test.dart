import 'package:test/test.dart';

import 'package:dart_design_patterns/decorator/decorator.dart';

void main() {
  group('Decorator pattern test =>', () {
    test('should add behavior to ConcreteComponent through ConcreteDecoratorA.',
        () {
      final ConcreteComponent component = ConcreteComponent();
      final ConcreteDecoratorA decoratorA = ConcreteDecoratorA(component);

      expectLater(
        decoratorA.operation,
        prints('ConcreteComponent operation\nConcreteDecoratorA operation\n'),
      );
    });

    test('should add behavior to ConcreteComponent through ConcreteDecoratorB.',
        () {
      final ConcreteComponent component = ConcreteComponent();
      final ConcreteDecoratorB decoratorB = ConcreteDecoratorB(component);

      expectLater(
        decoratorB.operation,
        prints('ConcreteComponent operation\nConcreteDecoratorB operation\n'),
      );
    });

    test('should chain multiple decorators.', () {
      final ConcreteComponent component = ConcreteComponent();
      final ConcreteDecoratorA decoratorA = ConcreteDecoratorA(component);
      final ConcreteDecoratorB decoratorB = ConcreteDecoratorB(decoratorA);

      expectLater(
        decoratorB.operation,
        prints(
          'ConcreteComponent operation\nConcreteDecoratorA operation\nConcreteDecoratorB operation\n',
        ),
      );
    });
  });
}
