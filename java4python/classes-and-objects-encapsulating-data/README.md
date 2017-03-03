---
title: 'Classes and Objects: Encapsulating Data'
currentMenu: java4python
---

Thus far, we have primarily been examining features of Java that are procedural in nature. Where we have used classes and objects, they have been provided from core Java packages. In this section, we explore some object-oriented concepts in Java.

In the process, we will introduce the **Three Pillars of Object-Oriented Programming: polymorphism, inheritance, and encapsulation (PIE)**.

## Encapsulation: Classes in Java

You have already seen how to define classes in Java; it's unavoidable for even the simplest of programs. However, we have only utilized the most minimal class structure.

Recall from our Python lessons that a class can be thought of as a blueprint for creating objects. They define the data and behaviors that each object created from the class blueprint (known as **instances** of the class) will have.

In this section we will look at how we define classes to create our own data types, along with exploring new class constructs. Some of these will mirror Python constructs, while others will be new.

From our [Glossary](../../glossary/), here's a definition of encapsulation:

<aside class="aside-definition" markdown="1">
**encapsulation:** The bundling of related data and behaviors that operate on that data, usually with restricted access to internal, non-public data and behaviors. In object-oriented programming, encapsulation is achieved through the use of objects.
</aside>

In other words, classes and objects allow us to encapsulate, or isolate, data and behavior to only the parts of our program to which they are relevant. And the concept of restricted access allows us to expose only that data and behavior that we want others to be able to use.

As before, let's motivate our exploration of these concepts by looking at Python and Java examples side-by-side.

## The Point Class in Python

