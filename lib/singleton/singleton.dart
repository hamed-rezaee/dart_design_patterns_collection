class Singleton {
  factory Singleton() => _instance;

  Singleton._internal();

  static final Singleton _instance = Singleton._internal();
}

class LazySingleton {
  factory LazySingleton() => _instance ??= LazySingleton._internal();

  LazySingleton._internal();

  static LazySingleton? _instance;
}
