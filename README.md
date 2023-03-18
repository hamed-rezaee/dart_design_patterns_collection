## Common Design Patterns in Dart

This repository contains examples of common design patterns with accompanying diagrams, class implementations, and information about their usage, pros and cons.

### What are Design Patterns?

Design patterns are reusable solutions to common software engineering problems. They provide a standard way to solve recurring problems in software development, making the code more modular, maintainable, and extensible. There are many design patterns, and understanding how to use them can significantly improve the quality of your code.

### Repository Contents

The repository contains examples of the following design patterns:

- [Adapter Pattern](lib/adapter/)
- [Decorator Pattern](lib/decorator/)
- [Factory Method Pattern](lib/factory_method/)
- [Mediator Pattern](lib/mediator/)
- [Observer Pattern](lib/observer/)
- [Proxy Pattern](lib/proxy/)
- [Repository Pattern](lib/repository/)
- [Singleton Pattern](lib/singleton/)
- [Strategy Pattern](lib/strategy/)

---

### [Adapter Pattern](lib/adapter/)

The Adapter Pattern is a structural design pattern that allows two incompatible interfaces to work together by creating an adapter object that acts as a bridge between them. The Adapter Pattern is used when the interface of an existing class does not match the interface that the client expects. It is also used to reuse existing code with a new system, without having to modify the existing code.

```
   +--------------+         +--------------------+
   | Target       |         | Adapter            |        +----------------------
   +--------------+         +--------------------+        | Adaptee             |
   | + request()  | <------ | - adaptee: Adaptee | -----> +---------------------+
   +--------------+         | + request()        |        | + specificRequest() |
                            +--------------------+        +---------------------+
```

#### Pros:

- Reusability: The Adapter pattern allows existing classes to be reused in new contexts without modifying their original code. This can save time and effort, as well as promote code reuse.
- Interoperability: The Adapter pattern provides a way to interface between two incompatible or unrelated classes. This can be especially useful when working with third-party libraries or legacy code.
- Decoupling: The Adapter pattern can help to decouple client code from the details of the Adaptee class, making it easier to modify or replace the Adaptee without affecting the client code.
- Flexibility: The Adapter pattern can provide a flexible solution for integrating different components or systems, allowing them to work together seamlessly.

#### Cons:

- Complexity: Adding an adapter can introduce an additional layer of complexity to your code, which can make it harder to understand and maintain.
- Overuse: Overusing the Adapter pattern can lead to code that is difficult to understand and maintain, as well as unnecessary layers of abstraction.
- Performance: The use of an adapter can introduce a performance penalty, as it requires additional processing to translate between the two interfaces. However, this is usually negligible for most applications.

### [Decorator Pattern](lib/decorator/)

The Decorator pattern is a structural design pattern that allows behavior to be added to an individual object, either statically or dynamically, without affecting the behavior of other objects in the same class.

In the Decorator pattern, a decorator class is used to wrap the original object and provide additional functionality to it. The decorator class has the same interface as the original object, so it can be used in the same way as the original object. However, the decorator class adds new functionality by modifying the behavior of the original object.

```
                 +----------------+
                 |    Component   |
                 +----------------+
                 | + operation()  |
                 +----------------+
                          ^
                          |
                 +----------------+
                 |    Decorator   |
                 +----------------+
                 | - component    |
                 | + operation()  |
                 +----------------+
                          ^
                          |
            +----------------------------+
            |                            |
      +----------------+         +----------------+
      | Concrete CompA |         | Concrete CompB |
      +----------------+         +----------------+
      | + operation()  |         | + operation()  |
      +----------------+         +----------------+
```

#### Pros:

- Encapsulation: The Decorator pattern allows the functionality of an object to be encapsulated within a decorator object. This makes it easy to add or remove functionality without affecting the underlying object, and helps to keep the code organized and maintainable.
- Flexibility: The Decorator pattern allows new functionality to be added to an object at runtime, which can be useful in situations where the behavior of an object needs to be customized or extended dynamically.
- Open-closed principle: The Decorator pattern supports the open-closed principle, which states that classes should be open for extension but closed for modification. This means that new functionality can be added to the application without modifying existing code.
- Single Responsibility Principle: The Decorator pattern follows the Single Responsibility Principle, which states that a class should have only one reason to change. This makes the code more modular and easier to understand.

#### Cons:

