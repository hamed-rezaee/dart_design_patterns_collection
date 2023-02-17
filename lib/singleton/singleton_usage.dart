import 'singleton.dart';

void main() {
  final Singleton singleton1 = Singleton();
  final Singleton singleton2 = Singleton();

  print(singleton1 == singleton2);

  final LazySingleton lazySingleton1 = LazySingleton();
  final LazySingleton lazySingleton2 = LazySingleton();

  print(lazySingleton1 == lazySingleton2);
}
