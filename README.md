## Common Design Patterns in Dart

This repository contains examples of common design patterns with accompanying diagrams, class implementations, and information about their usage, pros and cons.

### What are Design Patterns?

Design patterns are reusable solutions to common software engineering problems. They provide a standard way to solve recurring problems in software development, making the code more modular, maintainable, and extensible. There are many design patterns, and understanding how to use them can significantly improve the quality of your code.

---

### [Factory Method Pattern](lib/factory_method/factory_method.dart)

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

### [Mediator Pattern](lib/mediator/mediator.dart)

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

### [Observer Pattern](lib/observer/observer.dart)

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

### [Proxy Pattern](lib/proxy/proxy.dart)

The Proxy Design Pattern is a structural design pattern that provides a surrogate or placeholder for another object to control access to it. It allows us to create an intermediary object that acts as a stand-in for another object, called the "real subject," and manages all communication with the real subject.
In general, the Proxy Design Pattern is used to provide a level of indirection between clients and the real object, with the proxy object acting as an intermediary. This can provide benefits such as increased security, performance improvements, and more flexible or modular code design.

```
           +-------------+
           |   Subject   |
           +-------------+
           | + request() |
           +------+------+
                  |
                  |
           +-------------+
           | RealSubject |
           +-------------+
           | + request() |
           +------+------+
                  |
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

### [Singleton Pattern](lib/singleton/singleton.dart)

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