- Complexity: The Decorator pattern can result in a large number of small classes, which can be difficult to manage and maintain. This can make the code more complex and harder to understand, especially if there are many layers of decorators.
- Performance: The Decorator pattern can have a performance impact, especially if many decorators are used. Each decorator adds a layer of indirection, which can slow down the application.
- Design overhead: The Decorator pattern requires a more complex design than simpler patterns like inheritance or composition. This can increase the initial design overhead and make it harder to get started with the project.
- Dependency injection: The Decorator pattern can make it harder to use dependency injection frameworks, as the objects being decorated may need to be constructed in a certain order.

### [Factory Method Pattern](lib/factory_method/)

The Factory Method pattern is a creational design pattern that provides an interface for creating objects, but allows subclasses to alter the type of objects that will be created. The Factory Method pattern is useful when you want to decouple the creation of an object from its use, and when you need to create objects that have varying implementations or configurations.

```
               +-------------------+              +----------------+
               |   Creator         |              |   Product      |
               +-------------------+              +----------------+
               |  factoryMethod()  |<-----------+ |  operation()   |
               +-------------------+              +----------------+
                      ^                                   ^
                      |                                   |
      +---------------------------------+        +-------------------------------+
      |    ConcreteCreator              |        |    ConcreteProduct            |
      +---------------------------------+        +-------------------------------+
      |  factoryMethod() : Product      |        |  operation() : void           |
      +---------------------------------+        +-------------------------------+
```

#### Pros:

- Encapsulation: The Factory Method Pattern encapsulates the object creation process and allows clients to use the created objects without needing to know how they are created.
- Code reuse: By using the Factory Method Pattern, you can reuse the same code to create different types of objects by creating different subclasses of the factory.
- Flexibility: The Factory Method Pattern makes it easy to add new types of objects to a system by simply creating a new subclass of the factory.
- Loose coupling: The Factory Method Pattern promotes loose coupling between classes, making it easy to change the implementation of a class without affecting the rest of the system.

#### Cons:

- Complexity: The Factory Method Pattern can add complexity to a system, especially if there are a large number of different types of objects that need to be created.
- Overhead: Using the Factory Method Pattern can introduce additional overhead in terms of object creation, which may not be necessary in simpler systems.
- Inflexibility: If the object creation process needs to be modified or customized on a per-instance basis, the Factory Method Pattern may not be flexible enough to handle these requirements.
- Abstraction: The Factory Method Pattern requires a level of abstraction and generalization that may not be appropriate for all systems.

### [Mediator Pattern](lib/mediator/)

The Mediator pattern is a behavioral design pattern that helps to reduce the dependencies between the objects in a system by introducing a mediator object that acts as a communication hub between the objects. In this pattern, the objects don't communicate with each other directly, but instead, they communicate through the mediator. This helps to improve the maintainability and scalability of the system.

```
   +-------------+             +------------------------+
   |  Colleague  |             |       Mediator         |
   +-----------  +             +------------------------+
   |             |             | +colleagueChanged()    |
   |+send(msg)   |             |                        |
   |             |<----------->| -colleague1: Colleague |
   |             |             | -colleague2: Colleague |
   +-------------+             |         ...            |
                               +------------------------+
                                /           |           \
                               /            |            \
                              /             |             \
                    +------------+   +------------+   +------------+
                    | Colleague1 |   | Colleague2 |   | Colleague3 |
                    +------------+   +------------+   +------------+
                    |            |   |            |   |            |
                    |            |   |            |   |            |
                    +------------+   +------------+   +------------+
```

#### Pros:

- Loose coupling: The Mediator Pattern promotes loose coupling between objects by encapsulating their interactions in a mediator object, which helps to reduce the dependencies between objects and makes the code easier to maintain and modify.
- Centralized control: The Mediator Pattern provides a centralized control point for coordinating the interactions between objects, which can help to simplify the code and reduce the complexity of the system.
- Reusability: The Mediator Pattern can promote code reuse by providing a reusable mediator object that can be used across multiple objects and interactions.
- Extensibility: The Mediator Pattern makes it easy to add new objects to a system and incorporate them into the interactions between existing objects, without having to modify the code for the existing objects.

#### Cons:

- Overhead: The Mediator Pattern can introduce additional overhead in terms of the mediator object and the communication between objects, which may not be necessary in simpler systems.
- Complexity: The Mediator Pattern can add complexity to a system, especially if there are a large number of objects and interactions that need to be coordinated.
- Single point of failure: The Mediator Pattern can create a single point of failure in the system, since all objects rely on the mediator object to coordinate their interactions.
- Tight coupling with mediator: If objects become too tightly coupled with the mediator object, it can lead to increased complexity and reduced flexibility.

