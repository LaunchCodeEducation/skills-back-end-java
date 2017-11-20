---
title: 'Classes and Objects: Encapsulating Data'
currentMenu: java4python
---

In this lesson we begin our discussion of encapsulation, focusing on data fields of classes.

## Encapsulation

From our [Glossary](../../glossary/), here's a definition of encapsulation:

<aside class="aside-definition" markdown="1">
**encapsulation:** The bundling of related data and behaviors that operate on that data, usually with restricted access to internal, non-public data and behaviors. In object-oriented programming, encapsulation is achieved through the use of objects.
</aside>

In other words, classes and objects allow us to encapsulate, or isolate, data and behavior to only the parts of our program to which they are relevant. And the concept of restricted access allows us to expose only that data and behavior that we want others to be able to use.

We'll introduce data-related concepts in this lesson by gradually building up a solid example of a class, `Student`, that represents a student.


## Fields

We previously defined a **field** as a variable, or piece of data, that belongs to a class. For our `Student` class, let's think about the data that is typically associated with a student (in the sense of a high school or college student). There are a lot of possibilities, but here are the most important:

- Name
- Student ID
- Number of credits
- GPA

In order to declare these fields within our class, we'll need to determine the best data type for each. A field may be of any primitive or object type. In this case, the following types will work best:

- Name: `String`
- Student ID: `int`
- Number of credits: `int`
- GPA: `double`

Let's put these inside of a class. While they may be declared anywhere within a class, fields should always be declared at the top of the class. When we're ready to add methods, we'll add them below the fields.

```java
public class Student {

    String name;
    int studentId;
    int numberOfCredits;
    double gpa;

}
```

