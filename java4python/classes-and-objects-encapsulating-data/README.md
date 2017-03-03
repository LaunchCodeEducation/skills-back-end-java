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

We'll introduce data-related concepts in this lesson by gradually building up an solid example of a class that represents a student, `Student`.

## Fields

We previously defined a **field** as a variable, or piece of data, that belongs to the class. For our `Student` class, let's think about the data that is typically associated with a student (in the sense of a high school or college student). There are a lot of possibilities, but here are probably the most important:

- Name
- Student ID
- Number of credits
- GPA

In order to declare these fields within our class, we'll need to determine the best data type for each. A field may be of any primitive or object type. In this case, the following types will work best:

- Name: `String`
- Student ID: `int`
- Number of credits: `int`
- GPA: `double`

Let's put these inside of a class. While they may be declared anywhere within a class, fields should always be declared at top of the class. When we're ready to add methods, we'll add them below.

```java
public class Student {

    String name;
    int studentId;
    int numberOfCredits;
    double Gpa;

}
```

Like variables within a method, fields may be initialized when they are declared. For example, we could provide default values for `numberOfCredits` and `Gpa` (default values for `name` and `studentId` don't make sense since they should be different for each student).

```java
int numberOfCredits = 0;
double Gpa = 0.0;
```

Fields are also referred to as **instance variables**, since they belong to an instance of a class.

### Getters and Setters

As declared, our four fields are package-private, which means that they can be read or changed by any code within the same package. As a rule-of-thumb, **fields should always be private unless you have a very, very, very good reason to not make them so.** Understanding why this is the case is the goal of this section. First though, let's make our fields private.

```java
public class Student {

    private String name;
    private int studentId;
    private int numberOfCredits;
    private double Gpa;

}
```

In order to provide access to private properties **getter and setter methods** are used. Getters and setters do what you might guess: get and set a given field. If we make the getter and/or setter public for a given property, then others will be able to access it in that way.

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
Preceding a local variable that is intended to set an instance variable with `a` is a relatively common convention, and one that we'll adopt to avoid shadowing and having to use `this` in our setters. You can think of the `a` as denoting the "argument" version of the variable.
</aside>

An astute question to ask at this point would be, "Why make the fields private if you're just going to allow people to get and set them anyway!?" Great question. There are lots of reasons to use getters and setters to control access. Here are just a few:

1. Sometimes you'll want to implement behavior that happens every time a field is accessed (get) or changed (set). Even if you can't think of such a reason when writing your class, you might later have the need to add such behavior. If you don't use getters and setters, you'll have to do a lot more refactoring at that point.
2. You can perform validation within a setter. For example, we might want to ensure that a student's name contains only certain characters, or that their student ID is a positive integer.
3. You can use different access modifiers on getters and setters for the same field, based on desired usage. For example, you might want to allow anyone to be able to read the value of a field, but only classes within the same package to modify it. You could do this with a public getter and a package-private setter, but not as a field without getters and setters, which could only be public to everyone or package-private to everyone.

<aside class="aside-question" markdown="1">
One of the four fields in our `Student` class is a prime candidate for the scenario described in item 3. Which one do you think it is?
</aside>

As an example of reason 2, let's take a short detour to look at a `Temperature` class. A valid temperature can only be so low ("absolute zero"), so we wouldn't want to allow somebody to set an invalid value. In `setFahrenheit` we thrown an exception if an invalid value is provided (we'll cover exceptions in detail later, but for now note that they are ways of signaling errors).

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

There's a nice detailed discussion that provides additional perspective on why to use getters and setters on [Stack Overflow](http://stackoverflow.com/questions/1568091/why-use-getters-and-setters).

<aside class="aside-warning" markdown="1">
When writing getters and setters, the convention for a field named `field` is to name them `getField` and `setField`. This is more than just a convention, as some libraries you use will *expect* names to be of this format, and won't work as desired if you don't follow the convention.

Additionally, it's a standard convention to use `is` instead of `get` for boolean fields. So a boolean field `oldEnoughToVote` would have the "getter" method `isOldEnoughToVote`. The setter should still be named `setOldEnoughToVote`.
</aside>

### Properties

A **property** in Java is a characteristic that users can set. Our `Student` class had properties `name`, `studentId`, `numberOfCredits`, and `Gpa`, while our `Temperature` class had only one property, `fahrenheit`.

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

Final fields can be confusing at first. If you've encountered references, or pointers, elsewhere in your programming journey (we don't cover them in LC101), then final fields might make more sense if you know that object fields actually hold a pointer to an object, and not the object itself.

### Static Fields

A **static field** is a field that is declared with the `static` keyword. We have encountered the `static` keyword used with both fields and methods, but since this discussion is focused on data, let's only discuss static fields for now.

A static field is shared by all instances of the class. For example, in our `Temperature` class there is not good reason that each `Temperature` object needs it's own double `absoluteZeroFahrenheit`, since that value will not vary from class to class. We let's make it a static field.

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

There are multiple ways to use a refer to a static field.

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
