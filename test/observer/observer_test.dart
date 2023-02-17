import 'package:test/test.dart';

import 'package:dart_design_patterns/observer/observer.dart';

void main() {
  group('Observer pattern test =>', () {
    late Subject<int> subject;

    setUp(() => subject = Subject<int>());

    test('addObserver should add an observer.', () {
      final _MockObserver observer = _MockObserver();

      subject.addObserver(observer);

      expect(subject.observersCount, equals(1));
    });

    test('removeObserver should remove an observer.', () {
      final _MockObserver observer = _MockObserver();

      subject.addObserver(observer);

      subject.removeObserver(observer);

      expect(subject.observersCount, equals(0));
    });

    test('notifyObservers should call update on all observers.', () {
      const int message = 42;

      final _MockObserver observer1 = _MockObserver();
      final _MockObserver observer2 = _MockObserver();

      subject.addObserver(observer1);
      subject.addObserver(observer2);

      subject.notifyObservers(message);

      expect(observer1.updateCalledWith, equals(message));
      expect(observer2.updateCalledWith, equals(message));
    });
  });
}

class _MockObserver implements BaseObserver<int> {
  int updateCalledWith = 0;

  @override
  void update(int message) => updateCalledWith = message;
}
