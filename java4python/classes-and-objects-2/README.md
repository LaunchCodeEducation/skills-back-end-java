---
title: 'Classes and Objects: Digging Deeper'
currentMenu: java4python
---

## Polymorphism

TODO

### Interfaces

Let's turn our attention to making a list of fractions sortable by the standard Java sorting method `Collections.sort`. In Python all we would need to do is implement the `__cmp__` method. But in Java we cannot be that informal. In Java Things that are sortable must be `Comparable`. Your first thought might be that `Comparable` is Superclass of `Number`. That would be a good thought but it would not be correct. Java only supports single inheritance, that is, a class can have only one parent. Although it would be possible to add an additional Layer to the class hierarchy it would also complicate things dramatically. Because Not only are Numbers comparable, but Strings are also Comparable as would many other types. For example we might have a `Student` class and we want to be able to sort Students by their gpa. But `Student` already extends the class `Person` for which we have no natural comparison function.

Java’s answer to this problem is the `Interface` mechanism. Interfaces are like a combination of Inheritance and contracts all rolled into one. An interface is a *specification* that says any object that claims it implements this interface must provide the following methods. It sounds a little bit like an abstract class, however it is outside the inheritance mechanism. You can never create an instance of `Comparable`. Many objects, however, do implement the `Comparable` interface. What does the Comparable interface specify?

The `Comparable` interface says that any object that claims to be `Comparable` must implement the `compareTo` method. To see what this entails, hop over the official Java documentation to read the introduction and Method Detail sections of the `Comparable` interface.

> *READ:* [`Comparable` Interfact documentation](https://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html) (Introduction and `compareTo` Method Detail sections only)

To make our `Fraction` class `Comparable` we must modify the class declaration line as follows:

```java
// Java
public class Fraction extends Number implements Comparable<Fraction> {
    ...
}
```

The specification `Comparable<Fraction>` makes it clear that Fraction is only comparable with another Fraction. The `compareTo` method could be implemented as follows:

```java
// Java
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
# Python
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
// Java
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
// Java
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
// Java
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
- [Controlling Access to Members of a Class (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html)
