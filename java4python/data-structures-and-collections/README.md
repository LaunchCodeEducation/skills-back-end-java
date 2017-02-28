---
title: Data Structures and Collections
currentMenu: java4python
---

A **data structure** is a programming construct that allows you to aggregate lots of values into one value. More simply, a data structure let's us hold on to lots of data in a single place. In Python, the data structures we used were lists, dictionaries, and tuples.

Java provides powerful and flexible structures to store data, known as [collections][collections]. We'll introduce only a few here, but they will be sufficient for all of your basic needs while you get going with Java.

## Ordered Data: Lists and Arrays

We'll explore collections in Java by looking at different versions of the same program. The program will function as a gradebook, allowing a user (a professor or teacher) to enter the class roster for a course, along with each student's grade. It then prints the class roster along with the average grade. In each variation of this program, the grading system could be anything numeric, such as a 0.0-4.0 point scale, or a 0-100 percentage scale.

We'll look at lists first, and as before, we'll compare Python to Java explicitely through example. Python provided one basic *ordered* data structure: the list. Here's our gradebook program in Python using only lists.

### Gradebook (Python List Version)

```python
def main():

    students = []

    # Use a space to allow for the while check below
    newStudent = " "

    print("Enter your students (or ENTER to finish):")

    # Get student names
    while (newStudent != ""):

        newStudent = input()

        if newStudent != "":
            students.append(newStudent)

    # Get student grades
    grades = [0]*len(students)
    for idx,student in enumerate(students):
        newGrade = float(input("Grade for " + student + ": "))
        grades[idx] = newGrade

    # Print class roster
    print("\nClass roster:")
    for idx,student in enumerate(students):
        print(student + " (" + str(grades[idx]) + ")")

    avg = sum(grades) / len(grades)
    print("\nAverage grade: " + str(avg))

if __name__ == '__main__':
    main()
```

A test run of this program might yield the following:

```nohighlight
Enter your students (or ENTER to finish):
Chris
Jesse
Sally

Grade for Chris: 3.0
Grade for Jesse: 4.0
Grade for Sally: 3.5

Class roster:
Chris (3.0)
Jesse (4.0)
Sally (3.5)

Average grade: 3.5
```

Once you feel like you understand this program, proceed to the next section, where we study the Java version.

### Gradebook (Java ArrayList Version)

To write the Java version of this program we will have to introduce several new Java concepts. We will see the Java equivalent of a list, provided by the class `ArrayList`. We will also introduce different kinds of for loops used in Java.

```java
package org.launchcode.java.demos.java4python;

import java.util.ArrayList;
import java.util.Scanner;

public class Gradebook {

    public static void main(String[] args) {

        ArrayList<String> students = new ArrayList<>();
        ArrayList<Double> grades = new ArrayList<>();
        Scanner in = new Scanner(System.in);
        String newStudent;

        System.out.println("Enter your students (or ENTER to finish):");

        // Get student names
        do {
            newStudent = in.nextLine();

            if (!newStudent.equals("")) {
                students.add(newStudent);
            }

        } while(!newStudent.equals(""));

        // Get student grades
        for (String student : students) {
            System.out.print("Grade for " + student + ": ");
            Double grade = in.nextDouble();
            grades.add(grade);
        }

        // Print class roster
        System.out.println("\nClass roster:");
        double sum = 0.0;

        for (int i = 0; i < students.size(); i++) {
            System.out.println(students.get(i) + " (" + grades.get(i) + ")");
            sum += grades.get(i);
        }

        double avg = sum / students.size();
        System.out.println("Average grade: " + avg);
    }

}
```

Before going any further, I suggest you try to compile the above program and run it.

Once you've done that, let's look at what is happening in the Java source. The

```java
ArrayList<String> students = new ArrayList<>();
ArrayList<Double> grades = new ArrayList<>();
Scanner in = new Scanner(System.in);
String newStudent;
```

Here we declare and initialize two objects, `students` and `grades`, which appears to be of type `ArrayList<String>` and `ArrayList<Double>`, respectively. An `ArrayList` in Java is very similar to a list in Python, with one important difference. Unlike Python, where lists can contain any type of value, in Java we must let the compiler know what kind of objects our list is going to contain. In the case of `students`, the `ArrayList` will contain values of type `String` (representing the names of the students), so we use the `ArrayList<String>` syntax to inform the compiler that we intend to fill our list with strings. Similarly, `grades` will hold exclusively values of type `Double` and is declared to be of type `ArrayList<Double>`.

