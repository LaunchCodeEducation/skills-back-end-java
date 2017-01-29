---
title: Control Flow
currentMenu: java4python
---

In this section we examine the syntax of control flow statements n Java -- conditionals and loops -- comparing them to Python. We will find them to be very similar, with relatively predictable syntax variations based on the Java that we have learned to this point.

## Conditionals

Conditional statements in Python and Java are very similar. In Python we have three patterns.

### Simple if

Let's consider an `if` statement with no `else` clause. Here's the Python version.

```python
# Python
if condition:
    statement1
    statement2
    ...
```

In Java this same pattern is simply written as:

```java
// Java
if (condition) {
    statement1
    statement2
    ...
}
```

Once again, you can see that in Java the curly braces define a block rather than indentation. In Java, the parentheses around the condition are required.

### if-else

Adding an `else` clause, we have:

```python
# Python
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
// Java
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

In Java we can utlize the same behavior that `elif` provides in Python, with a slightly different syntax. Here is a simple example in both Python and Java.

```python
# Python
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
// Java
public class ElseIf {
    public static void main(String args[]) {
        int grade = 85;
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

Java also supports a `switch` statement that acts something like the `elif` statement of Python under certain conditions. To write the grade program using a switch statement we would use the following:

The `switch` statement is not used very often, and we generally recommend you avoid using it. It is not as powerful as the `else if` model because the switch variable can only be compared for equality with a very small class of types.

Additionally, if `break` statements are omitted on accident, a behavior known as [fallthrough](https://en.wikipedia.org/wiki/Switch_statement#Fallthrough) is carried out. Fallthrough can be quite unintuitive, and is only desireable in very specific circumstances.

Here's a quick example:

```java
// Java
import java.util.Scanner;

public class DayPrinter {
    public static void main(String[] args) {

        System.out.println("Enter a integer: ");
        Scanner in = new Scanner(System.in);
        Integer dayNum = in.nextInt();


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

## Iteration

At a coneptual level, loops in Java aren't that different from loops in Python, though the syntax varies significantly in some cases.

### For Loops

In Python the easiest way to write a definite loop (aka a for loop) is using the for loop in conjunction with the range function. For example:

```python
# Python
for i in range(10):
   print i
```

In Java we would write this as:

```java
// Java
for (Integer i = 0; i < 10; i++ ) {
    System.out.println(i);
}
```

Recall that the `range` function provides you with a wide variety of options for controlling the value of the loop variable.

```python
# Python
range(stop)
range(start,stop)
range(start,stop,step)
```

The Java for loop is really analogous to the last option giving you explicit control over the starting, stopping, and stepping in the three clauses inside the parenthesis. You can think of it this way:

```java
// Java
for (start clause; stop clause; step clause) {
    statement1
    statement2
    ...
}
```

If you want to start at 100, stop at 0 and count backward by 5 the Python loop would be written as:

```python
# Python
for i in range(100,-1,-5):
    print i
```

In Java we would write this as:

```java
// Java
for (Integer i = 100; i >= 0; i -= 5)
    System.out.println(i);
```

In Python the for loop can also iterate over any sequence such as a list, a string, or a tuple. Java also provides a variation of its for loop that provides the same functionality in its so called `for each` loop.

In Python we can iterate over a list as follows:

```python
# Python
l = [1, 1, 2, 3, 5, 8, 13, 21]
for fib in l:
   print fib
```

In Java we can iterate over an ArrayList of integers too:

```java
// Java
ArrayList<Integer> l = new ArrayList<Integer>();
l.add(1); l.add(1); l.add(2); l.add(3);
for (Integer i : l) {
    System.out.println(i)
}
```

This example stretches the imagination a bit, and in fact points out one area where Java’ s primitive arrays are easier to use than an array list. In fact all primitive arrays can be used in a `for each` loop.


```java
// Java
int l[] = {1,1,2,3,5,8,13,21};
for(int i : l) {
    System.out.println(i);
}
```

To iterate over the characters in a string in Java do the following:

    String t = "Hello World";
    for (char c : t.toCharArray()) {
        System.out.println(c);
    }

### While Loops

Both Python and Java support the while loop, or indefinite loop. Recall that in Python the while loop is written as:

```python
# Python
while condition:
   statement1
   statement2
   ...
```

In Java we add parenthesis and curly braces to get:

```java
// Java
while (condition) {
    statement1
    statement2
    ...
}
```

Java adds an additional, if seldom used, variation of the while loop called the do loop. The do loop is very similar to while except that the condition is evaluated at the end of the loop rather than the beginning. This ensures that a loop will be executed at least one time. Some programmers prefer this loop in some situations because it avoids an additional assignment prior to the loop. For example:

```java
// Java
do {
    statement1
    statement2
    ...
} while (condition);
```

## References

- [The if-then and if-then-else Statements (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/if.html)
- [The switch Statement (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/switch.html)
- [The for statement (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/for.html)
- [The while and do-while Statements (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html)
- [Summary of Control Flow Statements (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/flowsummary.html)
