abstract class Product<T> {
  void doSomething(T data);
}

abstract class Creator<T> {
  Product<T> createProduct();
}

class ConcreteProductA implements Product<String> {
  @override
  void doSomething(String data) =>
      print('Doing something with data: $data in Product A');
}

class ConcreteProductB implements Product<int> {
  @override
  void doSomething(int data) =>
      print('Doing something with data: $data in Product B');
}

class ConcreteCreatorA implements Creator<String> {
  @override
  Product<String> createProduct() => ConcreteProductA();
}

class ConcreteCreatorB implements Creator<int> {
  @override
  Product<int> createProduct() => ConcreteProductB();
}