### [Observer Pattern](lib/observer/)

The Observer pattern is a behavioral design pattern that is used to establish a one-to-many relationship between objects. In this pattern, an object (the subject) maintains a list of its dependents (observers) and notifies them automatically when any changes to its state occur. The Observer pattern is useful when you have a complex system with many objects that need to stay updated with the state changes of one or more objects.

```
   +----------------+            +----------------------+
   |  Subject       |<>--------->|       Observer       |
   +----------------+            +----------------------+
   | +notify()      |            | +update()            |
   +----------------+            +----------------------+
            ^
            |
   +--------------------+
   |  Concrete Subject  |
   +--------------------+
   |                    |
   +--------------------+
```

#### Pros:

- Loose coupling: The Observer Pattern promotes loose coupling between objects, since the dependent objects don't need to know about the implementation details of the observed object, but only need to be notified of changes.
- Flexibility: The Observer Pattern makes it easy to add and remove observers from the system without affecting the observed object or other observers.
- Reusability: The Observer Pattern can promote code reuse by providing a common interface for observers, which can be used across different observed objects.
- Scalability: The Observer Pattern can be used to create complex systems with many objects, since it allows for efficient communication between objects without requiring them to be tightly coupled.

#### Cons:

- Overhead: The Observer Pattern can introduce additional overhead in terms of the notifications and updates between objects, which may not be necessary in simpler systems.
- Unwanted notifications: The Observer Pattern can lead to unwanted notifications, especially if there are many observers and the observed object changes frequently.
- Inconsistent state: The Observer Pattern can lead to inconsistent state between objects, especially if the dependent objects are not updated in the correct order or frequency.
- Security issues: The Observer Pattern can create security issues if sensitive information is passed along to untrusted observers.

### [Proxy Pattern](lib/proxy/)

The Proxy Design Pattern is a structural design pattern that provides a surrogate or placeholder for another object to control access to it. It allows us to create an intermediary object that acts as a stand-in for another object, called the "real subject," and manages all communication with the real subject.
In general, the Proxy Design Pattern is used to provide a level of indirection between clients and the real object, with the proxy object acting as an intermediary. This can provide benefits such as increased security, performance improvements, and more flexible or modular code design.

```
           +-------------+
           |   Subject   |
           +-------------+
           | + request() |
           +------+------+
                  |
           +-------------+
           | RealSubject |
           +-------------+
           | + request() |
           +------+------+
                  |
   +--------------+-------------+
   |  Proxy                     |
   +----------------------------+
   | - realSubject: RealSubject |
   | + request()                |
   +----------------------------+
```

#### Pros:

- Increased security: By using a proxy object to control access to the real object, we can ensure that only authorized clients can access the real object.
- Improved performance: If the real object is expensive to create or use, the proxy object can cache results, delay the creation of the real object until it is actually needed, or perform other optimizations to improve performance.
- Modular design: The proxy object can provide a modular design that separates concerns between the client and the real object. This can make the code easier to maintain and update.
- Flexibility: The proxy object can provide additional functionality such as logging, caching, and error checking, without modifying the real object's code.

#### Cons:

- Additional complexity: The use of a proxy object can add an additional layer of complexity to the code, especially if the proxy object is designed to provide additional functionality.
- Potential overhead: The use of a proxy object can potentially add overhead to the system by introducing additional processing and communication between the client and the real object.
- Reduced performance: In some cases, the use of a proxy object can actually reduce performance, especially if the proxy object is designed to perform additional checks or validations before forwarding the request to the real object.

### [Repository Pattern](lib/repository/)

The Repository Pattern is a structural pattern that defines a structure for organizing the code that separates the concerns of data access from the business logic of an application. It does this by introducing a layer of abstraction between the application and the data storage layer, which helps to decouple the code and improve its modularity.

```
   +-----------------------+           +-----------------------+
   | Application Code      |           | Repository            |
   +-----------------------+           +-----------------------+
   | + fetch()             |  uses     | + fetch()             |
   | + update()            | --------> | + update()            |
   | + delete()            |           | + delete()            |
   +-----------------------+           | + ...                 |
               |                       +-----------------------+
               v                                   |
      +-----------------+                          v
      | Data            |              +-----------------------+
      +-----------------+              | Data Access Code      |
      | + field: type   |              +-----------------------+
      | + field: type   |              | + fetch()             |
      | + ...           |              | + update()            |
      +-----------------+              | + delete()            |
                                       +-----------------------+
```