<aside class="aside-warning" markdown="1">
Notice that we declared `grades` to be of type `ArrayList<Double>`, using the wrapper class `Double` rather than the primitive type `double`. All values stored in Java collections must be objects, so we'll have to use wrapper classes in those situations. This is the one major exception to our rule-of-thumb that primitives are preferred over wrapper types.
</aside>

We then initialize each list by creating a new, empty list. Note that when we call the `ArrayList` constructor, as in `new ArrayList<>()`, we don't need to specify type (it's implicit in the left-hand side of the assignment).

<aside class="aside-note" markdown="1">
You will sometimes see the `ArrayList` class written as `ArrayList<E>`, where `E` represents a placeholder for the type that a programmer will declare a given list to hold. This is especially true in documentation. You can think of `E` as representing an arbitrary type.

Classes like `ArrayList<E>` that take another type or class as a parameter are referred to as **generic classes** or **generic types**.
</aside>

We then use a do-while loop to collect the names of each of the students in the class.

```java
// Get student names
do {
    newStudent = in.nextLine();

    if (!newStudent.equals("")) {
        students.add(newStudent);
    }

} while(!newStudent.equals(""));
```

Recall that a do-while loop is very similar to a while loop, but it has its check at the end of the loop block. This has the net effect that we'll always run the block at least once. In this example, we prompt the user for a name, which we read in via `in.nextLine()` when they hit the enter key. To finish entering names, they enter a blank line.

For each student that entered (that is, each non-empty line), we add the new string to the end of our list with `students.add(newStudent)`. The `.add()` method is a method provided by the [ArrayList Class][arraylist-class]. There are lots of other list methods

Below the do-while loop are two different for loops that demonstrate the two ways you can loop through a list in Java. Here's the first, which collects the numeric grade for each student:

```java
// Get student grades
for (String student : students) {
    System.out.print("Grade for " + student + ": ");
    Double grade = in.nextDouble();
    grades.add(grade);
}
```

This for-loop syntax is very similar to that of Python, where the analogous loop would begin: `for student in students:`. As you might expect at this point, we must declare the iterator variable `student` in Java, which was not explicitly done in Python.

The other for loop on display prints out each student's name and grade:

```java
// Print class roster
System.out.println("\nClass roster:");
double sum = 0.0;

for (int i = 0; i < students.size(); i++) {
    System.out.println(students.get(i) + " (" + grades.get(i) + ")");
    sum += grades.get(i);
}
```

In this loop, we use a *loop index* in a new style of for loop. We also introduce the syntax `students.size()` which gives us the integer representing the number of items in the list.

The syntax of this for loop probably looks very strange to you, but in fact it is not too different from what happens in Python using `range`. The syntax `for (int i = 0; i < students.size(); i++)` is exactly equivalent to the Python `for i in range(len(students))`. The first statement inside the parenthesis declares and initializes a loop variable `i`. The second statement is a Boolean expression that is our exit condition. In other words, we will keep looping as long as this expression evaluates to true. The third statement is used to increment the value of the loop variable at the end of iteration through the loop. The syntax `i++` is Java shorthand for `i + 1`. Java also supports the shorthand `i--` to decrement the value of `i`. Like Python, you can also write `i += 2` as shorthand for `i = i + 2`.

In the final lines of the program, we compute the average grade for all students:

```java
double avg = sum / students.size();
System.out.println("Average grade: " + avg);
```

### ArrayList Methods

Let's gather up a few of the `ArrayList` methods and properties that we've encountered so far, along a few new ones. While these will be the most common methods and properties that you use with this class, they by no means represent a complete list. Refer to the [official documentation on the `ArrayList` class][arraylist-class] for such a list, and for more details.

Name | Description | Example |
-----|-------------|---------|
`size` | Represents the number of items in the list, as an `int` | `students.size()`
`add` | Adds an item to the list | `students.add("Sally")`
`contains` | Checks to see if the list contains a given item, returning a boolean | `students.contains("Haley")`
`indexOf` | Looks for an item in a list, returning the index of the first occurrance of the item if contained in the list, -1 otherwise | `students.indexOf("Zach")`
`sort` | Sorts a list, use the "default" sort comparison | `students.sort()`
`toArray` | Returns an array containing the elements of the list | `students.toArray()`

