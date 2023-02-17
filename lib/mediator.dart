abstract class BaseMediator {
  void notify(BaseColleague sender, String message);
}

abstract class BaseColleague {
  void send(String message);
  void receive(String message);
}

class ConcreteMediator implements BaseMediator {
  final List<BaseColleague> _colleagues = <BaseColleague>[];

  void register(BaseColleague colleague) => _colleagues.add(colleague);

  @override
  void notify(BaseColleague sender, String message) {
    for (final BaseColleague colleague in _colleagues) {
      if (colleague != sender) {
        colleague.receive(message);
      }
    }
  }
}

class ConcreteColleague implements BaseColleague {
  ConcreteColleague(this.mediator, this.name);

  BaseMediator mediator;
  String name;

  @override
  void send(String message) => mediator.notify(this, message);

  @override
  void receive(String message) => print('$name received message: $message');
}
