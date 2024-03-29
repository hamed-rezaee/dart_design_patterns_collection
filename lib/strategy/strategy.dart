abstract class Strategy {
  void execute();
}

class ConcreteStrategyA implements Strategy {
  @override
  void execute() => print('Executing Concrete Strategy A');
}

class ConcreteStrategyB implements Strategy {
  @override
  void execute() => print('Executing Concrete Strategy B');
}

class Context {
  Context(this._strategy);

  Strategy _strategy;

  void setStrategy(Strategy strategy) => _strategy = strategy;

  void executeStrategy() => _strategy.execute();
}
