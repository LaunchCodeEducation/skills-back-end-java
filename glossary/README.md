---
title: Glossary
currentMenu: glossary
---

**class**: A blueprint, or template, for an object. Classes defining properties (data) and  methods (behavior) that each object created from the class template will have. In Java, a publicly available class is declared as follows:

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


**inheritance**:

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

**package**:

**polymorphism**:

**primitive**:

**property**:
