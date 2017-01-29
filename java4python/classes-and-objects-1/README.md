---
title: 'Classes and Objects: Basics'
currentMenu: java4python
---

Thus far, we have primarily been examining features of Java that are procedural in nature. Where we have used classes and objects, they have been provided from core Java packages. In this section, we explore some object-oriented concepts in Java.

In the process, we will introduce the **Three Pillars of Object-Oriented Programming: polymorphism, inheritance, and encapsulation (PIE)**.

## Encapsulation: Classes in Java

You have already seen how to define classes in Java; it's unavoidable for even the simplest of programs. However, we have only utlized the most minimal class structure.

In this section we will look at how we define classes to create our own data types, along with exploring new class contructs. Some of these will mirror Pythonc constructs, while others will be new.

Let's start by creating a fraction class to extend the set of numeric data types provided by our language. The requirements for this new data type are as follows:

- Given a numerator and a denominator create a new Fraction.
- When a fraction is printed it should be simplified.
- Two fractions can be added or subtracted
- Two fractions can be multiplied or divided
- Two fractions can be compared
- A fraction and an integer can be added together.
- Given a list of Fractions that list should be sortable by the default sorting function.

Here is a mostly complete implementation of a `Fraction` class in Python that we will refer to throughout this section:

```python
# Python
class Fraction:

    def __init__(self,top,bottom):

        # the numerator is on top of a fraction
        self.num = top

        # the denominator is on the bottom of a fraction
        self.den = bottom


    def __repr__(self):
        if self.num > self.den:
            retWhole = self.num / self.den
            retNum = self.num - (retWhole * self.den)
            return str(retWhole) + " " + str(retNum)+"/"+str(self.den)
        else:
            return str(self.num)+"/"+str(self.den)

    def show(self):
        print self.num,"/",self.den

    def __add__(self,otherfraction):
        # convert to a fraction
        otherfraction = self.toFract(otherfraction)

        newnum = self.num*otherfraction.den + self.den*otherfraction.num
        newden = self.den * otherfraction.den

        common = gcd(newnum,newden)

        return Fraction(newnum/common,newden/common)

    def __radd__(self,leftNum):
        otherfraction = self.toFract(leftNum)
        newnum = self.num*otherfraction.den + self.den*otherfraction.num
        newden = self.den * otherfraction.den

        common = gcd(newnum,newden)

        return Fraction(newnum/common,newden/common)

    def __cmp__(self,otherfraction):

        num1 = self.num*otherfraction.den
        num2 = self.den*otherfraction.num

        if num1 < num2:
           return -1
        else:
           if num1 == num2:
              return 0
           else:
              return 1

    def toFract(self,n):
        if isinstance(n,int):
            otherfraction = Fraction(n,1)
        elif isinstance(n, float):
            wholePart = int(n)
            fracPart = n - wholePart
            # convert to 100ths???
            fracNum = int(fracPart * 100)
            newNum = wholePart * 100 + fracNum
            otherfraction = Fraction(newNum,100)
        elif isinstance(n,Fraction):
            otherfraction = n
        else:
            print "Error: cannot add a fraction to a ", type(n)
            return None
        return otherfraction

#gcd is a helper function for Fraction
def gcd(m,n):
    while m%n != 0:
        oldm = m
        oldn = n

        m = oldn
        n = oldm%oldn

    return n
```

The **properties** we will need for our `Fraction` class are the numerator and denominator. In Python we can add instance variables to a class at any time by simply assigning a value to `object_reference.variable_name`. This can be done anywhere within a Python class. In Java all properties must be declared outside of all methods.

The declarations of properties can come at the beginning of the class definition or the end. We recommend that you delcare your properties at the top of your classes. With that in mind, the first part of the `Fraction` class definition is as follows:

```java
// Java
public class Fraction {
    private Integer numerator;
    private Integer denominator;
}
```

Notice that we have declared the numerator and denominator to be private. This means that the compiler will generate an error if another class tries to access them:

```java
// Java
Fraction f = new Fraction(1,2);
Integer y = f.numerator * 10;
```

### Getters and Setters

