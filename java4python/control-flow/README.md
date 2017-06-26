---
title: Control Flow
currentMenu: java4python
---

In this section we examine the syntax of control flow statements in Java - conditionals and loops - comparing them to Python. We will find them to be very similar, with relatively predictable syntax variations based on the Java that we have learned to this point.

## Conditionals

Conditional statements in Python and Java are very similar. In Python we have three patterns.

### Simple if

Let's consider an `if` statement with no `else` clause. Here's the Python version.

```python
if condition:
    statement1
    statement2
    ...
```

In Java this same pattern is simply written as:

```java
if (condition) {
    statement1
    statement2
    ...
}
```

Once again, you can see that in Java the curly braces, rather than indentation, define a block. In Java, the parentheses around the condition are required.

### if-else

Adding an `else` clause, we have:

```python
if condition:
    statement1
    statement2
    ...
else:
    statement1
    statement2
    ...
```

In Java this is written as:

```java
if (condition) {
    statement1
    statement2
    ...
} else {
    statement1
    statement2
    ...
}
```

### elif / else if

In Java we can utilize the same behavior that `elif` provides in Python, with a slightly different syntax. Here is a simple example in both Python and Java.

```python
grade = int(input('enter a grade'))
if grade < 60:
    print 'F'
elif grade < 70:
    print 'D'
elif grade < 80:
    print 'C'
elif grade < 90:
    print 'B'
else:
    print 'A'
```

In Java we would write this as follows:

```java
import java.util.Scanner;
public class ElseIf {
    public static void main(String args[]) {
        Scanner in = new Scanner(System.in);
        System.out.println('enter a grade');
        int grade = in.nextInt();
        if (grade < 60) {
            System.out.println('F');
        } else if (grade < 70) {
            System.out.println('D');
        } else if (grade < 80) {
            System.out.println('C');
        } else if (grade < 90) {
            System.out.println('B');
        } else {
            System.out.println('A');
        }
    }
}
```

### switch

Java also supports a `switch` statement that acts something like the Python `elif`statement under certain conditions. The `switch` statement is not used very often, and we generally recommend you avoid using it. It is not as powerful as the `else if` model because the switch variable can only be compared for equality with a very small class of types. 

Here is a quick example of a `switch` statement:

```java
import java.util.Scanner;

public class DayPrinter {
    public static void main(String[] args) {
        Scanner in = new Scanner(System.in);
        System.out.println("Enter an integer: ");
        int dayNum = in.nextInt();

        String day;
        switch (dayNum) {
            case 0:
                day = "Sunday";
                break;
            case 1:
                day = "Monday";
                break;
            case 2:
                day = "Tuesday";
                break;
            case 3:
                day = "Wednesday";
                break;
            case 4:
                day = "Thursday";
                break;
            case 5:
                day = "Friday";
                break;
            case 6:
                day = "Saturday";
                break;
            default:
                // in this example, this block runs if none of the above blocks match
                day = "Int does not correspond to a day of the week";
        }
        System.out.println(day);
    }
}
```

In the example above, if the user entered the number *4*, "Thursday" is what would be printed. If the user entered the number *10*, "Int does not correspond to a day of the week" would be printed.

