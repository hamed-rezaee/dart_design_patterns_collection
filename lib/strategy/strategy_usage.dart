import 'package:dart_design_patterns/strategy/strategy.dart';

void main() {
  final ConcreteStrategyA strategyA = ConcreteStrategyA();
  final ConcreteStrategyB strategyB = ConcreteStrategyB();

  final Context context = Context(strategyA);

  context.executeStrategy();

  context.setStrategy(strategyB);
  context.executeStrategy();
}
