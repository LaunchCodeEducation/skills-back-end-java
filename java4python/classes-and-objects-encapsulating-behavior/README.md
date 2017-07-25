---
title: 'Classes and Objects: Encapsulating Behavior'
currentMenu: java4python
---

Having explored configuring data within classes (via fields and properties), let's turn our attention to behavior (methods).

## Calling Methods on Objects

A **method** is a procedure that belongs to a class. In Java, all procedures must be part of a class, a significant difference from Python, where functions may stand on their own. Let's revisit our minimal class example.


```java
public class HelloWorld {

    private String message = "Hello World";

    void sayHello() {
        System.out.println(message);
    }

}
```

There is one method in this class, `sayHello`. In order to call this method, we must have an object created from the `HelloWorld` class template. In other words, we must have an instance of `HelloWorld`.

Here's how you call methods on an object.

```java
HelloWorld hello = new HelloWorld();
hello.sayHello();
```

It is not possible to call `sayHello` without having a `HelloWorld` object. This begins to make more sense when you note that the `message` field is used within `sayHello`, and unless we are calling `sayHello` on an instantiated object, there will be no `message` field available to print.

<aside class="aside-pro-tip" markdown="1">
As mentioned before, class members should have the most restrictive level of access possible. This goes for methods as well as fields. For example, if you create a utility method that should only be used within your class, then it should be `private`. You can think of `private` methods as those that are not useful *outside* of the class, but that can contribute internally to helping the class behave as desired or expected.

On the contrary, `public` methods are code that other classes will want to use when they implement the class containing those `public` methods. So only make methods `public` when you expect other classes to use them, and when you are committed to maintaining those methods for other calling programs that may use them.
</aside>


## Instance Methods

So far we've only looked at examples of methods that are relatively specialized: constructors, getters, and setters. Every class you create will have these methods. What will make your classes different from each other, and thus fulfill the purpose of creating each class, are the specific behaviors that are unique to your classes.

Let's add a couple of such methods to our `Student` class. These methods will be **instance methods** since they will belong to each `Student` object created, and will use the data of each such object.

What are the behaviors that our `Student` class should have? To start, it would make sense for a student to take a class and get a grade, and for their data to be updated accordingly. Additionally, it would be nice to be able to easily tell the grade level of a student -- freshman, sophomore, junior, or senior.

Our last look at the `Student` class stubs out these methods below, without providing the implementation. That job is left to you to do as an exercise.

```java
public class Student {

    private static int nextStudentId = 1;
    private String name;
    private int studentId;
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

    public void addGrade(int courseCredits, double grade) {
        // Update the appropriate fields: numberOfCredits, gpa
    }

    public String getGradeLevel() {
        // Determine the grade level of the student based on numberOfCredits
    }

    /* getters and setters omitted */

}
```

When creating your classes, think about the behaviors that you want to make available, as well as the access level of those methods.

## Static Methods

Static methods are not new to us. We've used them quite a bit, all the way back to our first Java method: `public static void main(String[] args)`. Now let's present them in the context of the rest of what we've recently learned about classes.

Analogous to static fields, **static methods** belong to the class as a whole, and not to any of the specific instances of the class. Thus, they are sometimes also called **class methods**.  A static method can be thought of as the opposite of an instance method, since the two cases are mutually exclusive. Instance methods rely on each object's specific data whereas static methods must *not* rely on data from a specific object.

A static method may be called by preceding it with the class name and using dot-notation. Here's an example that we looked at previously.

```java
public class HelloMethods {

    public static void main(String[] args) {
        String message = Message.getMessage("fr");
        System.out.println(message);
    }

}
```

```java
public class Message {

    public static String getMessage(String lang) {

        if (lang.equals("sp")) {
            return "Hola Mundo";
        } else if (lang.equals("fr")) {
            return "Bonjour le monde";
        } else {
            return "Hello World";
        }
    }
}
```

The call in question is: `Message.getMessage("fr")`. We call the static method `getMessage` without needing an instance of the `Message` class, using the name of the class itself.

<aside class="aside-warning" markdown="1">
It is technically allowed to call a static method using an instance of a class: `myObject.someStaticMethod()`. However, this should be avoided in favor of using the class name to call the method so that it is clear you are using a static method.
</aside>

A method should be static when it does not refer to any instance fields of the containing class (it *may* refer to static fields, however). These methods tend to be utility-like, carrying out a calculation, or using or fetching some external resource.

## Special Methods

Every class has a few special methods that belong to it, regardless of whether or not we define them. Exactly *how* every class obtains these methods will be explored in a future lesson. For now, let's look at the most important of these methods.

### toString

The `toString` method returns a string representation of a class. Calling `toString` on a class that you've written will result in something like this:

```nohighlight
org.launchcode.java.demos.java4python.school.Student@61bbe9ba
```

