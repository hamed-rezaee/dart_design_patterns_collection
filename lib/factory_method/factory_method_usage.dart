import 'factory_method.dart';

void main() {
  final Creator<String> creatorA = ConcreteCreatorA();
  final Product<String> productA = creatorA.createProduct();

  productA.doSomething('hello');

  final Creator<int> creatorB = ConcreteCreatorB();
  final Product<int> productB = creatorB.createProduct();

  productB.doSomething(123);
}