Throughout [Chapter 13 of *Think Python*](https://runestone.launchcode.org/runestone/static/thinkcspy/toc.html#classes-and-objects-basics) we built a `Point` class. After adding various components to the class, we ended up with this:

```python
class Point:

    def __init__(self, initX, initY):
        """ Create a new point at the given coordinates. """
        self.x = initX
        self.y = initY

    def getX(self):
        return self.x

    def getY(self):
        return self.y

    def distanceFromOrigin(self):
        return ((self.x ** 2) + (self.y ** 2)) ** 0.5

    def __str__(self):
        return "x=" + str(self.x) + ", y=" + str(self.y)

    def halfway(self, target):
         mx = (self.x + target.x) / 2
         my = (self.y + target.y) / 2
         return Point(mx, my)
```

This class represents a point on an x-y plane. It contains member variables `x` and `y`, along with methods `distanceFromOrigin` and `halfway`. The former returns the distance of the given point from (0,0), while the latter takes in an additional point and returns a point that is halfway between the two.

## A Minimal Point Class in Java

We'll explore building an equivalent class in Java, which will lead to many new concepts. You'll find that Java provides much more structure for building and customizing classes than Python.

First, let's look at stripped-down Java version of the `Point` class, which only has the data associated with point:

```java
public class Point {

    private double x;
    private double y;

    public double getX() {
        return x;
    }

    public void setX(double x) {
        this.x = x;
    }

    public double getY() {
        return y;
    }

    public void setY(double y) {
        this.y = y;
    }
}
```

Classes are made up of **members**, of which there two types: fields and methods. We'll explore fields in detail in this lesson, and methods in the next, but first let's look at how access to class members is configured.

### Access Modifiers

Access modifiers in Java are keywords -- we've seen `public` and `private` so far -- that specify how class members may be accessed.

We've noted that `public` allows a field or method to be used by anyone, and that `private` allows a field or method to be used only within the class in which it is defined. Two additional access modifiers are available, though they are used much less often than `public` and `private`. The grid below details these levels, though we haven't really encountered the situations in which they might apply. At this point we introduce them for the sake of completeness. We'll point out specifically where they might be useful when we encounter such scenarios.

Modifier | Class | Package | Subclass | World
---------|-------|---------|----------|-------|
`public` | Y | Y | Y | Y
`protected` | Y | Y | Y | N
(no modifier, aka "package") | Y | Y | N | N
`private` | Y | N | N | N

You can read more about access modifiers at [docs.oracle.com][access-modifiers].

<aside class="aside-pro-tip" markdown="1">
In Java, you should always use the most restrictive access modifier possible. Minimizing access to class members allows code to be refactored more easily in the future, and hides details of how you implement your classes from others.
</aside>

### Fields

A **field** in Java is a variable that belongs to the class. We have two fields in the `Point` class, declared at the top of the class.

```java
private double x;
private double y;
```

While they may be declared anywhere within a class, fields should always be declared at top of the class. These two fields have the `private` modifier, which we've alluded to previously, and which we'll discuss in proper detail now.

A field may be of any primitive or object type, and fields may be initialized when they are declared. For example, we could provide default values for `x` and `y` this way:

```java
private double x = 0.0;
private double y = 0.0;
```

Note that we have specified that our fields are `private`. As a rule of thumb, fields should be private so that access to the may be more tightly controlled using methods.

Fields are also referred to as **instance variables**.

#### Getters and Setters

In order to provide access to private properties **getter and setter methods** are used. Getters and setters do what you might guess: get and set a given field. If we make the getter and/or setter public for a given property, then others will be able to access it in that way.

Here are our getters and setters for `x` and `y`:

```java
public double getX() {
    return x;
}

public void setX(double x) {
    this.x = x;
}

public double getY() {
    return y;
}

public void setY(double y) {
    this.y = y;
}
```

An astute question to ask at this point would be "Why make the fields private if you're just going to allow people to get and set them anyway?" That's a great question! There are lots of reasons to use getters and setters to control access. Here are a few that make sense to us right now:

1. Sometimes you'll want to implement behavior that happens every time a field is accessed (get) or changed (set). You might not realize that you want to do this when initially writing your class, so if you don't use getters and setters you'll have to do a lot more refactoring.
2. You can perform validation within a setter.
3. You can use different access modifiers on getters and setters for the same field, based on desired usage. For example, you might want to allow anyone to be able to read the value of a field, but only classes within the same package to modify it. You could do this with a public getter and a package-private setter, but not as a field without getters and setters, which could only be public to everyone or package-private to everyone.

As an example of reason 2, here's a `Temperature` class. A valid temperature can only be so low ("absolute zero"), so we wouldn't want to allow somebody to set an invalid value. In `setFahrenheit` we thrown an exception if an invalid value is provided (we'll cover exceptions in detail later, but for now note that they are ways of signaling errors).

```java
public class Temperature {

    private double fahrenheit;

    public Temperature(double fahrenheit) {
        this.fahrenheit = fahrenheit;
    }

    public double getFahrenheit() {
        return fahrenheit;
    }

    public void setFahrenheit(double fahrenheit) {

        // Validate that temp isn't lower than the coldest possible temp ("absolute zero")
        if (fahrenheit < -459.67) {
            throw new IllegalArgumentException("Value is below absolute zero");
        }

        this.fahrenheit = fahrenheit;
    }

    public double getCelsius() {
        return (fahrenheit - 32) * 5.0 / 9.0;
    }

    public void setCelsius(double celsius) {
        double fahrenheit = celsius * 9.0 / 5.0 + 32;
        setFahrenheit(fahrenheit);
    }

}
```

There's a great detailed discussion that provides additional perspective on [Stack Overflow](http://stackoverflow.com/questions/1568091/why-use-getters-and-setters).

### Static Fields

A **static field** is a field that is declared with the `static` keyword. We have encountered the `static` keyword used with both fields and methods, but since this discussion is focused on data, let's only discuss static fields for now.

### Properties

A **property** in Java is a characteristic that users can set. Most often, properties will be fields that have public setters, though they need not have a corresponding field. An example of a property that doesn't directly correspond to a field would be adding a celsius property to the `Temperature` class described above:

```java
public double getCelsius() {
    return (fahrenheit - 32) * 5.0 / 9.0;
}

public void setCelsius(double celsius) {
    double fahrenheit = celsius * 9.0 / 5.0 + 32;
    setFahrenheit(fahrenheit);
}
```

Since there's a link between Fahrenheit and celsius, we want to make sure that when one is updated, so is the other. In this case, we only store one field value (`fahrenheit`) and make the appropriate calculations when getting or setting the celsius property.

<aside class="aside-note" markdown="1">
There are slight variations among Java developers when it comes to colloquial usage of the term "property". People will sometimes define the term in a slightly more specific way, to mean a private field with public getters and setters.

Our definition here relies on the more general definition given by Oracle.
</aside>

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


## References

- [Encapsulation (wikipedia.org)](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming))
- [Initializing Fields](http://docs.oracle.com/javase/tutorial/java/javaOO/initial.html)
- [Controlling Access to Members of a Class (docs.oracle.com)][access-modifiers]

[access-modifiers]: https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html