#### Pros:

- Separation of concerns: The Repository Pattern helps to separate the data access logic from the rest of the application code. This makes it easier to maintain and test the code, as well as making it - more modular and flexible.
- Abstraction: The Repository Pattern provides an abstraction layer between the application code and the data access code, which allows the data access implementation to be changed without affecting the application code.
- Reusability: The Repository Pattern promotes reusability of code by defining a common interface that can be used by multiple parts of the application.

#### Cons:

- Overhead: Implementing the Repository Pattern can add extra overhead to the code, as it requires additional classes and interfaces to be defined. This can make the code more complex and difficult to understand.
- Complexity: The Repository Pattern can be complex to implement correctly, especially when dealing with complex data structures or queries.
- Learning curve: The Repository Pattern requires a certain level of understanding of software design patterns and abstraction, which may take time to learn and implement correctly.

### [Singleton Pattern](lib/singleton/)

The Singleton pattern is a creational design pattern that ensures a class has only one instance and provides a global point of access to it.

```
   +----------------------------+
   | Singleton                  |
   +----------------------------+
   | -instance: Singleton       |
   +----------------------------+
   | +getInstance(): Singleton  |
   +----------------------------+
```

#### Pros:

- Controlled access: The Singleton Pattern provides a single point of access to the instance of a class, which can help to control and regulate access to the object.
- Global access: The Singleton Pattern provides a global point of access to the object, which can be useful in situations where multiple objects need to share the same state or resources.
- Efficiency: The Singleton Pattern can improve performance by ensuring that only one instance of an object is created, which can reduce memory usage and increase efficiency.
- Easy to implement: The Singleton Pattern is relatively easy to implement and can be used in a wide range of scenarios.

#### Cons:

- Tight coupling: The Singleton Pattern can create tight coupling between the singleton class and other classes that depend on it, which can make the code less flexible and harder to maintain.
- Testability: The Singleton Pattern can make it more difficult to test code, since it relies on a global instance that cannot be easily replaced or modified for testing purposes.
- Concurrency issues: The Singleton Pattern can lead to concurrency issues in multithreaded environments, since multiple threads may attempt to access or modify the same instance of the object.
- Hidden dependencies: The Singleton Pattern can create hidden dependencies in the code, since other classes may rely on the singleton instance without explicitly stating their dependencies.

### [Strategy Pattern](lib/strategy/)

The Strategy Pattern is a behavioral design pattern that allows you to define a family of algorithms, encapsulate each one as an object, and make them interchangeable at runtime. The pattern separates the algorithm implementation from the client code that uses it, which makes it easier to add new algorithms or modify existing ones without affecting the client code.

The basic idea behind the Strategy Pattern is to define a common interface for all algorithms in the family. This interface defines a set of methods that the client code can use to interact with the algorithm objects. Each algorithm implementation is then encapsulated in a separate class that implements the common interface.

```
   +---------------------+            +------------------+           +------------------+
   | Context             |<>----------| Strategy         |<>-------->| ConcreteStrategy |
   |---------------------|            |------------------|           |------------------|
   | -strategy:          |            | +execute():void  |           | +execute():void  |
   | +setStrategy()      |            +------------------|           +------------------+
   | +executeStrategy()  |
   +---------------------+
```

#### Pros:

- Reusability: The Strategy Pattern promotes code reuse by allowing the client code to reuse the same Context object with different Strategy objects, rather than creating a new object for each algorithm.
- Flexibility: The Strategy Pattern makes it easy to switch between different algorithm implementations at runtime, which can be useful in situations where the algorithm requirements change frequently.
- Maintainability: The Strategy Pattern separates the algorithm implementation from the client code, which makes it easier to modify or add new algorithms without affecting the existing code.
- Testability: The Strategy Pattern makes it easier to test the algorithm implementations in isolation, which can be useful in situations where the algorithms are complex or require extensive testing.

#### Cons:

- Complexity: The Strategy Pattern adds an additional layer of complexity to the code, which can make it harder to understand or maintain.
- Memory overhead: The Strategy Pattern requires the creation of additional objects for each algorithm implementation, which can increase memory usage.
- Increased development time: Implementing the Strategy Pattern requires additional development time to create the interface or abstract class, implement the concrete classes, and integrate them with the client code.
