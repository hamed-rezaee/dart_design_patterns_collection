import 'mediator.dart';

void main() {
  final ConcreteMediator mediator = ConcreteMediator();

  final ConcreteColleague colleague1 =
      ConcreteColleague(mediator, 'Colleague 1');
  final ConcreteColleague colleague2 =
      ConcreteColleague(mediator, 'Colleague 2');

  mediator.register(colleague1);
  mediator.register(colleague2);

  colleague1.send('Hello, Colleague 2!');
  colleague2.send('Hi, Colleague 1!');
}