Additionally, if `break` statements are omitted from the individual cases on accident, a behavior known as [fallthrough](https://en.wikipedia.org/wiki/Switch_statement#Fallthrough) is carried out. Fallthrough can be quite unintuitive, and is only desirable in very specific circumstances. We will discuss `break` statements in more detail in the loop section below, but for now just know that when used in a switch block they terminate the switch statement they are in, so the flow of control in your program moves to the next statement after the switch block.

Here's a quick example of how fallthrough works:

```java
import java.util.Scanner;

public class DayPrinter {
    public static void main(String[] args) {

        System.out.println("Enter an integer: ");
        Scanner in = new Scanner(System.in);
        int dayNum = in.nextInt();

        String day;
        switch (dayNum) {
            case 0:
                day = "Sunday";
            case 1:
                day = "Monday";
            case 2:
                day = "Tuesday";
            case 3:
                day = "Wednesday";
            case 4:
                day = "Thursday";
            case 5:
                day = "Friday";
            case 6:
                day = "Saturday";
            default:
                // in this example, this block runs even if one of the above blocks match
                day = "Int does not correspond to a day of the week";
        }
        System.out.println(day);
    }
}
```

This time, without the `break` statements in each `case`, if the user entered *4*, "Int does not correspond to a day of the week" would be printed. This is because after the `switch` statement matches the `case` for *4* and assigns the value "Thursday" to the variable `day`, it proceeds to execute every statement in every case that follows, all the way through the `default` case. So the `String` that ends up being printed will reflect the last executed statement in the `switch` block. 

As another variation on this example, if there were a `break` statement in `case 6` after `day = "Saturday";`, then if the user entered *4*, the execution would fallthrough until it reached that `break` statement and "Saturday" is what would be printed instead.

## Iteration

At a conceptual level, loops in Java aren't that different from loops in Python, though the syntax varies significantly in some cases.

### For Loops

In Python the easiest way to write a definite loop (aka a `for` loop) is using the `for` loop in conjunction with the `range` function. For example:

```python
for i in range(10):
   print i
```

In Java we would write this as:

```java
for (int i = 0; i < 10; i++ ) {
    System.out.println(i);
}
```

<aside class="aside-note" markdown="1">
You may not be familiar with the expression `i++` since it is not found in Python. The `++` is an increment operator that has the same effect as `i += 1`. In this example, since the `++` comes after `i`, we call it a postfix increment operator. There is also a `--` decrement operator in Java. For more information, see [Increment and Decrement Operators](http://www.javawithus.com/tutorial/increment-and-decrement-operators).
</aside>

Recall that the `range` function provides you with a wide variety of options for controlling the value of the loop variable.

```python
range(stop)
range(start,stop)
range(start,stop,step)
```

The Java `for` loop is analogous to the last option giving you explicit control over the starting, stopping, and stepping in the three clauses inside the parentheses. You can think of it this way:

```java
for (start clause; stop clause; step clause) {
    statement1
    statement2
    ...
}
```

If you want to start at 100, stop at 0 and count backward by 5 the Python loop would be written as:

```python
for i in range(100,-1,-5):
    print i
```

In Java we would write this as:

```java
for (int i = 100; i >= 0; i -= 5)
    System.out.println(i);
```

In Python the `for` loop can also iterate over any sequence such as a list, a string, or a tuple. Java also provides a variation of its `for` loop that provides the same functionality in its so-called *for-each* loop, or *for-in* loop.

In Python we can iterate over a list as follows:

```python
k = [1, 1, 2, 3, 5, 8, 13, 21]
for i in k:
   print i
```

In Java, this would look like:

```java
int k[] = {1, 1, 2, 3, 5, 8, 13, 21};
for(int i : k) {
    System.out.println(i);
}
```

This version translates nicely to iterating through a string, where we can convert the string to an array of characters:

```java
String msg = "Hello World";
for (char c : msg.toCharArray()) {
    System.out.println(c);
}
```

### While Loops

Both Python and Java support the `while` loop, or indefinite loop. Recall that in Python the `while` loop is written as:

```python
while condition:
   statement1
   statement2
   ...
```

In Java we add parentheses and curly braces to get:

```java
while (condition) {
    statement1
    statement2
    ...
}
```

Java adds an additional, if seldom used, variation of the `while` loop called the `do-while` loop. The `do-while` loop is very similar to `while` except that the condition is evaluated at the end of the loop rather than the beginning. This ensures that a loop *will be executed at least one time*. Some programmers prefer this loop in some situations because it avoids an additional assignment prior to the loop. For example:

```java
do {
    statement1
    statement2
    ...
} while (condition);
```

### Break and Continue Statements

There are instances where you may want to terminate a loop if a given condition is met. In these instances, the `break` statement comes in handy. For example, if you want to loop through an array of integers searching for a given integer and you want to quit the loop once that number is found, you can do the following:

```java
public class testBreak {

    public static void main(String [] args) {
        int[] someInts = {1, 10, 2, 3, 5, 8, 10};
        int searchTerm = 10;
        for(int oneInt : someInts) {
            if (oneInt == searchTerm) {
                System.out.println("Found it!");
                break;
            }
        }
    }
```

In the code above, instead of the `for` loop iterating through all the integers in the array, it will stop after it finds the first matching instance. So once it finds the first *10* in the array, it prints "Found it!" and then terminates the loop. If the `break` statement weren't there, the loop would continue and when it found the second *10* it would print "Found it!" a second time.

Note that the `break` statement terminates the innermost loop that it is contained within. So if you have nested loops and use a `break` statement within the innermost loop, then it will only terminate that loop and not the outer one.

The `continue` statement is similar to, but importantly different from, the `break` statement. Like `break`, it interrupts the normal flow of control of the loop. But unlike `break`, the `continue` statement only terminates the *current iteration* of the loop. So the loop will continue to run from the top (as long as the boolean expression that controls the loop is still true) after a `continue` statement. Here is an example:

```java
public class testContinue {

    public static void main(String [] args) {
        int[] someInts = {1, 10, 2, 3, 5, 8, 10};
        int searchTerm = 10;
        for(int oneInt : someInts) {
            if (oneInt == searchTerm) {
                System.out.println("Found it!");
                continue;
            }
            System.out.println("Not here");
        }
    }
}
```

The above program will print "Not here" on every iteration of the `for` loop *except* where the number has been found. So the output looks like this:

```nohighlight
Not here
Found it!
Not here
Not here
Not here
Not here
Found it!
``` 

Because of the `continue` statement, the final print statement in the for loop is skipped. If the `continue` statement weren't there, the output would look like this instead (notice the extra "Not here" printouts): 

```nohighlight
Not here
Found it!
Not here
Not here
Not here
Not here
Not here
Found it!
Not here
``` 

## References

- [The if-then and if-then-else Statements (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/if.html)
- [The switch Statement (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/switch.html)
- [The for statement (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/for.html)
- [The while and do-while Statements (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html)
- [Break and Continue Statements (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/branch.html)
- [Summary of Control Flow Statements (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flowsummary.html)
