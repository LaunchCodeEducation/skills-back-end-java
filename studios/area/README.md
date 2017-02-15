---
title: 'Studio: Area of a Circle'
currentMenu: studios
---

Get cosy with Java syntax by revisiting one of our early Python programs. We'll create a console program that calculates the area of a circle based on input from the user.

## Creating your class

Since you're still new to Java and IntelliJ, we'll provide some extra direction the first few times we go to write code.

Create a new package named `org.launchcode.java.studios` by right-clicking on the `src` directory in `java-exercises` and selecting *New > Package*. Be sure to enter the full name, or your package won't be created in the correct location.

Create your program/class in the `java-exercises` project within the package `org.launchcode.java.studios` by right-clicking on the `studios` package/folder and selecting *New > Java Class*. Enter the name `Area`.

## Your task

Write a program/class `Area` that prompts the user for a number, and then calculate the area of a circle with that radius and print the result.

<aside class="aside-note" markdown="1">
Recall that the area of a circle is `A = pi * r * r` where `pi` is 3.14 and `r` is the radius.
</aside>

Here's an example of how your program should work:

```nohighlight
Enter a radius: 2.5
The radius of a circle of radius 2.5 is: 19.625
```

Some questions to ask yourself:
- What data type should the radius be?
- What is the best way to get user input into a variable `radius` of that type?

<aside class="aside-warning" markdown="1">
Be sure to create a `main` method to place your code within. It's signagure *must* be:

```java
public static void main(String[] args)
```
</aside>

## Bonus Missions

1. Add validation to your program. If the user enters a negative number, print an error message and quit. You'll need to peek ahead to learn about [conditional syntax in Java](../../java4python/control-flow/#conditionals).
2. Extend your program further by using a [while or do-while loop](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html), so that when the user enters a negative number they are re-prompted.
