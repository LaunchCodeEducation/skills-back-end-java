---
title: 'Classes and Objects: Inheritence'
currentMenu: java4python
---

## Inheritance

The notion of **inheritance** in Java is very similar as that in Python. One class may **extend** another class to inherit its properties and methods.

Recall that in Python the syntax for inheritance was the following:

```python
class Cat:
    # ...code for the Cat class...

class HouseCat(Cat):
    # ...code for the HouseCat class...
```

Any properties or methods in `Cat` would be available to each instance of `HouseCat`. We express the inheritance relationship in plain English by saying the a `HouseCat` *is a* `Cat`.

In Java, the syntax requires the `extends` keyword:

```java
public class Cat {
    // ...code for the Cat class...
}

public class HouseCat extends Cat {
    // ...code for the HouseCat class...
}
```

The only caveat and difference between Java and Python here is that in the Java example, `HouseCat` will not be able to use any `private` properties or methods of `Cat`.

<aside class="aside-note" markdown="1">
So far we've seen `public` and `private` access modifiers. There are two other levels of access provided in Java aside from `public` and `private`. We won't cover them here, but they are `protected` and "package" or "default" (no keyword is provided for this level, as it's the default level). You may find them useful at times, and you may [read about them](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html) on your own.
</aside>

### Inheritance in the Fraction Class

Rather than create a class extending `Fraction`, we will see how `Fraction` itself already extends another class. And you'll get plenty of practice extending classes later on.

If you were to try to print a `Fraction` object (e.g. with `System.out.println(f)`) you would see that the output is not very satisfying. It would look something like this:

```nohighlight
Fraction@7b11a3ac
```

The reason is that we have not yet provided a friendly string representation for our `Fraction` objects. Just like in Python, whenever an object is printed by the `println` method it must be converted to string format. In Python you can control how that looks by writing an `__str__` method for your class. If you do not then you will get the default, which looked something like the above.

#### The Object Class

In Java, the equivalent of `__str__` is the `toString` method. Every object in Java already has a `toString` method defined for it because *every class in Java automatically inherits from the Object class*. The `Object` class provides default implementations for the following methods:

- `clone`
- `equals`
- `finalize`
- `getClass`
- `hashCode`
- `notify`
- `notifyAll`
- `toString`
- `wait`

We are not interested in most of the functions on that list, and many Java programmers live happy and productive lives without knowing much about most of the functions on that list. However, to make our output nicer we will implement the `toString` method for the `Fraction` class. A simple version of the method is provided below.

```java
public String toString() {
    return numerator.toString() + "/" + denominator.toString();
}
```

The other important class for us to implement from the list of methods inherited from `Object` is the `equals` method. When two objects are compared in Java using the `==` operator they are tested to see if they are exactly the same object, that is, do the two objects occupy the same exact space in the computer's memory. This is the default behavior of the `equals` method provided by `Object`. The `equals` method allows us to decide if two objects are equal by looking at their instance variables. However it is important to remember that since Java does not have operator overloading if you want to use your equals method you must call it directly.

Therefore, once you write your own `equals` method:

```java
object1 == object2
```

is NOT the same as

```java
object1.equals(object2)
```

Some built-in classes, such as `String`, provide their own implementation of `equals` with their own behavior that is appropriate to the given class. Consider this example:

```java
String string1 = new String("LaunchCode");
String string2 = new String("LaunchCode");

System.out.println(string1 == string2);
System.out.println(string1.equals(string2));
```

The first print statement prints `false` since `string1` and `string2` are different objects, and thus have different locations in memory. The second print statement prints `true` since the `equals` method implemented by `String` compares each string character by character.

Let's return to the `Fraction`. Here is an equals method for the `Fraction` class:

```java
public boolean equals(Fraction other) {
    Integer num1 = this.numerator * other.getDenominator();
    Integer num2 = this.denominator * other.getNumerator();
    if (num1 == num2)
        return true;
    else
        return false;
}
```

One important thing to remember about `equals` is that it only checks to see if two objects are equal it does not have any notion of less than or greater than. We’ll see more about that shortly.

#### Abstract Classes and Methods

If we want to make our `Fraction` class behave like `Integer`, `Double`, and the other numeric classes in Java We need to make a couple of additional modifications to the class. The first thing we will do is plug `Fraction` into the Java class hierarchy at the same place as Integer and its siblings. If you look at the documentation for Integer you will see that Integer’s parent class is `Number`. Number is an **abstract class** that specifies several methods that all of its children must implement. In Java an abstract class is more than just a placeholder for common functions. In Java an abstract class has the power to specify certain functions that all of its children **must** implement. You can trace this power back to the strong typing nature of Java.

The that makes the Fraction class a child of Number is as follows:

```java
public class Fraction extends Number {
    ...
}
```

The keyword extends tells the compiler that the class `Fraction` extends, or adds new functionality to the `Number` class. A child class always extends its parent.

The methods we must implement if `Fraction` is going to be a child of `Number` are:

- `longValue`
- `intValue`
- `floatValue`
- `doubleValue`

This really isn’t much work for us to implement these functions as all we have to do is some conversion of our own and some division. The implementation of these methods is as follows:

```java
public double doubleValue() {
    return numerator.doubleValue() / denominator.doubleValue();
}

public float floatValue() {
    return numerator.floatValue() / denominator.floatValue();
}

public int intValue() {
    return numerator.intValue() / denominator.intValue();
}

public long longValue() {
    return numerator.longValue() / denominator.longValue();
}
```

By having the `Fraction` class extend the `Number` class we can now pass a `Fraction` to any Java function that specifies it can receive a `Number` as one of its parameters. For example many Java user interface methods accept any object that is a subclass of `Number` as a parameter. In Java the class hierarchy and the IS-A relationships are very important. Whereas in Python you can pass any kind of object as a parameter to any function the strong typing of Java makes sure that you only pass an object as a parameter that is of the type specified in the function call or one of its children. So, in this case when you see a parameter of type `Number` its important to remember that an `Integer` *is-a* `Number` and a `Double` *is-a* `Number` and a `Fraction` *is-a* `Number`.

However, and this is a big however, it is also important to remember that if you specify `Number` as the type on a particular parameter then the Java compiler will only let you use the methods of a `Number`. In this case longValue, intValue, floatValue, and doubleValue.

Let's suppose you define a method in some class as follows:

```java
public void test(Number a, Number b) {
    a.add(b);
}
```

The Java compiler would give an error because `add` is not a defined method of the `Number` class. Even if you called the add method and passed two `Fractions` as parameters.

## References

- [Inheritance (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html)
