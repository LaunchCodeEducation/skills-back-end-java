---
title: 'Classes and Objects: Encapsulating Behavior'
currentMenu: java4python
---

### Constructors

Once you have identified the instance variables for your class the next thing to consider is the constructor. **Constructor methods** allow for initialization behavior to occur when creating a new object from our class template. We were briefly introduced to constructor syntax in earlier lessons. For example, we created new `ArrayList` objects using the `new` keyword along with the `ArrayList` constructor:

```java
ArrayList<String> myList = new ArrayList<>();
```

In Java, constructors have the same name as the class and are most often declared public (though they can be private in certain situations). They are declared **without a return type**. Any function that is named the same as the class and has no return type is a constructor.

<aside class="aside-warning" markdown="1">
It's not required for every class to have a constructor. If you don't provide one, the Java compiler will generate an "empty" constructor for you. For example, if we left out a constructor in our `Point` class, the compiler would have created the following constructor for us:

```java
public Point() {}
```

Be careful with this; you almost always want to provide a constructor to properly initialize your objects.
</aside>

- overloading
- best practices
- syntax: no return type, new keyword

## Special Methods

### toString

### equals

<aside class="aside-pro-tip" markdown="1">
TODO - hashCode
</aside>

## Single Responsibility Principle
