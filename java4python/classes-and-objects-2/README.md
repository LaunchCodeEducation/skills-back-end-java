---
title: 'Classes and Objects: Digging Deeper'
currentMenu: java4python
---

## Polymorphism

We now introduce the final of the three pillars of object-oriented programming: **polymorphism**. Briefly stated, this is the ability of an object to take different forms.

Let's illustrate this with a simple example. Recall the [inheritance example](../classes-and-objects-1/#inheritance) from the last section, where `HouseCat` extended `Cat` (or, phrased differently, `HouseCat` subclassed `Cat`). We described this colloquially by saying that a `HouseCat` *is a* `Cat`. Java allows us to use this *is-a* relationship in the form of a variable or paremeter declaration:

```java
Cat suki = new HouseCat();
```

Here we have a variable of type `Cat` that holds an object of type `HouseCat`. Since a `HouseCat` *is a* `Cat`, this is legal. This is **polymorhpism** via inheritance. Let's observe a few details about how this plays out in different situations.

The variable `suki` is of type `Cat` even though the object that is stores is really a `HouseCat`. This means that if `HouseCat` has any methods that `Cat` does not -- for example, `HouseCat.satisfied()` -- then trying to call `suki.satisfied()` will result in a compiler error. This is because the `satisfied` method belongs to `HouseCats` and the compiler views `suki` strictly as a `Cat`.

If we are in such a situation and need to use such a method, and we are absolutely sure that the object being held by the variable is really an instance of a subclass, we can **cast** it to that type:
```java
((HouseCat) suki).satisfied();
```
The syntax `(HouseCat) suki` attemps to convert `suki` from something of type `Cat` to something of type `HouseCat`. If this isn't possible -- say, `suki` really isn't a `HouseCat` -- then we won't know until we run our program. The Java compiler will not catch such errors; they result in a runtime exception.

We can also use polymorphism in declaring and using method parameters. Suppose we had a class `Veterinarian` that could `inspect` all types of cats (house cats, wild cats, etc). We could declare this method using a parameter of type `Cat`, but still pass in a parmeter of type `HouseCat`:

```java

// In the Veterinarian class
public void inspect(Cat cat) {
    // vet inspects the cat
}
```

And later on:

```java
Veterinarian vet = new Veterinarian();
HouseCat suki = new HouseCat();
vet.inspect(suki);
```

Since `suki` *is a* `Cat`, this is perfectly acceptable. Note that even if we pass in a `HouseCat` to the `inspect` method, within that method we can only use methods on the parameter `cat` that belong to the `Cat` class, since that is the type of the parameter.

In Python, there are examples of polymorphic behavior, but they differ drastically from the examples discussed here. Our discussion of polymorphism in Java is heavily dependent on the fact that Java is statically-typed, and thus the compiler enforces most type-based rules.

### Interfaces

There is one more way that polymorphism manifests itself in Java. Exploring this additional form of polymorphism, and the new construction that makes it possible, is the subject of this section.

Let's recall our running `Fraction` example from the last section, and turn our attention to making a list of fractions sortable by the standard Java sorting method `Collections.sort`. In Python all we would need to do is implement the `__cmp__` method. But in Java we cannot be that informal. In Java, things that are sortable must be `Comparable`.

Your first thought might be that `Comparable` is Superclass of `Number`. That would be a good thought, but it would not be correct. Java only supports single inheritance, that is, a class can have only one parent. Although it would be possible to add an additional Layer to the class hierarchy it would also complicate things dramatically. Because not only are Numbers comparable, but strings are also comparable, as should be many other types. For example, we might have a `Student` class that we want to be able to sort by GPA. However, `Student` might extend a class `Person` for which we have no natural comparison function.

Java’s answer to this problem is the `interface` mechanism. An interface is a *specification* that provides a contract around a set of method signatures. Any class that claimes to *implement* an interface must provide the actual code to implement each of the specified method signatures. Instances of the implementing class can then be assumed to have each of the methods laid out in the interface.

So far, this sounds a little bit like an abstract class, however it is outside the inheritance mechanism.

