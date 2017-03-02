---
title: Glossary
currentMenu: glossary
---

For terms that aren't listed here, refer to the [Oracle Java Glossary of Terms](http://docs.oracle.com/javase/tutorial/information/glossary.html).

**class**: A blueprint, or template, for an object. Classes define properties (data) and  methods (behavior) that each object created from the class template will have. In Java, a publicly available class is declared as follows:

```java
public class MyClass {
    // property and method definitions
}
```

**classpath**: A parameter for the Java Virtual Machine or Java compiler that specifies the location of classes and packages available for use.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Classpath_(Java))

**declaration**: To specify the name and data type of a variable or property. This may be done either in conjunction with or prior to initialization.

```java
// Declaration without initialization
String name;
```

```java
// Declaration with initialization
String name = "Michael";
```

**encapsulation**: The bundling of related data and behaviors that operate on that data, usually with restricted access to internal, non-public data and behaviors. In object-oriented programming, encapsulation is achieved through the use of objects.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming))

**Integrated Development Environment (IDE)**: An application that provides access to and integration between software development tools that would otherwise be used independently, such as compilation, execution, access to documentation, built tools, source code management, and version control.


**inheritance**: A mechanism within object-oriented programming that allows one class to be based on another class, this "inheriting" its properties and behaviors. Inheritence is also sometimes referred to as **subtyping** or **extension**.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Inheritance_(object-oriented_programming))

**initialize**: To assign a value to a declared variable or property for the first time. This may be done in conjunction with or after declaration.

<aside class="aside-example" markdown="1">

```java
// Initialization with declaration
String name = "Michael";
```

```java
// Separate declaration and initialization
String name;
name = "Michael";
```
</aside>

**instance**: An explicit object within a program.

<aside class="aside-example" markdown="1">
The variable `apple` is an instance of `Fruit`.

```java
Fruit apple = new Fruit("apple");
```
</aside>

**instance property (or instance variable)**: A property of a class that is non-static, so that each instance of the class has its own version of the property.

**JAR file**: JAR stands for "Java Archive" and is a file format that packages Java classes along with other relevant files (images, template files, etc) into a single file for distribution. In IntelliJ, you will see any JARs that are available to your project under External Libraries in the Project pane.

**object**: A value (i.e. a concrete unit within a program) created from a class. An object has a data type, which is the same as the name of the class it was created from.

```java
MyClass anObject = new Myclass( /* constructor parameters */ );
```

**package**: A collection of class organized within a namespace. Packages also allow for controlled access of class members within the class. Packages are also used to organize code with related functionality.

Source: [Wikipedia](https://en.wikipedia.org/wiki/Java_package)

**polymorphism**: An object-oriented mechanism that allows for objects of different types to be used in the same way.

<aside class="aside-example" markdown="1">
Polymorhism may be realized via inheritence. Supposed classes `Dog` and `Cat` each extend the class `Pet`. Then variables and properties of type `Pet` may be assigned instances of `Dog` and `Cat`. Note, however, that in this case we can only use the properties and methods of `Pet`, and not those that belong to `Dog` and `Cat` but not `Pet`.
```java
Pet jack = new Dog("Jack");
Pet suki = new Cat("Suki");
```
</aside>

<aside class="aside-example" markdown="1">
Polymorhism may be realized via interfaces. An alternative designn approach to the example above would be to have `Pet` be an interface, and then implement the `Pet` interface with the classes `Dog` and `Cat`. Then, similarly, variables and properties of type `Pet` may be assigned instances of `Dog` and `Cat`. As above, it is then only allowed to call methods that are part of the `Pet` interface.
</aside>

**primitive**: A built-in non-class type. Common primitives include `int`, `double`, `char`, and `boolean`. Each primitive type has a corresponding class type (e.g. `Integer`, `Double`, and so on).

Source: [Oracle](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/datatypes.html)
