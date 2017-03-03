---
title: 'Introduction to Classes and Objects'
currentMenu: java4python
---

Thus far, we have primarily been examining features of Java that are procedural in nature. Where we have used classes and objects, they have been provided from core Java packages. Over the course of the next few lessons we explore some object-oriented concepts in Java.

In the process, we will introduce the **Three Pillars of Object-Oriented Programming: polymorphism, inheritance, and encapsulation (PIE)**.

## A Minimal Class and Object

We've said several times that classes bundle data and behavior. More formally, classes may contain **fields** (the data) and **methods** (the behaviors). We say that fields and methods are **members** of a class.

Here's the object-oriented version of a "Hello World" class, containing exactly one field and one method.

```java
public class HelloWorld {

    String message = "Hello World";

    void sayHello() {
        System.out.println(message);
    }

}
```

The only field in this class is the string `message`, while the only method is `sayHello`, which prints `this.message` and doesn't return anything. Note that there is not `main` method, so there is no way to run the code in this class directly. We'll need to do that from another class.

To do this, we'll need to create an **instance** of the class `HelloWorld`. Recall from learning about classes and objects in Python that a class is a blueprint for creating objects. We refer to an object created from a particular class as an instance of that class.

Here's how this might look:

```java
public class HelloWorldRunner {

    public static void main(String[] args) {
        HelloWorld hello = new HelloWorld();
        hello.sayHello();
    }
}
```

In order to call the `sayHello` method of `HelloWorld`, we must first have an instance of `HelloWorld`, which we create using the syntax `new HelloWorld()`. As with built-in classes, classes that we create define their own types. So the object `hello` is a variable of type `HelloWorld`.

<aside class="aside-note" markdown="1">
You might be asking, "Didn't we create and call methods before without creating objects?" Indeed we did, but we always used the `static` keyword when doing so. We're taking those chains off now, and will learn how objects and classes work properly, from the ground on up.
</aside>

The class `HelloWorld` isn't very interesting, and by standards we will soon come to judge Java classes by, it's not particularly good. It only does one thing, print a message, and the message is always the same. Even if I were to create two different objects of type `HelloWorld`, the would be basically be the same.

We introduce this simple class as a means of illustrating the simplest representation of some basic concepts in Java. The goal of the next few lessons is to build up the machinery to create a wide variety of interesting classes that can be used to create complex programs.

## The this Keyword

In `HelloWorld` above, we could have written `sayHello` this way, with the same net effect:

```java
public void sayHello() {
    System.out.println(this.message);
}
```

In this context, inside of the class, we can refer to fields (and methods) that belong to the class using the special object `this`. Whenever you use `this`, it *always* refers to the object that the given code is currently within. Since it is not legal to create code outside of a class, `this` nearly always makes sense to use (there's one exception, that we'll encounter soon).

You are allowed to create local variables -- that is, variables declared within a method -- with the same name as a field of the given class. In this case, in order to refer to the field, we *must* use `this`.

```java
public void sayHello() {

    String message = "Goodbye World";

    // prints "Goodbye World"
    System.out.println(message);

    // prints "Hello World"
    System.out.println(this.message);
}
```

<aside class="aside-pro-tip" markdown="1">
When a local variable has the same name as a field, we say that the local variable **shadows** the field. Errors caused by shadowing can be tricky to spot, so it's best to avoid doing this in your code.
</aside>

## Access Modifiers

Every class member has an access level that determines who can access that class. For fields, the access level determines who can get or set the value of the field. For methods, the access level determines who can call the method. The access level of a class member is determined by an **access modifier**.

In declaring the `message` field and the `sayHello` method of `HelloWorld`, by omitting an access modifier we implicitly gave each **default access**. This is generally not a good thing to do, so after introducing each of the access modifiers we'll go back and fix this.

We've encountered two access modifiers to far: `public` and `private`. We noted that `public` allows a field or method to be used by anyone, and that `private` allows a field or method to be used only within the class in which it is defined. Two additional access modifiers are available, though they are used much less often than `public` and `private`.

The grid below details these levels, though we haven't really encountered the situations in which they might apply. At this point we introduce them for the sake of completeness. We'll point out specifically where they might be useful when we encounter such scenarios.

Modifier | Class | Package | Subclass | World
---------|-------|---------|----------|-------|
`public` | Y | Y | Y | Y
`protected` | Y | Y | Y | N
(no modifier, aka *package-private* or *default*) | Y | Y | N | N
`private` | Y | N | N | N

<aside class="aside-note" markdown="1">
You aren't expected to know the term "subclass" or how it applies to classes yet. We'll learn about it in a future lesson.
</aside>

You can read more about access modifiers at [docs.oracle.com][access-modifiers].

Let's fix our class by adding appropriate modifiers.

```java
public class HelloWorld {

    private String message = "Hello World";

    public void sayHello() {
        System.out.println(message);
    }

}
```

Ah, that feels better. Since `message` only needs to be used by `sayHello`, we declare it to be `private`. And since we want `sayHello` to be usable by anybody else, we declare it to be `public`.

<aside class="aside-pro-tip" markdown="1">
In Java, you should always use the most restrictive access modifier possible. Minimizing access to class members allows code to be refactored more easily in the future, and hides details of how you implement your classes from others.

This makes your code more modular and modifiable. Each public member that you expose is another field or property that can be referenced directly elsewhere in any program using your class. Thus, changing any such field in your code could potentially break any code referencing such members. The fewer public members, the more you can change your code without breaking stuff elsewhere.
</aside>

- [Controlling Access to Members of a Class (docs.oracle.com)][access-modifiers]
- [Using the this Keyword (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/javaOO/thiskey.html)


[access-modifiers]: https://docs.oracle.com/javase/tutorial/java/javaOO/accesscontrol.html
