abstract class BaseObserver<T> {
  void update(T message);
}

class Subject<T> {
  final List<BaseObserver<T>> _observers = <BaseObserver<T>>[];

  int get observersCount => _observers.length;

  void addObserver(BaseObserver<T> observer) => _observers.add(observer);

  void removeObserver(BaseObserver<T> observer) => _observers.remove(observer);

  void notifyObservers(T message) {
    for (final BaseObserver<T> observer in _observers) {
      observer.update(message);
    }
  }
}

class ConcreteObserverA implements BaseObserver<String> {
  @override
  void update(String message) =>
      print('$runtimeType received message: $message');
}

class ConcreteObserverB implements BaseObserver<String> {
  @override
  void update(String message) =>
      print('$runtimeType received message: $message');
}
