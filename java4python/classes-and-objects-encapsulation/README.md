---
title: 'Classes and Objects: Basics'
currentMenu: java4python
---

Thus far, we have primarily been examining features of Java that are procedural in nature. Where we have used classes and objects, they have been provided from core Java packages. In this section, we explore some object-oriented concepts in Java.

In the process, we will introduce the **Three Pillars of Object-Oriented Programming: polymorphism, inheritance, and encapsulation (PIE)**.

## Encapsulation: Classes in Java

You have already seen how to define classes in Java; it's unavoidable for even the simplest of programs. However, we have only utilized the most minimal class structure.

In this section we will look at how we define classes to create our own data types, along with exploring new class constructs. Some of these will mirror Python constructs, while others will be new.

From our [Glossary](../../glossary/), here's a definition of encapsulation:

<aside class="aside-definition" markdown="1">
**encapsulation:** The bundling of related data and behaviors that operate on that data, usually with restricted access to internal, non-public data and behaviors. In object-oriented programming, encapsulation is achieved through the use of objects.
</aside>

In other words, classes and objects allow us to encapsulate, or isolate, data and behavior to only the parts of our program to which they are relevant. As before, let's motivate our exploration of these concepts by looking at Python and Java examples side-by-side.

### The Point Class in Python

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

### The Point Class in Java

We'll explore building an equivalent class in Java, which will lead to many new concepts. You'll find that Java provides much more structure for building and customizing classes than Python.

First, let's look at the complete `Point` class:

```java
public class Point {

    private double x;
    private double y;

    public Point(double x, double y) {
        this.x = x;
        this.y = y;
    }

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

    public double distanceFromOrigin() {
        return Math.sqrt((x*x + y*y));
    }

    public Point halfway(Point p) {

        double midpointX = (x + p.getX()) / 2;
        double midpointY = (y + p.getY()) / 2;

        return new Point(midpointX, midpointY);
    }

    public String toString() {
        return "x=" + x + ", y=" + y;
    }

    public static void main(String[] args) {

        Point p1 = new Point(3,3);
        System.out.println(p1.toString());

        Point p2 = new Point(-2, 4);
        System.out.println(p2);

        System.out.println("p1 distance from origin: " + p1.distanceFromOrigin());

        System.out.println("midpoint of p1 and p2: " + p1.halfway(p2));
    }
}
```

### Fields and Properties

### Getters and Setters

Direct access to private properties is not allowed. Additionally, best practices dictate that if we legitimately want to be able to access information from another class, we should keep such properties private and provide what are referred to as **getter and setter methods**. Getters and setters do what you might guess: get and set a given property. If we make the getter and/or setter public for a given property, then others will be able to access it in that way.

http://stackoverflow.com/questions/1568091/why-use-getters-and-setters


<aside class="aside-note" markdown="1">
Can you think of a good reason why access to instance properties should be wrapped by methods?

Think about properties that might be linked by some relationship, such as `fahrenheit` and `celcius` properties on a `Temperature` object. What would ideally happen if we were to change the value of the `fahrenheit` property, and how might a setter method facilitate such behavior?
</aside>

### Constructors

Once you have identified the instance variables for you class the next thing to consider is the constructor. In Java, constructors have the same name as the class and are declared public. They are declared without a return type. So any function that is named the same as the class and has no return type is a constructor. Our constructor will take two parameters the numerator and the denominator.


### Methods

Now we come to one of the major differences between Java and Python. The Python class definition used the special methods for addition, and comparison that have the effect of redefining how the standard operators behave. In Java there is **no operator overloading**. So we will have to write member functions to do addition, subtraction, multiplication, and division. Let's begin with addition.

### Static Fields and Methods


## References

- [Encapsulation (wikipedia.org)](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming))
- [Using the keyword `super` (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/super.html)
- [Controlling Access to Members of a Class (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html)
