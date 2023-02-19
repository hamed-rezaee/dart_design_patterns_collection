abstract class Subject<T> {
  void request(T message);
}

class RealSubject<T> implements Subject<T> {
  @override
  void request(T message) =>
      print('RealSubject: Handling request with message $message.');
}

class Proxy<T> implements Subject<T> {
  final RealSubject<T> _realSubject = RealSubject<T>();

  @override
  void request(T message) => _realSubject.request(message);
}
