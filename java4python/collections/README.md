---
title: Collections
currentMenu: java4python
---

Java provides powerful and flexible ways to store data. We'll introduce only a few here, but they will be sufficient for all of your basic needs while you get going with Java.

## Ordered Data: Lists

Lets look at another early Python program. We are going to read numbers from a file and produce a histogram that shows the frequency of the various numbers. The data file we will use has one number between 0 and 9 on each line of the file. Here is a simple Python program that creates and prints a histogram.

```python
# Python
def main():
    count = [0]*10
    data = open('test.dat')

    for line in data:
        count[int(line)] = count[int(line)] + 1

    idx = 0
    for num in count:
        print idx, " occured ", num, " times."
        idx += 1

if __name__ == '__main__':
    main()
```

Let's use a data file that contains the following text:

```nohighlight
9 8 4 5 3 5 2 1 5
```

> *NOTE:* When running the example code, note that `test.dat` is located at the root of the project, since this is where the `File` class will look for it by default. To use a file in another directory, we would need to provide a specific path to the file.

We will get output that looks like this:

```nohighlight
0 occurred 0 times
1 occurred 1 times
2 occurred 1 times
3 occurred 1 times
4 occurred 1 times
5 occurred 3 times
6 occurred 0 times
7 occurred 0 times
8 occurred 1 times
9 occurred 1 times
```

Let's review what is happening in this little program. In the first line we create a list and initialize the first 10 positions in the list to be 0. Next we open the data file called `test.dat`. We then have a loop that reads each line of the file. As we read each line, we convert it to an integer and increment the counter at the position in the list indicated by the number on the line we just read. Finally, we iterate over each element in the list printing out both the position in the list and the total value stored in that position.

### ArrayList

To write the Java version of this program we will have to introduce several new Java concepts. We will see the Java equivalent of a list, called an `ArrayList.` We will also introduce three different kinds of loops used in Java.

Here is the Java code needed to write the exact same program:

```java
// Java
import java.util.Scanner;
import java.util.ArrayList;
import java.io.File;
import java.io.IOException;

public class Histo {

    public static void main(String[] args) {
        Scanner data = null;
        ArrayList<Integer> count;
        Integer idx;

        try {
            data = new Scanner(new File("test.dat"));
        } catch (IOException e) {
            System.out.println("Unable to open your data file");
            e.printStackTrace();
            System.exit(0);
        }

        count = new ArrayList<Integer>();
        for (Integer i = 0; i < 10; i++) {
            count.add(i, 0);
        }

        while(data.hasNextInt()) {
            idx = data.nextInt();
            count.set(idx, count.get(idx) + 1);
        }

        idx = 0;
        for(Integer i : count) {
            System.out.println(idx + " occured " + i + " times");
            idx++;
        }
    }
}
```

Before going any further, I suggest you try to compile the above program and run it on some test data that you create.

Let's look at what is happening in the Java source. As usual we declare the variables we are going to use at the beginning of the method. In this example we are declaring a variable of type `Scanner` called `data`, an `Integer` called `idx` and an `ArrayList` called `count`. However, there is a new twist to the `ArrayList` declaration. Unlike Python where lists can contain just about anything, in Java we let the compiler know what kind of objects our list is going to contain. In this case, the `ArrayList` will contain Integers. The syntax we use to declare what kind of object the list will contain is the `<Type>` syntax.

Technically, you don’t *have* to declare what is going to be in an array list. The compiler will allow you to leave the `<Type>` off the declaration. If you don’t tell Java what kind of object is going to be on the list, you might see a warning message like this:

```nohighlight
Note: Histo.java uses unchecked or unsafe operations.
Note: Recompile with -Xlint:unchecked for details.
```

Without the `<Integer>` part of the declaration Java simply assumes that *any* object can be in the list. However, without resorting to an ugly notation called casting, you cannot do anything with the objects in a list like this! If you forget you will surely see more errors later in your code. (Try it, just to see what happens).

The following lines are required to open the file.

```java
// Java
try {
    data = new Scanner(new File("test.dat"));
} catch (IOException e) {
    System.out.println("Unable to open your data file");
    e.printStackTrace();
    System.exit(0);
}
```

Why so many lines to open a file in Java? The additional code mainly comes form the fact that Java forces you to reckon with the possibility that the file you want to open is not going to be there. If you attempt to open a file that is not there you will get an error (more formally, an **exception**). A try/catch construct allows us to try things that are risky, and gracefully recover from an error if one occurs. The following example shows the general structure of a try/catch block.

```java
// Java
try {
   // Put some risky code in here.... like opening a file
}
catch (Exception e) {
   // If an error happens in the try block an exception is thrown.
   // We will "catch" that exception here, so we can "handle" it
}
```

Notice that in the program at-hand we are catching an `IOException`. We will see later that we can have multiple catch blocks to catch different types of exceptions. If we want to be lazy and catch any old exception we can catch an `Exception` which is the "parent" of all exceptions. (More on parent classes and inheritence to come.)

Let's consider the next segment of our program:

```java
// Java
count = new ArrayList<Integer>();
for (Integer i = 0; i < 10; i++) {
    count.add(i, 0);
}
```