Here, we called `toString` on a `Student` object. Generally, the default `toString` implementation is not very useful, and you'll want to override it. You can write your own `toString`. Here's how we might do it for `Student`:

```java
public String toString() {
    return name + " (Credits: " + numberOfCredits + ", GPA: " + gpa + ")";
}
```

This would result in a much more friendly message:

```nohighlight
John (Credits: 0, GPA: 0.0)
```

Note that `toString` is often implicitly called for you. For example, the output above could have been generated by the following code, which calls `toString` on `john` within `System.out.println`.

```java
Student john = new Student("John");
System.out.println(john);
```

### equals

Suppose we had two objects of type `Student`, say `student1` and `student2`, and we wanted to determine if they were equal. We might try to compare them using `==`, but since these are [references](../data-types#references) - that is, the variables hold a reference to, or the *address* of, the actual `Student` objects - they will evaluate as equal only when they have the same address. In other words, they will be equal only when they refer to, or point at, the exact same object. This is not usually what we want to check for. For example, we might want to consider two student objects equal if they have the same name, email, or student ID.

The `equals()` method can be used to determine if one object is equal to another in this sense. We introduced this method when discussing strings, but it also applies to all other classes. Below is code showing how you might use it to compare two students. Note that they have different names, but the same student ID, indicating they are actually referring to the same person.

```java
Student bono1 = new Student("Paul David Hewson", 4);
Student bono2 = new Student("Bono", 4);

if (bono1.equals(bono2)) {
    System.out.println(bono1.getName() +
        " is the same as " + bono2.getName());
}
```

If we don't provide our own `equals()` method, then the one provided for us will only consider two objects equal if they are the *exact same object*. In other words, they will only be considered equal if the variables referring to the given objects both point to the same object. This is the same behavior that we would see when using the `==` operator: `bono1 == bono2`. This expression will evaluate to true only if the variables actually refer to the same object. So in the example above, since we have created two different `Student` objects, the expression will evaluate to false.

This kind of comparison is often not what we want. The difference between the comparison carried out by the default `equals()` method (and by the `==` operator), and how we would like our classes to behave, is the difference between *identity* and *equality*. Two things can be considered *equal* even if they are not the exact same item - that is, if they are not identical. So the default `equals()` method and the `==` operator test for identity, whereas we want to test for equality instead. We can do so by **overriding** the `equals()` method. We will discuss overriding in more detail later, but for now just know that it entails creating different behavior for an existing method.

For example, in the case of the `Student` class, we might specify that two `Student` objects are equal if they have the same ID. We would then write a new method definition for `equals()` as follows:

```java
public boolean equals(Object o) {
    Student theStudent = (Student) o;
    return theStudent.getStudentId() == getStudentId();
}
```

Now if we evaluate `bono1.equals(bono2)` we will get a result of true, since the student IDs match.

One catch of working with `equals()` is that its input parameter must be of type `Object`, even if we're working in a class like `Student`. The reason why will become more clear in the next lesson, when we introduce the `Object` class. For now, the practical implication is that we must convert, or **cast**, the input `o` to be of type `Student` with the syntax `(Student) o`. Then we compare the converted student's ID to that of the current student.

Here's a visualization of the concepts of equality and identity:

**Equality**

![Equality](equality.png)

When you are testing for equality, you will be looking at two different objects and comparing some aspect of them to each other.

**Identity**

![Identity](identity.png)

When you are testing for identity, you will look at two variables to see if they reference the exact same object.

You'll often want to implement `equals()` yourself. However, if you do so, be sure to understand best practices around how the method should behave, which are [not so simple][implementing-equals]. In fact, the `equals()` method we have here isn't very good by most Java programmers' standards. Let's improve on it.

**Problem #1**: The method argument can not be converted to a `Student` instance.

When we attempt to cast the argument `o` to type `Student`, we'll get an exception if `o` can't be properly converted. This would happen if somebody passes something other than a `Student` object into `equals()`. To prevent this from happening, we'll return `false` if `o` was not created from the `Student` class, as determined by using the `getClass` method, which is available to every object (similarly to `toString`).

```java
public boolean equals(Object o) {

    if (o.getClass() != getClass()) {
        return false;
    }

    Student theStudent = (Student) o;
    return theStudent.getStudentId() == getStudentId();
}
```

This check ensures that the two objects that we want to compare were created from the same class.

**Problem #2:** `o` might be `null`.

If `o` is `null` then `o.getClass()` will result in an exception. This is an easy issue to fix, since comparing a non-null object to `null` will evaluate to `false`. Therefore, if this comparison evaluates to true then we know that the object is null and `equals()` should return false.

```java
public boolean equals(Object o) {

    if (o == null) {
        return false;
    }

    if (o.getClass() != getClass()) {
        return false;
    }

    Student theStudent = (Student) o;
    return theStudent.getStudentId() == getStudentId();
}
```

**Problem #3:** The two objects to compare are _the same_ object.

This is less of a problem per se and more of a way we can improve our `equals()` method. If `o` is the same literal object that we are attempting to compare it to, then we can make a quick determination and save a few checks.

```java
public boolean equals(Object o) {

    if (o == this) {
        return true;
    }

    if (o == null) {
        return false;
    }

    if (o.getClass() != getClass()) {
        return false;
    }

    Student theStudent = (Student) o;
    return theStudent.getStudentId() == getStudentId();
}
```

#### Components of equals

Almost every equals method that you write will look similar to this one, and will contain the following segments, in order:

1. **Reference check:** If the two objects are the same, return `true` right away.
1. **Null check:** If the argument is `null`, return `false`.
1. **Class check:** Compare the classes of the two objects to ensure a safe cast.
1. **Cast:** Convert the argument to the type of our class, so getters and other methods can be called.
1. **Custom comparison:** Use custom logic to determine whether or not the two objects should be considered equal. This will usually be a comparison of properties or fields.

#### Characteristics of equals

Now that we know how to write an `equals()` method, let's look at some characteristics that every such method should have. If you follow the general outline above, ensuring that your `equals()` method has these characteristics should be straightforward.

1. **Reflexivity:** For any non-null reference value `x`, `x.equals(x)` should return `true`.
1. **Symmetry:** For any non-null reference values `x` and `y`, `x.equals(y)` should return `true` if and only if `y.equals(x)` returns true.
1. **Transitivity:** For any non-null reference values `x`, `y`, and `z`, if `x.equals(y)` returns `true` and `y.equals(z)` returns `true`, then `x.equals(z)` should return `true`.
1. **Consistency:** As long as `x` and `y` do not change `x.equals(y)` should always return the same result.
1. **Non-null:** For any non-null reference value `x`, `x.equals(null)` should return `false`.

If you think about your innate sense of the concept of equality, say, from a math class, then these concepts make sense. While using the general approach outlined above for implementing `equals()` will generally make these relatively simple to guarantee, not doing so can be disastrous for your Java applications.

<aside class="aside-pro-tip" markdown="1">
Seasoned Java developers will tell you that every time you implement your own version of `equals()` you should also implement your own version of `hashCode()`. `hashCode()` is another special method that every class has. Understanding `hashCode()` would take us a bit far afield at this point, but we would be remiss to not mention it. If you want to read more, [check out this article](https://www.sitepoint.com/how-to-implement-javas-hashcode-correctly/) and [this stack overflow](https://stackoverflow.com/questions/2265503/why-do-i-need-to-override-the-equals-and-hashcode-methods-in-java).

To ensure that you create a well-structured `hashCode()` method whenever providing your own `equals()` method, you can use IntelliJ's code generation tool. To do so, right-click within your class file and select _Generate > equals and hashCode_ and follow the prompts.
</aside>

While you may not need to write your own `equals()` method for each class you create, the more immediate implication for you as a new Java programmer is that you should *always use* `equals()` yourself when comparing objects. This is especially true when working with objects of types provided by Java, such as `String`. A class that is part of Java or a third-party library will have implemented `equals()` in a way appropriate for the particular class, whereas `==` will only check to see if two variables refer to the same literal object.

## Single Responsibility Principle

As we wrap up our whirlwind tour of encapsulation, we want you think a bit about how to go about building good classes. Doing so is more of an art than a science, and it will take you lots of practice and time. However, there are a few rules that we've pointed out to help guide you. Here's one more.

From [Wikipedia][srp]:

<aside class="aside-definition" markdown="1">
The **single responsibility principle** states that every module or class should have responsibility over a single part of the functionality provided by the software, and that responsibility should be entirely encapsulated by the class.
</aside>

It isn't always clear what "responsibility over a single part of the functionality" means. However, it is often very clear what it doesn't mean. For example, we wouldn't think of adding functionality to the `Student` class that tracked all of the data for each of the student's classes, such as catalog number, instructor, and so on. Those are clearly different areas of responsibility. One way to interpret the Single Responsibility Principle is to say that "classes should be small."

As you go forth and create classes, the main thing to keep in mind is that your skill and judgement in creating Java classes will improve over time. The best way to improve is to write lots of code, ask lots of questions, and continue learning!

## References

- [Defining Methods (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/methods.html)
- [Passing Data to a Method or Constructor (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/arguments.html)
- [How to Implement Java’s equals Method Correctly][implementing-equals]
- [How to Implement Java’s hashCode Correctly](https://www.sitepoint.com/how-to-implement-javas-hashcode-correctly/)
- [Single Responsibility Principle][srp]

[implementing-equals]: https://www.sitepoint.com/implement-javas-equals-method-correctly/
[srp]: https://en.wikipedia.org/wiki/Single_responsibility_principle
