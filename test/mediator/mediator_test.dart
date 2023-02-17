import 'package:test/test.dart';

import 'package:dart_design_patterns/mediator/mediator.dart';

void main() {
  test('Test ConcreteColleague receives message from ConcreteMediator.', () {
    final ConcreteMediator mediator = ConcreteMediator();

    final ConcreteColleague colleague1 =
        ConcreteColleague(mediator, 'Colleague 1');
    final ConcreteColleague colleague2 =
        ConcreteColleague(mediator, 'Colleague 2');

    mediator.register(colleague1);
    mediator.register(colleague2);

    expect(colleague1.name, equals('Colleague 1'));
    expect(colleague2.name, equals('Colleague 2'));

    colleague1.send('Hello, Colleague 2!');

    expect(() => colleague2.receive('Hello, Colleague 2!'), returnsNormally);
  });
}
