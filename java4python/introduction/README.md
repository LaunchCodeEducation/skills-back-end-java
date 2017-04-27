---
title: Introduction
currentMenu: java4python
---

We will use Python as a starting point for our journey into [Java](https://en.wikipedia.org/wiki/Java_(programming_language)). We will begin by looking at a very simple Java program, just to see what the language looks like and how we get a program to run. Next, we will look at the main constructs that are common to most programming languages. These concepts are part of what is generally referred to as [procedural programming](https://en.wikipedia.org/wiki/Procedural_programming).

- Data Types
- Loops
- Reading user input
- Conditionals

Once we have the basics of Java behind us we will move on to look at the features of Java that are both unique and powerful. These features bring us into the areas of [object-oriented programming](https://en.wikipedia.org/wiki/Object-oriented_programming) and [data structures](https://en.wikipedia.org/wiki/Data_structure).

- Classes
- Interfaces
- Abstracts
- Collections

## Why Learn Another Programming Language?

Python is great first programming language for several reasons. The syntax is sparse and clear. The underlying model of how objects and variables work is very consistent. You can write powerful and interesting programs without a lot of work. However, Python is representative of one kind of language, called a dynamic language. You might think of Python as being fairly informal. There are other languages, like Java and C++ that are more formal.

These languages have some advantages of their own. For very large programs, languages like Java and C++ are going to give you the best performance. They are also much more "safe" and "maintainable". A lot of what makes Python easy to use is that you must remember certain things. For example, if you set a variable `x` to reference a turtle, and forget later that `x` is a turtle but try to invoke a string method on it, you will get an error upon running your program. Java and C++ protect you by forcing you to be upfront and formal about the kind of object each variable is going to refer to. This means that some types of errors are caught sooner, and the runtime behavior of a program is more dependable.

In one sense, Python is representative of a whole class of languages, sometimes referred to as "scripting languages." Other languages in the same category as Python are Ruby and Javascript. Java is representative of what I will call industrial strength languages. These languages are good for projects with several people working on the project where being formal and careful about what you do may impact lots of other people. Languages in this category include C++, C, and C\#.

Programming languages will always change. As the field of computer science advances there will be new programming languages, and you will need to learn some of them. As you do, you will see that there are certain features that most programming languages have in common -- variables, loops, conditionals, functions -- and there are some features that are unique to each. If you know what is common in languages, that is a good place to start.

## Why Learn Java?

Java has been widely used by programmers for over 20 years. It continues to grow and to evolve, and to be extremely relevant to both programmers and companies using and building software. At a high level, this can easily be seen by looking at measures of language popularity and usage, such as the [Tiobe Index](http://www.tiobe.com/tiobe-index/) or [GitHut](http://githut.info/). In addition, Java is a [C-style language](https://en.wikipedia.org/wiki/Category:C_programming_language_family), meaning that many of its sytnax features are derivative of the [C programming language](https://en.wikipedia.org/wiki/C_(programming_language)). This makes learning the basics of other C-style languages relatively straightforward once you know Java (or vice versa).

Java is an enormous language. There are over 4200 different classes included in the Java 8 Standard Edition. We could not begin to scratch the surface of these classes even if we devoted all of our time to the task. However, Java is very powerful and we will write some very powerful programs in this course.

## Getting Ready

Before starting with each of these lessons, open up IntelliJ and browse to the `demos.java4python` package in the Project pane. All Java examples in these lessons are provided in this package, and you should run the programs there as you go, modifying and experimenting with the code to help you learn.

<aside class="aside-note" markdown="1">
When looking at source code for these examples in IntelliJ, you will notice that they vary slightly from code included here. In these lessons, we omit package declarations, top-level comments, and other inconsequential elements.
</aside>

## Hello, World

As with learning Python, we'll start by writing a "Hello, World" program. There are no logic errors to make, so getting it to run relies only on understanding the most basic syntax rules of the language.

### Comments

Before looking at our "Hello World" program, let's start by covering the easiest piece of syntax in any programming language: comments.

In Python we were able to insert comments in two ways. Single line comments begin with `#` and multi-line comments (aka docstrings) are surrounded by triple-quotes, `"""`.

```python
# This comment lives on a single line

"""this comment
can span
multiple lines
"""
```

We have similar functionality in Java, but with `//` denoting single-line comments and `/*` and `*/` surrounding multi-line comments.

```java
// This comment lives on a single line

/*
this comment
can span
multiple lines
*/
```

Throughout these initial lessons, we'll use a short comment at the top of each code sample to indicate which language is being used, to help you quickly tell while you're making the transition to Java. Here's an example:

```java
...some Java code...
```
### Hello, World in Python

Let's first look at a version of Hello, World for Python:

```python
print("Hello, World")
```

If you put this code in a file named `helloworld.py`, you could run it within a terminal by issuing the command ` helloworld.py`. Of course, it would then print `Hello, World` to the terminal.

Let's take this example one step further, to draw a closer parallel to what we'll see in Java. Consider the following, more complicated program.

```python
def main():
    print("Hello, World")

if __name__ == '__main__':
    main()
```

Here, we've added a "wrapper" to our simple call to the `print` function, in the form of a `main` function. Recall that the last two lines of the program check to ensure that the file is being run directly, rather than being imported as a module into another Python file. Running the program with `python helloworld.py` results in the same output as the first example.

### Hello, World in Java

Here is a Java program with the same functionality as the Python Hello, World program:

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello, World");
    }
}
```

Comparing this to the Python version above, the only real similarities we see are the "Hello World" string and functions that seem to indicate they print a message (`print` and `System.out.println`). However, there is more that's different than the same. Do not worry! An important skill for a programmer is to learn what to ignore and what to look at carefully. You will soon find that there are some elements of Java that will fade into the background as you become used to seeing them.

This simple example illustrates a few very important Java rules:

1. Every Java program must define a class; all code is inside a class
2. Everything in Java must have a type
3. Every Java program must have a function (or method) called `main` that has a signature\* of `public static void main(String[] args)`

\* A **method signature** specifies all of the information necessary for a programmer to use the method, including, at minimum, its name and the number, types, and order of its parameters. It can also include access and static modifiers (we'll learn about these later).

Let's take this example one line at a time to see how these rules are applied.

#### Line 1

Our program starts with `public class Hello`, along with an opening `{`. The first word, `public`, indicates to the Java compiler that this is a method that anyone can call. We will see soon that Java enforces several levels of security on the methods we write, including **public**, **protected**, and **private** methods.

The `class` keyword indicates that we are defining a class, while `Hello` is the name of the class. The name of a class is up to the programmer, and can be anything that fits within some basic rules (names must start with a letter, may not contain spaces, and so on). When naming classes it's best to follow [Java naming conventions][naming-conventions].

Unlike Python, where a program can simply be a bunch of statements in a file, Java programs must be inside a class. The `Hello` class is not a very useful class since it has no instance variables and only one method. It is created out of necessity.

When defining a class, we must surround the contents of the class (its properties and methods) with "curly braces": `{` and `}`. These braces will also be used to surround conditionals, methods, and loops in coming lessons. In Java, any section of code encolsed in a pair of such braces is referred to as a **block**.

#### Line 2

On the next line we start our method definition. The name of this method is:

```java
public static void main(String[] args)
```

You will notice that we indented this line once, as it sits one level inside of our class definition. Unlike in Python, such indentation is not required; it is simply a convention applied for the purpose of readability and consistency. Instead of indentation, what signifies to the compiler that this method definition is part of the `Hello` class is the fact that it is part of the block associated with that class. In other words, it's the outer set of curly braces that make this explicit.

Everything on this line is significant, and is part of the identification of this method. For example, the following lines look similar but are in fact treated by Java as completely different methods:

- `public void main(String[] args)`
- `public static void main(String args)`
- `public static void main()`
- `void main(String args)`

Disecting this one line could easily take us very deep into the world of Java, but we'll be cautious to not get pulled to far in too soon. Each of these concepts can and will be explored in much more depth later.

##### public

Similar to the use of `public` in line 1, this indicates to the Java compiler that this is a method that anyone can call.

##### static

The next word, `static`, tells Java that this is a method that is part of the class, but does not belong to any one instance of the class. Rather, it is shared by all instances. Recall that a class is a blueprint for a type of object, and when we create an object based on a class, we refer to that object as an **instance** of the class (or just **instance**).

The kind of methods we typically wrote in Python required an instance in order for the method to be called. With a static method, the object to the left of the `.` is a class, not an instance of the class. The way that we would call the `main` method directly is: `Hello.main(parameter1)`. For now you can think of static methods the same way you think of methods in Python modules that don’t require an instance. For example, the math module contains many methods: `sin`, `cos`, etc. You evaluated these methods using the names `math.cos(90)` or `math.sin(60)`.

##### void

The next word, `void`, tells the Java compiler that the method `main` will not return a value. This is roughly analogous to omitting the return statement in a Python method. The method will run to completion and exit but will not return a value that you might use in an assignment statement. As we look at other examples we will see that every Java function must tell the compiler what kind of an object it will return. This is in keeping with the rule that says everything in Java must have a type. In this case we use the special type called `void` which means nothing will be returned.

##### main

Next we have the proper name for the method: `main`. The rules for names in Java are similar to the rules in Python. Names can include letters, numbers, and the `_`. Names in Java must start with a letter.

##### String[] args

Finally, we have the parameter list for the method. In this example we have one parameter, named `args`. Everything in Java must have a type, so we also have to tell the compiler that the value of `args` is an array of strings. For the moment you can just think of an array as being the same thing as a list in Python. The practical benefit of declaring that the method `main` must accept one parameter and the parameter must be a an array of strings is that if you call `main` somewhere else in your code and pass it an array of integers or even a single string, the compiler will flag it as an error. In Python we would not have seen such an error manifest itself until we ran the program.

#### Line 3

Let's look at the next line: `System.out.println("Hello World!");`. This line should look a bit more familiar to you. Python and Java both use the dot notation for finding names.

In this example we start with `System`. `System` is a class. Within the `System` class we find the object named `out`. The `out` object is the standard output stream for this program (typically, the command prompt). Having located the `out` object Java will now call the method named `println(String s)` on that object. The `println` method prints a string and adds a newline character at the end. Anywhere in Python that you used the `print` function you will use the `System.out.println` method in Java.

##### Semi-colon

There is one more character on this line that is significant and that is the `;` at the end. In Java, the `;` signifies the end of a statement. Unlike Python where statements are almost always only one line long, Java statements can spread across many lines. The compiler knows it has reached the end of a statement when it encounters a `;`. This is a very important difference to remember. In Java the following statements are all legal and equivalent. We do not encourage you to write your code in any way other than the first example, but you should know that it is legal.

```java
System.out.println("Hello World");
```

```java
System.out.println("Hello World")
;
```

```java
System.out.println
    (
     "Hello World"
    )     ;
```

```java
System.
  out.
    println("Hello World")
    ;
```

<aside class="aside-note" markdown="1">
In contrast to Python, indentation (and whitespace, in general) *does not* hold any special meaning in Java.
</aside>

#### Lines 4-5

The last two lines of the hello world program simply close the two blocks. The first or outer block is the class definition. The second or inner block is the function definition.

####

If we wanted to translate the Java back to Python, we would have something like the following class definition:

```python
class Hello(object):

    @staticmethod
    def main(args):
        print "Hello World!"
```

Notice that we used the decorator `@staticmethod` to tell the Python interpreter that `main` is going to be a static method. The impact of this is that we don’t have to, indeed we should not, use `self` as the first parameter of the `main` method! Using this definition we can call the `main` method in a Python session like this:

```nohighlight
>>> Hello.main("")
Hello World!
>>>
```

## References

- [Java (programming language) (wikipedia.org)](https://en.wikipedia.org/wiki/Java_(programming_language))
- [The History of Java Technology (oracle.com)](http://www.oracle.com/technetwork/java/javase/overview/javahistory-index-198355.html)

[naming-conventions]: ../naming-conventions/