Direct access to private properties is not allowed. Additionally, best practices dictate that if we legitimately want to be able to access information from another class, we should keep such properties private and provide what are referred to as **getter and setter methods**. Getters and setters do what you might guess: get and set a given property. If we make the getter and/or setter public for a given property, then others will be able to access it in that way.

Here are public getter and setter methods for numerator and denominator:

```java
// Java
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
```

> *NOTE:* Can you think of a good reason why access to instance properties should be wrapped by methods?

### Constructors

Once you have identified the instance variables for you class the next thing to consider is the constructor. In Java, constructors have the same name as the class and are declared public. They are declared without a return type. So any function that is named the same as the class and has no return type is a constructor. Our constructor will take two parameters the numerator and the denominator.

```java
// Java
public Fraction(Integer top, Integer bottom) {
    num = top;
    den = bottom;
}
```

There are a couple of important things to notice here. First, you will notice that the constructor does not have a self parameter. You will also notice that we can simply refer to the instance variables by name without the self prefix, because they have already been declared. This allows the Java compiler to do the work of dereferencing the current Java object. Java does provide a special variable called `this` that works like the self variable. In Java, `this` is typically only used when it is needed to differentiate between a parameter or local variable and an instance variable. For example this alternate definition of the the Fraction constructor uses `this` to differentiate between parameters and instance variables.

```java
// Java
public Fraction(Integer num, Integer den) {
    this.num = num;
    this.den = den;
}
```

### Methods

Now we come to one of the major differences between Java and Python. The Python class definition used the special methods for addition, and comparison that have the effect of redefining how the standard operators behave. In Java there is **no operator overloading**. So we will have to write member functions to do addition, subtraction, multiplication, and division. Let's begin with addition.

```java
// Java
public Fraction add(Fraction otherFrac) {
    Integer newNum, newDen, common;

    newNum = otherFrac.getDenominator()*this.numerator +
                             this.denominator*otherFrac.getNumerator();
    newDen = this.denominator * otherFrac.getDenominator();
    common = gcd(newNum,newDen);
    return new Fraction(newNum/common, newDen/common );
}
```

First you will notice that the add member function is declared as `public Fraction` The `public` part means that any other method may call the add method. The `Fraction` part means that `add` will return a fraction as its result.

Second, you will notice that on line two all of the local variables used in the function are declared. In this case there are three local variables: `newNum`, `newDen`, and `common`. It is a good idea for you to get in the habit of declaring your local variables at the beginning of your function. This declaration section provides a simple road map for the function in terms of the data that will be used. The listing above also makes use of the `this` variable, you may find it useful to use `this` until you are comfortable with abandoning your Pythonic ideas about `self`.

Declaring your variables at the top is not a requirement, it is just a recommended practice for you. Java only requires that you declare your variables before they are used. The following version of Fraction is also legal Java, but may be somewhat less readable.

```java
// Java
public Fraction add(Fraction otherFrac) {
    Integer newNum = otherFrac.getDenominator()*numerator +
                             denominator*otherFrac.getNumerator();
    Integer newDen = denominator * otherFrac.getDenominator();
    Integer common = gcd(newNum,newDen);
    return new Fraction(newNum/common, newDen/common );
}
```

The addition takes place by multiplying each numerator by the opposite denominator before adding. This procedure ensures that we are adding two fractions with common denominators. Using this approach the denominator is computed by multiplying the two denominators. The greatest common divisor function is used to find a common divisor to simplify the numerator and denominator in the result.

Finally on line 8 a new fraction is returned as the result of the computation. The value that is returned by the return statement must match the value that is specified as part of the declaration. So, in this case the return value on line 8 must match the declared value on line 1.

#### Method Signatures and Overloading

Our specification for this project said that we need to be able to add a `Fraction` to an `Integer`. In Python we can do this by checking the type of the parameter using the `isinstance` function at runtime. Recall that `isinstance(1,int)` returns `True` to indicate that 1 is indeed an instance of the `int` class. See lines 22 and 53—68 of the Python version of the Fraction class to see how our Python implementation fulfills this requirement.

