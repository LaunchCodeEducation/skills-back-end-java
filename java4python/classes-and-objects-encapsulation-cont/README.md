---
title: 'Classes and Objects: Encapsulation'
currentMenu: java4python
---

## The Full Point Class in Java

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

    public double computeDistanceFromOrigin() {
        return Math.sqrt((x*x + y*y));
    }

    public Point computeMidpoint(Point p) {

        double midpointX = (x + p.getX()) / 2;
        double midpointY = (y + p.getY()) / 2;

        return new Point(midpointX, midpointY);
    }

    public String toString() {
        return "x=" + x + ", y=" + y;
    }
}
```

<aside class="aside-note" markdown="1">
We've changed the names of a couple of methods here, to better matched best-practice naming conventions in the Java world. Generally, methods names should be descriptive and should start with a verb. Thus, `computeDistanceFromOrigin` improves on `distanceFromOrigin` and `computeMidpoint` improves on `halfway`.
</aside>

### Methods

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

#### The toString Method

### Static Fields and Methods

## Designing Classes

We've introduced a lot of ideas in these two lessons

- what data is needed? should any data fields be static?
- what behaviors are needed? internally and externally?
- who should be able to access what?
- how should your class be initialized? are there different use cases?
