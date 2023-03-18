import 'package:test/test.dart';

import 'package:dart_design_patterns/strategy/strategy.dart';

void main() {
  group('strategy  pattern test =>', () {
    test('should execute concrete strategy a.', () {
      final Context context = Context(ConcreteStrategyA());

      expect(() => context.executeStrategy(),
          prints('Executing Concrete Strategy A\n'));
    });

    test('should execute concrete strategy b.', () {
      final Context context = Context(ConcreteStrategyB());

      expect(() => context.executeStrategy(),
          prints('Executing Concrete Strategy B\n'));
    });

    test('should change strategy at runtime.', () {
      final Context context = Context(ConcreteStrategyA());

      expect(
        () => context.executeStrategy(),
        prints('Executing Concrete Strategy A\n'),
      );

      context.setStrategy(ConcreteStrategyB());

      expect(
        () => context.executeStrategy(),
        prints('Executing Concrete Strategy B\n'),
      );
    });
  });
}
