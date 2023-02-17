import 'package:test/test.dart';

import 'package:dart_design_patterns/singleton/singleton.dart';

void main() {
  group('Singleton pattern test =>', () {
    test('should return the same instance.', () {
      final Singleton s1 = Singleton();
      final Singleton s2 = Singleton();

      expect(s1, same(s2));
    });
  });

  group('Lazy Singleton pattern test =>', () {
    test('should return the same instance.', () {
      final LazySingleton s1 = LazySingleton();
      final LazySingleton s2 = LazySingleton();

      expect(s1, same(s2));
    });
  });
}