In Java we can do runtime type checking, but the compiler will not allow us to pass an Integer to the add function since the parameter has been declared to be a Fraction. The way that we solve this problem is by writing another `add` method with a different set of parameters. In Java this practice is legal and common we call this practice **overloading**.

This idea of overloading raises a very important difference between Python and Java. In Python a method is known by its name only. In Java a method is known by its signature. The signature of a method includes its name, and the types of all of its parameters. The name and the types of the parameters are enough information for the Java compiler to decide which method to call at runtime.

To solve the problem of adding an `Integer` and a `Fraction` in Java we will overload both the constructor and the add function. We will overload the constructor so that if it only receives a single `Integer` it will convert the `Integer` into a `Fraction`. We will also overload the add method so that if it receives an `Integer` as a parameter it first construct a `Fraction` from that integer and then add the two `Fractions` together. The new methods that accomplish this task are as follows:

```java
// Java
public Fraction(Integer num) {
    this.numerator = num;
    this.denominator = 1;
}

public Fraction add(Integer other) {
    return add(new Fraction(other));
}
```

Notice that the overloading approach can provide us with a certain elegance to our code. Rather than utilizing if statements to check the types of parameters we just overload functions ahead of time which allows us to call the method we want and allow the compiler to make the decisions for us. This way of thinking about programming takes some practice.

Our full Fraction class to this point would look like the following. You may want to try to compile and run the short test program provided just to see what happens.

### Encapsulation

The concept of **encapsulation** involves essentially what we've done in this section: bundling related data (properties) and behavior (methods) into a single object in a way that restricts direct outside access to the object's data.

## Inheritance

The notion of **inheritance** in Java is very similar as that in Python. One class may **extend** another class to inherit its properties and methods.

Recall that in Python the syntax for inheritance was the following:

```python
# Python
class Cat:
    # ...code for the Cat class...

class HouseCat(Cat):
    # ...code for the HouseCat class...
```

Any properties or methods in `Cat` would be available to each instance of `HouseCat`. We express the inheritance relationship in plain English by saying the a `HouseCat` *is a* `Cat`.

In Java, the syntax requires the `extends` keyword:

```java
// Java
public class Cat {
    // ...code for the Cat class...
}

public class HouseCat extends Cat {
    // ...code for the HouseCat class...
}
```

The only caveat and difference between Java and Python here is that in the Java example, `HouseCat` will not be able to use any `private` properties or methods of `Cat`.

> *NOTE:* So far we've seen `public` and `private` access modifiers. There are two other levels of access provided in Java aside from `public` and `private`. We won't cover them here, but they are `protected` and "package" or "default" (no keyword is provided for this level, as it's the default level). You may find them useful at times, and you may [read about them](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html) on your own.

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
// Java
public String toString() {
    return numerator.toString() + "/" + denominator.toString();
}
```

The other important class for us to implement from the list of methods inherited from `Object` is the `equals` method. When two objects are compared in Java using the `==` operator they are tested to see if they are exactly the same object, that is, do the two objects occupy the same exact space in the computer's memory. This is the default behavior of the `equals` method provided by `Object`. The `equals` method allows us to decide if two objects are equal by looking at their instance variables. However it is important to remember that since Java does not have operator overloading if you want to use your equals method you must call it directly.

Therefore, once you write your own `equals` method:

```java
// Java
object1 == object2
```

is NOT the same as

```java
// Java
object1.equals(object2)
```

Some built-in classes, such as `String`, provide their own implementation of `equals` with their own behavior that is appropriate to the given class. Consider this example:

```java
// Java
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
// Java
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
// Java
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
// Java
public void test(Number a, Number b) {
    a.add(b);
}
```

The Java compiler would give an error because `add` is not a defined method of the `Number` class. Even if you called the add method and passed two `Fractions` as parameters.

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

- [Encapsulation (wikipedia.org)](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming))
- [Inheritance (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/subclasses.html)
- [Using the keyword `super` (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/IandI/super.html)
- [Polymorphism (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/IandI/polymorphism.html)
- [Controlling Access to Members of a Class (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html)