### Gradebook (Java Array Version)

We were introduced to arrays in Java in a previous lesson, so let's spend a moment comparing them to lists. As we noted at that beginning of this section, we are going to use the Java `ArrayList` type to store simple sets of data. They are easy to use and more closely match the way that Python lists behave.

Why does Java have both arrays and `ArrayList`? The answer is historical, in part at least. Java is a C-style language, and arrays are the most basic data structure in C. Additionally, using an array over a `ArrayList` might be preferred in some circumstances, primarily for performance reasons (arrays operations are generally faster than list operations). Also note that *arrays are of fixed size*. You can not expand or contract an array after it is created, so you must know exactly how many elements it will need to hold when you create it. This fact is reason enough to use lists in most scenarios.

To illustrate array usage, here is a version of the gradebook program that uses arrays instead of a lists:

```java
package org.launchcode.java.demos.java4python;

import java.util.ArrayList;
import java.util.Scanner;

public class GradebookArray {

    public static void main(String[] args) {

        // Allow for at most 30 students
        int maxStudents = 30;

        String[] students = new String[maxStudents];
        double[] grades = new double[maxStudents];
        Scanner in = new Scanner(System.in);

        String newStudent;
        int numStudents = 0;

        System.out.println("Enter your students (or ENTER to finish):");

        // Get student names
        do {
            newStudent = in.nextLine();

            if (!newStudent.equals("")) {
                students[numStudents] = newStudent;
                numStudents++;
            }

        } while(!newStudent.equals(""));

        // Get student grades
        for (int i = 0; i < numStudents; i++) {
            System.out.print("Grade for " + students[i] + ": ");
            double grade = in.nextDouble();
            grades[i] = grade;
        }

        // Print class roster
        System.out.println("\nClass roster:");
        double sum = 0.0;

        for (int i = 0; i < numStudents; i++) {
            System.out.println(students[i] + " (" + grades[i] + ")");
            sum += grades[i];
        }

        double avg = sum / numStudents;
        System.out.println("Average grade: " + avg);
    }

}
```

Note that we have to decide up front how large our arrays `students` and `grades` are going to be. Thus, we make the arrays potentially larger than they need to be (or potentially smaller, if there were a large number of students). Like lists, we can index into arrays with integers (`students[i]` for example). Unlike lists, however, there is no analog of `.add()`, which adds an item to "the end" of a list. We must always access and assign array elements using an explicit index. This makes for code that can seem littered with array counters (like our friends `i` and `j`) and is more difficult to read (not to mention more error-prone).

Like lists, however, we can loop through an array using a `for-in` loop as long as we don't need to use the index of the current item. If we only wanted to print each student's name, and not their grade, at the end of our program, we could do the following:

```java
for (String student : students)
{
    System.out.println(student);
}
```

We'll use an array from time-to-time, but for the most part you should rely on lists to store collections of values, or ordered data.

## Key/Value Data: HashMaps

Just as Python provides the dictionary structure to allow us to store data as key/value pairs, Java also provides us a similar mechanism. Java also calls these objects hash maps (or maps, more generally), and they are provided by the `HashMap` class.

Considering the gradebook example, we can improve our program using a map, and storing students' grades along with their names in the same data structure. The names will be the keys, and the grades will be the values.

### Gradebook (Python Dictionary Version)

Were we to write our gradebook program above using dictionaries, we'd come up with something like this:

```python
def main():

    students = {}
    newStudent = " "

    print("Enter your students (or ENTER to finish):")

    # Get student names
    while (newStudent != ""):

        newStudent = input("Name: ")

        if newStudent != "":
            newGrade = float(input("Grade: "))
            students[newStudent] = newGrade

    # Print class roster
    print("\nClass roster:")
    for student in students:
        print(student + " (" + str(students[student]) + ")")

    avg = sum(students.values()) / len(students)
    print("\nAverage grade: " + str(avg))

if __name__ == '__main__':
    main()
```

### Gradebook (Java HashMap Version)

Let's now turn to the Java version, using instances of the `HashMap` class. As with lists, in Java we must specify the types of the objects we'll be storing when we declare a variable or parameter to be a dictionary. This means specifying both key and value data types, which are allowed to be different types for a given dictionary.

