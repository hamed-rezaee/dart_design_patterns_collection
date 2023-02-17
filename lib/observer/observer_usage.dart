import 'observer.dart';

void main() {
  final Subject<String> subject = Subject<String>();

  final ConcreteObserverA observerA = ConcreteObserverA();
  final ConcreteObserverB observerB = ConcreteObserverB();

  subject.addObserver(observerA);
  subject.addObserver(observerB);

  subject.notifyObservers('Hello World!');

  subject.removeObserver(observerA);

  subject.notifyObservers('Goodbye World!');
}