Here's an example of how we can define an interface. In this case, the interface is a specification on how one might search for a string within a class.

```java
public interface Searchable {

    // Method signatures, for example:
    public Boolean contains(String searchTerm);

}
```

For a class to implement this interface, it would use the syntax:

```java
public class Document implements Searchable {

    // class-specific methods and properties

    public Boolean contains(String searchTerm) {
        // actual implementation code for the interface, must return a Boolean
    }
}
```

Note that:
1. We only provide a *signature* for methods in an interface. The line specifying a method does not contain braces, or any body, and ends in a semicolon.
1. In contrast to an abstract class, an interface *may not* provide implementation behavior for a method.
1. We can not create instances of on interface with the `new` keyword.
1. Interfaces define a type, so we can, howewever, create variables and properties of an interface type:
    ```java
    Searchable searchableThing = new Document();
    ```
    Most often, however, we would use this form of polymorphism in defining a method. If we had a method that could search for a string in each of a list of objects, we could define it by:
    ```java
    public Boolean eachContains(ArrayList<Searchable> searchableItems, String searchTerm) {
        for (Searchable item : searchableItems) {
            if (!item.contains(searchTerm)) {
                // If any one item does not contain the searchTerm, return false
                return false;
            }
        }

        // if we've gotten this far, all items contain the searchTerm
        return true;
    }
    ```
    Notice that all we need to know about each item in the list is that it is `Searchable`, that is, it implements the `contains` method of the `Searchable` interface.
1. The actual behavior for `contains` (and *all* methods in the interface) must be specified by each class implementing the interface.
1. A class that implements an interface may contain additional properties and methods that are not part of the interface.
1. A class may still extend another class while implementing an interface. For example:
    ```java
    public class HtmlDocument extends WebDocument implements Searchable {
        // ...
    }
    ```

