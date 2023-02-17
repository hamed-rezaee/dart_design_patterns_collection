abstract class BaseMediator<T> {
  final List<BaseColleague<T>> _colleagues = <BaseColleague<T>>[];

  void register(BaseColleague<T> colleague) => _colleagues.add(colleague);

  void notify(BaseColleague<T> sender, T message) {
    for (final BaseColleague<T> colleague in _colleagues) {
      if (colleague != sender) {
        colleague.receive(message);
      }
    }
  }
}

abstract class BaseColleague<T> {
  BaseColleague(this._mediator);

  final BaseMediator<T> _mediator;

  void send(T message) => _mediator.notify(this, message);

  void receive(T message);
}

class ConcreteMediator extends BaseMediator<String> {
  @override
  void notify(BaseColleague<String> sender, String message) {
    for (final BaseColleague<String> colleague in _colleagues) {
      if (colleague != sender) {
        colleague.receive(message);
      }
    }
  }
}

class ConcreteColleague extends BaseColleague<String> {
  ConcreteColleague(BaseMediator<String> mediator, this.name) : super(mediator);

  String name;

  @override
  void receive(String message) => print('$name received message: $message');
}