```java
package org.launchcode.java.demos.java4python;

import java.util.HashMap;
import java.util.Map;
import java.util.Scanner;

/**
 * Created by LaunchCode
 */
public class GradebookHashMap {

    public static void main(String[] args) {

        HashMap<String, Double> students = new HashMap<>();
        Scanner in = new Scanner(System.in);
        String newStudent;

        System.out.println("Enter your students (or ENTER to finish):");

        // Get student names and grades
        do {

            System.out.print("Student: ");
            newStudent = in.nextLine();

            if (!newStudent.equals("")) {
                System.out.print("Grade: ");
                Double newGrade = in.nextDouble();
                students.put(newStudent, newGrade);

                // Read in the newline before looping back
                in.nextLine();
            }

        } while(!newStudent.equals(""));

        // Print class roster
        System.out.println("\nClass roster:");
        double sum = 0.0;

        for (Map.Entry<String, Double> student : students.entrySet()) {
            System.out.println(student.getKey() + " (" + student.getValue() + ")");
            sum += student.getValue();
        }

        double avg = sum / students.size();
        System.out.println("Average grade: " + avg);
    }

}
```

We can add a new item with a `.put()` method, specifying both key and value: `students.put(newStudent, newGrade)`.

And while we don't do so in this example, we may also access dictionary elements using the `get` method. If we had a key/value pair of `"jesse"/4.0` in the `students` dictionary, we could access the grade with `Double jesseGrade = students.get("jesse")`. As with Python, variables may be used to access elements:

```java
String name = "jesse";
Double jesseGrade = students.get(name);
```

Looping through a map is slightly more complex than it is for lists. Let's look at the foreach loop from this example:

```java
for (Map.Entry<String, Double> student : students.entrySet()) {
    System.out.println(student.getKey() + " (" + student.getValue() + ")");
    sum += student.getValue();
}
```
The iterator variable, `student`, is of type `Map.Entry<String, Double>`. The class `Map.Entry` is specifically constructed to be used in this fashion, to represent key/value pairs within dictionaries. Each `Map.Entry` object has a `getKey` method and a `getValue` method, which represent (surprisingly enough!), the key and value of the map item.

If you only need to access the key of each item in a map, you can construct a simpler loop:

```java
for (String student : students.keySet())
{
    System.out.println(student);
}
```

A similar structure applies if you only need the values, using `students.getValues()`.

### HashMap Methods

Let's collect some dictionary properties and methods. As we said about lists, this is by no means a comprehensive list. For full details on all properties and methods available, see the [official documentation on the `HashMap` class][hashmap-class].

Name | Description | Example |
-----|-------------|---------|
`size` | Returns the number of items in the map, as an `int`. | `students.size()`
`keySet` | Returns a collection containing all keys in the map. This collection may be used in a for-in loop just as lists are, but the map may not be modified within such a loop. | `students.keySet()`
`values` | Returns a collection containing all values in the dictionary. This collection may be used in a for-in loop just as lists are. | `students.values()`
`add` | Add a key/value pair to a map. | `students.add("Mark", 3.5)`
`containsKey` | Returns a boolean indicating whether or not the map contains a given key. | `students.containsKey("Chris")`
`containsValue` | Returns a boolean indicating whether or not the map contains a given key. | `students.containsValue(4.0)`


We have only brushed the surface of how lists and maps work, and we leave it to you to refer to the official documentation linked below for more details. You'll certainly be using lists and maps in ways not outlined in this lesson, but with the knowledge you have now, you should be able to use Java collections and pick up new uses as you go.

## References

- [Java Collections (docs.oracle.com)][collections]
- [ArrayList Class (docs.oracle.com)][arraylist-class]
- [Dictionary Class (docs.oracle.com)][hashmap-class]
- [Arrays Tutorial (docs.oracle.com)](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/arrays.html)

[arraylist-class]: http://docs.oracle.com/javase/7/docs/api/java/util/ArrayList.html
[hashmap-class]: https://docs.oracle.com/javase/8/docs/api/java/util/HashMap.html
[extension-methods]: https://msdn.microsoft.com/en-us/library/bb383977.aspx
[collections]: http://docs.oracle.com/javase/8/docs/api/java/util/Collections.html