We create an `ArrayList` that will hold integers by calling the `ArrayList` constructor. The list will grow or shrink dynamically as needed, just like a list in Python. It's possible to give the `ArrayList` constructor a size, but omitting a size allows for more flexibility. We then start the first of three loops. The first is **for loop** that serves the same purpose as the Python statement `count = [0]*10`. That is, it initializes the first 10 positions in the `ArrayList` to hold the value `0`.

The syntax of this for loop probably looks very strange to you, but in fact it is not too different from what happens in Python using `range`. They syntax `for(Integer i = 0; i < 10; i++)` is exactly equivalent to the Python `for i in range(10)`. The first statement inside the parenthesis declares and initializes a loop variable `i`. The second statement is a Boolean expression that is our exit condition. In other words, we will keep looping as long as this expression evaluates to true. The third statement is used to increment the value of the loop variable at the end of iteration through the loop. The syntax `i++` is Java shorthand for `i + 1`. Java also supports the shorthand `i--` to decrement the value of `i`. Like Python, you can also write `i += 2` as shorthand for `i = i + 2`.

Try to rewrite the following Python for loops as Java for loops. We've provided you a place to do this in the `ForLoopPractice` class in the example code package.

```python
# Python
for i in range(2,101,2)
    print(i)
```

```python
# Python
for i in range(1,100)
    print(i)
```

```python
# Python
for i in range(100,0,-1)
    print(i)
```

Consider the next segment:

```java
// Java
while(data.hasNextInt()) {
    idx = data.nextInt();
    count.set(idx, count.get(idx) + 1);
}
```

This is a typical Java pattern for reading data from a file. Java while loops and Python while loops are identical in their logic. In this case, we will continue to process the body of the loop as long as `data.hasNextInt()` returns `true`.

The line `count.set(idx, count.get(idx) + 1);` illustrates another important difference between Python and Java. Notice that in Java we can not write `count[idx] = count[idx] + 1`. This is because Java does now allow overloading of operators. All but the most basic math and logical operations are carried using methods. To set the value of an `ArrayList` element we must use the `set` method. The first parameter of `set` indicates the index or position in the `ArrayList` we are going to change. The next parameter is the value we want to set. Notice that once again we cannot use the indexing square bracket operator `[]` to retrieve a value from the list, but instead must use the `get` method.

Let's consider the last loop in this program:

```java
// Java
idx = 0;
for(Integer i : count) {
    System.out.println(idx + " occured " + i + " times");
    idx++;
}
```

This is similar to the Python for loop where the object of the loop is a sequence. In Java we can use this kind of for loop over all kinds of sequences, which are called Collection classes in Java.

The loop `for (Integer i : count)` is equivalent to the Python loop `for i in count:`. This loop iterates through each of the elements in the `ArrayList` named `count`. Each time through the loop, the `Integer` variable `i` is assigned the value of the next element of the `ArrayList`. If you tried the experiment of removing the `<Integer>` part of the `ArrayList` declaration you probably noticed that you had an error on this line. Why?

## Key/Value Data: Maps

Just as Python provides the dictionary structure to allow us to store data as key/value pairs, Java also provides us a similar mechanism. Rather than the dictionary terminology, Java calls these objects Maps. There are multiple types of maps, but we'll focus only on the most general purpose map type: `HashMap`.

Let's stick with a simple frequency counting example, only this time we will count the frequency of words in a document. A simple Python program for this job could look like this:

```python
# Python
def main():
    data = open('alice.txt')
    wordList = data.read().split()
    count = {}
    for w in wordList:
        w = w.lower()
        count[w] = count.get(w,0) + 1

    keyList = sorted(count.keys())
    for k in keyList:
        print("%-20s occurred %4d times" % (k, count[k]))

if __name__ == '__main__':
    main()
```

The file `alice.txt` contains a short snippet from the beginning of *Alice In Wonderland*. You may [view the file's contents](TODO).

Notice that the structure of the program is very similar to the numeric histogram program.

Here's the Java version, using instances of the `HashMap` class:

```java
// Java
import java.io.File;
import java.io.IOException;
import java.util.Scanner;
import java.util.HashMap;

public class HistoMap {

    public static void main(String[] args) {
        Scanner data = null;
        HashMap<String,Integer> count;
        Integer idx;
        String word;
        Integer wordCount;

        try {
            data = new Scanner(new File("alice.txt"));
        } catch ( IOException e) {
            System.out.println("Unable to open your data file");
            e.printStackTrace();
            System.exit(0);
        }

        count = new HashMap<String,Integer>();

        while(data.hasNext()) {
            word = data.next().toLowerCase();
            wordCount = count.get(word);
            if (wordCount == null) {
                wordCount = 0;
            }
            count.put(word, ++wordCount);
        }

        for(String i : count.keySet()) {
            System.out.printf("%-20s occured %5d times\n", i, count.get(i) );
        }
    }
}
```

As an exercise, see if you can improve the program above to ignore punctuation.

## References

- [HashMap class documentation (docs.oracle.com)](https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html)
- [ArrayList class documentation (docs.oracle.com)](https://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html)
- [Arrays (docs.oracle.com)](http://docs.oracle.com/javase/tutorial/java/nutsandbolts/arrays.html)