Like variables within a method, fields may be initialized when they are declared. For example, we could provide default values for `numberOfCredits` and `gpa` (default values for `name` and `studentId` don't make sense since they should be different for each student).

```java
int numberOfCredits = 0;
double gpa = 0.0;
```

Fields are also referred to as **instance variables**, since they belong to an instance of a class. In other words, each object will have its own copy of each instance variable.

### Getters and Setters

As declared, our four fields are package-private, which means that they can be read or changed by any code within the same package. As a rule-of-thumb, **fields should always be private unless you have a very, very, very good reason to not make them so.** Understanding why this is the case is the goal of this section. First though, let's make our fields private.

```java
public class Student {

    private String name;
    private int studentId;
    private int numberOfCredits;
    private double gpa;

}
```

In order to provide access to private fields, **getter and setter methods** are used. Getters and setters do what you might guess: get and set a given field. If we make the getter and/or setter method for a given property public, then others will be able to access or modify the field in that way.

Here is a getter/setter pair for `name` (you can imagine how the others would be written).

```java
public String getName() {
    return name;
}

public void setName(String aName) {
    name = aName;
}
```

As always, we follow [Java naming conventions](../naming-conventions/).

<aside class="aside-note" markdown="1">
Prefixing a parameter that is intended to set an instance variable with `a` is a relatively common convention, and one that we'll adopt to avoid shadowing and having to use `this` in our setters. You can think of the `a` as denoting the "argument" version of the variable.
</aside>

An astute question to ask at this point would be, "Why make the fields private if you're just going to allow people to get and set them anyway!?" Great question. There are lots of reasons to use getters and setters to control access. Here are just a few:

1. Sometimes you'll want to implement behavior that happens every time a field is accessed (get) or changed (set). Even if you can't think of such a reason when writing your class, you might later have the need to add such behavior. If you don't use getters and setters, you'll have to do a lot more refactoring if you ever decide to add such behaviors.
2. You can perform validation within a setter. For example, we might want to ensure that a student's name contains only certain characters, or that their student ID is positive.
3. You can use different access modifiers on getters and setters for the same field, based on desired usage. For example, you might want to allow anyone to be able to read the value of a field, but only classes within the same package to modify it. You could do this with a public getter and a package-private setter, but not as a field without getters and setters, which could only be public to everyone or package-private to everyone.

<aside class="aside-question" markdown="1">
One of the four fields in our `Student` class is a prime candidate for the scenario described in item 3. Which one do you think it is?
</aside>

As an example of reason 2, let's take a short detour to look at a `Temperature` class. A valid temperature can only be so low ("absolute zero"), so we wouldn't want to allow somebody to set an invalid value. In `setFahrenheit` we throw an exception if an invalid value is provided (we'll cover exceptions in detail later, but for now note that they are ways of signaling errors).

```java
public class Temperature {

    private double fahrenheit;

    public double getFahrenheit() {
        return fahrenheit;
    }

    public void setFahrenheit(double aFahrenheit) {

        double absoluteZeroFahrenheit = -459.67;

        if (aFahrenheit < absoluteZeroFahrenheit) {
            throw new IllegalArgumentException("Value is below absolute zero");
        }

        fahrenheit = aFahrenheit;
    }
}
```

There's a nice, detailed discussion that provides additional perspective on why we should use getters and setters on [Stack Overflow](http://stackoverflow.com/questions/1568091/why-use-getters-and-setters).

<aside class="aside-warning" markdown="1">
When writing getters and setters, the convention for a field named `field` is to name them `getField` and `setField`. This is more than just a convention, as some libraries you use will *expect* names to be of this format, and won't work as desired if you don't follow the convention.

Additionally, it's a standard convention to use `is` instead of `get` for boolean fields. So a boolean field `oldEnoughToVote` would have the "getter" method `isOldEnoughToVote`. The setter should still be named `setOldEnoughToVote`.
</aside>

### Properties

A **property** in Java is a characteristic that users can set. Our `Student` class had properties `name`, `studentId`, `numberOfCredits`, and `gpa`, while our `Temperature` class had only one property, `fahrenheit`.

Most often, properties will be fields that have public setters, though they need not have a corresponding field. Let's look at an example of a property that doesn't directly correspond to a field. If we wanted to add a `celsius` property to the `Temperature` class above, we might do it as follows:

```java
public double getCelsius() {
    return (fahrenheit - 32) * 5.0 / 9.0;
}

public void setCelsius(double celsius) {
    double fahrenheit = celsius * 9.0 / 5.0 + 32;
    setFahrenheit(fahrenheit);
}
```

Since there's a link between Fahrenheit and celsius, we want to make sure that when one is updated, so is the other. In this case, we only store one field value (`fahrenheit`) and make the appropriate calculation when getting or setting the celsius property.

<aside class="aside-note" markdown="1">
There are slight variations among Java developers when it comes to colloquial usage of the term "property". People will sometimes define the term in a slightly more specific or narrow way, to mean a private field with public getters and setters.

Our definition here relies on the more general definition given by Oracle.
</aside>

## Constructors

We'll often want to initialize, or set the initial value of, some of our fields when creating a new object from a class. **Constructors** allow for such initialization behavior to occur. We have been using constructor syntax in our lessons, but we haven't yet seen how to create constructors for our own classes. For example, we created new `ArrayList` objects using the `new` keyword along with the `ArrayList` constructor:

```java
ArrayList<String> myList = new ArrayList<>();
```

In Java, constructors have the same name as the class and are most often declared public (though they can have any other valid access modifier). They are declared **without a return type**. Any function that is named the same as the class and has no return type is a constructor.

Here is an example of a constructor definition within the `HelloWorld` class:

```java
public class HelloWorld {

    private String message = "Hello World";

    public HelloWorld(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String aMessage) {
        message = aMessage;
    }

}
```

This constructor allows us to create `HelloWorld` objects with custom messages. The assignment `this.message = message` assigns the value passed into the constructor to the field `message`. Here's how we might use it:

```java
HelloWorld goodbye = new HelloWorld("Goodbye World");
System.out.println(goodbye.getMessage()); // prints "Goodbye World"
```

<aside class="aside-warning" markdown="1">
It's not required that every class have a constructor. If you don't provide one, the Java compiler will generate an "empty" constructor for you, known as a **default constructor**. For example, when we left out a constructor in our `HelloWorld` class above, the compiler created the following constructor for us:

```java
public HelloWorld() {}
```

While this can be convenient, you almost always want to provide a constructor to properly initialize your objects.

</aside>

### Overloading Constructors

We can provide multiple constructors for a given class in order to allow for different initialization scenarios. This is known as **constructor overloading**. When providing multiple constructors, we must ensure that each has a different collection of arguments, as determined by the number, order, and type of the constructor arguments.

Let's expand upon our `Student` class.

```java
public class Student {

    private String name;
    private final int studentId;
    private int numberOfCredits;
    private double gpa;

    public Student(String name, int studentId,
            int numberOfCredits, double gpa) {
        this.name = name;
        this.studentId = studentId;
        this.numberOfCredits = numberOfCredits;
        this.gpa = gpa;
    }

    public Student(String name, int studentId) {
        this.name = name;
        this.studentId = studentId;
        this.numberOfCredits = 0;
        this.gpa = 0.0;
    }

    /* getters and setters omitted */

}
```

The first constructor allows for the creation of `Student` objects where the code creating the object provides initial values for each of the fields. The second allows for the creation of `Student` objects with only `name` and `studentId`. The first constructor would be most useful for creating a transfer student, where credits and a GPA might already be non-zero. However, for all new students, it would be safe to initialize `numberOfCredits` and `gpa` to be 0.

A better way to write the above constructors would be this:

```java
public class Student {

    private String name;
    private final int studentId;
    private int numberOfCredits;
    private double gpa;

    public Student(String name, int studentId,
            int numberOfCredits, double gpa) {
        this.name = name;
        this.studentId = studentId;
        this.numberOfCredits = numberOfCredits;
        this.gpa = gpa;
    }

    public Student(String name, int studentId) {
        this(name, studentId, 0, 0);
    }

    /* getters and setters omitted */

}
```

Here, we use `this()` to invoke another constructor within the same class. In this case, the second constructor calls the first with the "default" values for `numberOfCredits` and `gpa`. If you use this syntax, the call to `this()` must be the first line in the constructor. This is a good practice not only because it makes your code shorter, but also because it allows any initialization behavior that may be carried out beyond just initializing variables to be contained in a smaller number of constructors. In other words, constructors can "share" initialization code. Notice from this example that a constructor doesn't need to require an initial value for each field as an argument.

<aside class="aside-pro-tip" markdown="1">
When defining constructors, think about:
1. Which fields must be initialized for your class to work properly? Be sure you initialize every such field.
1. Which fields should be initialized by the user creating an object, and which should be initialized by the class itself?
1. What are the use-cases for your class that you should provide for?
</aside>

## Customizing Fields

There are several ways that we can configure fields based on their intended use. We'll explore some of these now.

### Final Fields

A **final field** is one that can not be changed once it is initialized. This means slightly different things for primitive and class types. We create final fields by declaring them with the `final` keyword.

**Final primitive fields** can not change their value once they are initialized.

**Final object fields** may not change the object that they hold once they are initialized. However, that object itself my change.

Here are some examples to illustrate. Each class would be in its own file, but we present them side-by-side for convenience. Additionally, we declare each field public to more clearly demonstrate where compiler errors would occur, and minimize example code.

```java
public class FortyTwo {

    public int intValue = 42;

}

public class FinalFields {

    public final int intValue = 42;
    public final double doubleValue;
    public final FortyTwo objectValue = new FortyTwo();

    public static void main(String[] args) {

        FinalFields demo = new FinalFields();

        // This would result in a compiler error
        demo.intValue = 6;

        // This is allowed since we haven't initialized doubleValue yet
        demo.doubleValue = 42.0;

        // However, this would result in a compiler error
        demo.doubleValue = 6.0;

        // This would result in a compiler error, since we're trying to
        // give objectValue a different object value
        demo.objectValue = new FortyTwo();

        // However, this is allowed since we're changing a field
        // inside the final object, and not changing which object
        // objectValue refers to
        demo.objectValue.intValue = 6;
    }
}
```

Final fields can be confusing at first. If you've encountered references, or pointers, in your programming journey, then final fields might make more sense if you know that an object field actually holds a pointer to an object, and not the object itself.

Note that a final field *may not* have a setter.

### Static Fields

A **static field** is a field that is declared with the `static` keyword. We have encountered the `static` keyword used with both fields and methods, but since this discussion is focused on data, let's only discuss static fields for now.

A static field is *shared by all instances of the class*. For example, in our `Temperature` class there is not a good reason that each `Temperature` object needs its own double `absoluteZeroFahrenheit`, since that value will not vary from class to class. Let's make it a static field.

```java
public class Temperature {

    private double fahrenheit;

    private static double absoluteZeroFahrenheit = -459.67;

    public double getFahrenheit() {
        return fahrenheit;
    }

    public void setFahrenheit(double aFahrenheit) {

        if (aFahrenheit < absoluteZeroFahrenheit) {
            throw new IllegalArgumentException("Value is below absolute zero");
        }

        fahrenheit = aFahrenheit;
    }

    /* rest of the class... */

}
```

There are multiple ways to refer to a static field.

```java
// Within the class, use it the same as a normal, non-static field
System.out.println("Absolute zero in F is: " + absoluteZeroFahrenheit);

// Also within the class, we can be more explicit
System.out.println("Absolute zero in F is: " + this.absoluteZeroFahrenheit);
```
```java
// Outside the class, if the field is public, we can do this
System.out.println("Absolute zero in F is: " + Temperature.absoluteZeroFahrenheit);

// Or if we have an object named temp of type Temperature
System.out.println("Absolute zero in F is: " + temp.absoluteZeroFahrenheit);
```

In the second code snippet, it is much more preferable to use the first technique, to make it explicit that the field you're using is static (this isn't clear in the bottom case).

</aside>

As another example, we might also provide a third constructor for our `Student` class above that only requires the student's name, since theoretically the `studentId` would (or could) be generated by the class itself.

```java
public class Student {

    private static int nextStudentId = 1;
    private String name;
    private final int studentId;
    private int numberOfCredits;
    private double gpa;

    public Student(String name, int studentId,
            int numberOfCredits, double gpa) {
        this.name = name;
        this.studentId = studentId;
        this.numberOfCredits = numberOfCredits;
        this.gpa = gpa;
    }

    public Student(String name, int studentId) {
        this(name, studentId, 0, 0);
    }

    public Student(String name) {
        this(name, nextStudentId);
        nextStudentId++;
    }

    /* getters and setters omitted */

}
```

Here, we add a static integer field that will keep track of the next student ID available to be assigned to a student. Then, our new constructor takes only a name, and assigns the student the next available value. This works because static fields are shared across all objects created from the `Student` class, so it functions as a counter of sorts for the number of `Student` objects created.

If this use of a unique integer ID seems familiar, then you're paying attention! It should remind you of our use of unique integer fields to mirror the role of a primary key for persistent objects, as seen in Unit 2. We'll use this approach--using a static counter to set a unique ID in the constructor--to generate such IDs for the time being. When we learn about working with object-relational mapping in Java, this will then become the responsibility of the database and ORM library.

### Constants

Unlike some other languages, Java doesn't have a special keyword to declare a constant (that is, unchangeable) variable. However, we can achieve the same net result using a combination of `static` and `final`.

```java
public class Constants {
    public static final double PI = 3.14159;
    public static final String FIRST_PRESIDENT = "George Washington";
}
```

Throughout the rest of this course, when we say "constant" we will mean "a static final variable".

There are a couple of notable things in this example:
- We use a different naming convention for constants than for other variables. Constants should be in all-caps, with an underscore to separate words.
- There is no strong reason to make constants private, as long as we initialize them where they are declared (so that somebody else doesn't give them a value first!). We'll generally make our constants public.

A good use of a constant can be seen in our `Temperature` class. Since absolute zero will never change, we can ensure that nobody ever changes it (perhaps by mistake, even) by adding `final` to make it a constant.

```java
public class Temperature {

    private double fahrenheit;

    public static final double ABSOLUTE_ZERO_FAHRENHEIT = -459.67;

    /* rest of the class... */

}
```

## References

- [Encapsulation (wikipedia.org)](https://en.wikipedia.org/wiki/Encapsulation_(computer_programming))
- [Declaring Member Variables (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/variables.html)
- [Initializing Fields (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/javaOO/initial.html)
- [Constructors (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/constructors.html)
