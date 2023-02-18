import 'package:test/test.dart';

import 'package:dart_design_patterns/factory_method/factory_method.dart';

void main() {
  group('Factory Method pattern test =>', () {
    test('Test creating and using ConcreteCreatorA.', () {
      final ConcreteCreatorA creator = ConcreteCreatorA();
      final Product<String> product = creator.createProduct();

      product.doSomething('test data');

      expect(product is ConcreteProductA, true);
    });

    test('Test creating and using ConcreteCreatorB.', () {
      final ConcreteCreatorB creator = ConcreteCreatorB();
      final Product<int> product = creator.createProduct();

      product.doSomething(123);

      expect(product is ConcreteProductB, true);
    });
  });
}