<aside class="aside-pro-tip" markdown="1">Interfaces may also define constants (i.e. properties with both `static` and `final` keywords), as well as ([as of Java 8](http://www.journaldev.com/2752/java-8-interface-changes-static-method-default-method)) static and default methods. We won't explore these here.
</aside>

Coming back to our discussion of `Comparable`, since it is an interface, you can never create an instance of `Comparable`. Many objects, however, do implement the `Comparable` interface. What does the Comparable interface specify?

The `Comparable` interface says that any object that claims to be `Comparable` must implement the `compareTo` method. To see what this entails, hop over the official Java documentation to read the introduction and Method Detail sections of the `Comparable` interface.

> *READ:* [`Comparable` Interface documentation](https://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html) (Introduction and `compareTo` Method Detail sections only)

To make our `Fraction` class `Comparable` we must modify the class declaration line as follows:

```java
public class Fraction extends Number implements Comparable<Fraction> {
    ...
}
```

The specification `Comparable<Fraction>` makes it clear that Fraction is only comparable with another Fraction. The `compareTo` method could be implemented as follows:

```java
public int compareTo(Fraction other) {
    Integer num1 = this.numerator * other.getDenominator();
    Integer num2 = this.denominator * other.getNumerator();
    return num1 - num2;
}
```

## Statics

### Static Properties

Thus far, we have been declaring properties within a class in such a way that when we create instances of a class, each object has it's own separate "copy" of those properties.

However, using the `static` keyword in Java, we can declare properties within a class that *belong to the class* rather than to each instance of the class. In other words, each object created from the class will share static properties.

Let's compare Python and Java to illustrate this concept. Suppose that you wanted to write a `Student` class with the functionality that the class could keep track of the number of students it had created. Although you could do this with a global counter variable, that is an ugly solution. The right way to do it is to use a static variable. In Python we could do this as follows:

```python
class Student:
    numStudents = 0

    def __init__(self, id, name):
        self.id = id
        self.name = name

        Student.numStudents = Student.numStudents + 1

def main():
    for i in range(10):
        s = Student(i,"Student-"+str(i))
    print 'The number of students is: ', Student.numStudents

if __name__ == '__main__':
    main()
```

In Java we would write this same example using a static declaration.

```java
public class Student {

    public static Integer numStudents = 0;

    private int id;
    private String name;

    public Student(Integer id, String name) {
        this.id = id;
        this.name = name;

        numStudents = numStudents + 1;
    }

    public static void main(String[] args) {
        for(Integer i = 0; i < 10; i++) {
            Student s = new Student(i,"Student"+i.toString());
        }
        System.out.println("The number of students: "+Student.numStudents.toString());
    }
}
```

In this example notice that we create a static property by using the static modifier on the property declaration. Once a property has been declared `static` in Java it can be accessed from inside the class without prefixing the name of the class as we had to do in Python.

Static properties are also sometimes called **class properties**, in opposition to member, or instance, properties.

### Static Methods

Static methods are methods declared to be `static`, which only access local variables and static properties. That is, they do not use instance properties.

We have already discussed the most common static method of all, `main`. However, in our `Fraction` class we also implemented a method to calculate the greatest common divisor for two fractions (`gcd`). This method doesn't need to access any data that is specific to any one instance of the `Fraction` class. It simply takes two integers, computing and returning the corresponding result. Therefore, we declare the method to be a `static` method of the class. Furthermore, since we are only going to use this `gcd` method for our own purposes we can make it `private`.

```java
private static Integer gcd(Integer m, Integer n) {
    while (m % n != 0) {
        Integer oldm = m;
        Integer oldn = n;
        m = oldn;
        n = oldm%oldn;
    }
    return n;
}
```

## Full Implementation of the Fraction Class

A final version of the Fraction class that exercises all of the features we have discussed is as follows:

```java
import java.util.ArrayList;
import java.util.Collections;

public class Fraction extends Number implements Comparable<Fraction> {

    private Integer numerator;
    private Integer denominator;

    /** Creates a new instance of Fraction */
    public Fraction(Integer num, Integer den) {
        this.numerator = num;
        this.denominator = den;
    }

    public Fraction(Integer num) {
        this.numerator = num;
        this.denominator = 1;
    }

    public Fraction add(Fraction other) {
        Integer newNum = other.getDenominator()*this.numerator + this.denominator*other.getNumerator();
        Integer newDen = this.denominator * other.getDenominator();
        Integer common = gcd(newNum,newDen);
        return new Fraction(newNum/common, newDen/common );
    }

    public Fraction add(Integer other) {
        return add(new Fraction(other));
    }

    public Integer getNumerator() {
        return numerator;
    }

    public void setNumerator(Integer numerator) {
        this.numerator = numerator;
    }

    public Integer getDenominator() {
        return denominator;
    }

    public void setDenominator(Integer denominator) {
        this.denominator = denominator;
    }

    public String toString() {
        return numerator.toString() + "/" + denominator.toString();
    }

    public boolean equals(Fraction other) {
        Integer num1 = this.numerator * other.getDenominator();
        Integer num2 = this.denominator * other.getNumerator();
        if (num1 == num2)
            return true;
        else
            return false;
    }

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

    public int compareTo(Fraction other) {
        Integer num1 = this.numerator * other.getDenominator();
        Integer num2 = this.denominator * other.getNumerator();
        return num1 - num2;
    }

    private static Integer gcd(Integer m, Integer n) {
        while (m % n != 0) {
            Integer oldm = m;
            Integer oldn = n;
            m = oldn;
            n = oldm%oldn;
        }
        return n;
    }

    public static void main(String[] args) {
        Fraction f1 = new Fraction(1,2);
        Fraction f2 = new Fraction(2,3);
        Fraction f3 = new Fraction(1,4);

        System.out.println(f1.add(1));
        System.out.println(f1.intValue());
        System.out.println(f1.doubleValue());

        ArrayList<Fraction> myFracs = new ArrayList<Fraction>();
        myFracs.add(f1);
        myFracs.add(f2);
        myFracs.add(f3);
        Collections.sort(myFracs);

        for(Fraction f : myFracs) {
            System.out.println(f);
        }
    }

}
```

## References

- [Polymorphism (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/IandI/polymorphism.html)
- [Interfaces (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/createinterface.html)
- [Controlling Access to Members of a Class (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html)
