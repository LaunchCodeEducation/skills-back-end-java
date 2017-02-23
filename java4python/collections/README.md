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

To write the Java version of this program we will have to introduce several new Java concepts. We will see the Java equivalent of a list, provided by the class `List`. We will also introduce different kinds of for loops used in Java.

```csharp
using System;
using System.Collections.Generic;
using System.Linq;

namespace Gradebook
{
    public class Program
    {
        public static void Main(string[] args)
        {
            List<string> students = new List<string>();
            List<double> grades = new List<double>();
            string newStudent;

            Console.WriteLine("Enter your students (or ENTER to finish):");
            do
            {
                newStudent = Console.ReadLine();
                if (newStudent != "")
                {
                    students.Add(newStudent);
                }
            }
            while (newStudent != "");

            // Get student grades
            foreach (string student in students)
            {
                Console.Write("Grade for " + student + ": ");
                double newGrade = double.Parse(Console.ReadLine());
                grades.Add(newGrade);
            }

            // Print class roster
            Console.WriteLine("\nClass roster:");
            for (int i = 0; i < students.Count; i++)
            {
                Console.WriteLine(students[i] + " (" + grades[i] + ")");
            }

            double sum = grades.Sum();
            double avg = sum / grades.Count;
            Console.WriteLine("Average grade: " + avg);

            Console.ReadLine();
        }
    }
}
```

Before going any further, I suggest you try to compile the above program and run it.

Once you've done that, let's look at what is happening in the Java source. The

```csharp
List<string> students = new List<string>();
List<double> grades = new List<double>();
string newStudent;
```

Here we declare and initialize two objects, `students` and `grades`, which appears to be of type `List<string>` and `List<double>`, respectively. A `List` in Java is very similar to a list in Python, with one imporant difference. Unlike Python, where lists can contain any type of value, in Java we must let the compiler know what kind of objects our list is going to contain. In the case of `students`, the `List` will contain values of type `string` (representing the names of the students), so we use the `List<string>` syntax to inform the compiler that we intend to fill our list with strings. Similarly, `grades` will hold exclusively values of type `double` and is declared to be of type `List<double>`.

We also initialize each list by creating a new, empty list. Note that when we call the `List` constructor, as in `new List<string>()`, we must specify the same type as we do in the declaration.

<aside class="aside-note" markdown="1">
You will sometimes see the `List` class written as `List<T>`, where `T` represents a placeholder for the type that a programmer will declare a given list to hold. This is especially true in documentation. You cna think of `T` as reprsenting an arbitrary type.

Classes like `List<T>` that take another type or class as a parameter are referred to as **generic classes** or **generic types**.
</aside>

We then use a do-while loop to collect the names of each of the students in the class.

```csharp
Console.WriteLine("Enter your students (or ENTER to finish):");
do
{
    newStudent = Console.ReadLine();
    if (newStudent != "")
    {
        students.Add(newStudent);
    }
}
while (newStudent != "");
```

Recall that a do-while loop is very similar to a while loop, but it has it's check at the end of the loop block. This has the net effect that we'll always run the block at least once. In this example, we prompt the user for a name, which we read in via `Console.ReadLine()` when they hit the enter key. To finish entering names, they enter a blank line.

For each student that entered (that is, each non-empty line), we add the new string to the end of our list with `students.Add(newStudent)`. The `.Add()` method is a method provided by the [List Class][list-class]. There are lots of other list methods

Below the do-while loop are two different for loops that demonstrate the two ways you can loop through a list in Java. Here's the first, which collects the numeric grade for each student:

```csharp
// Get student grades
foreach (string student in students)
{
    Console.Write("Grade for " + student + ": ");
    double newGrade = double.Parse(Console.ReadLine());
    grades.Add(newGrade);
}
```

This for-loop syntax is very similar to that of Python, where the analogous loop would begin: `for student in students:`. As you might expect at this point, we must declare the iterator variable `student` in Java, which was not explicitely done in Python.

The other for loop on display prints out each student's name and grade:

```csharp
// Print class roster
Console.WriteLine("Student roster:");
for (int i = 0; i < students.Count; i++)
{
    Console.WriteLine(students[i] + " (" + grades[i] + ")");
}
```

In this loop, we use a *loop index* in a new style of for loop. We also introduce the syntax `students.Count` which gives us the integer representing the number of items in the list.

The syntax of this for loop probably looks very strange to you, but in fact it is not too different from what happens in Python using `range`. The syntax `for (int i = 0; i < students.Count; i++)` is exactly equivalent to the Python `for i in range(len(students))`. The first statement inside the parenthesis declares and initializes a loop variable `i`. The second statement is a Boolean expression that is our exit condition. In other words, we will keep looping as long as this expression evaluates to true. The third statement is used to increment the value of the loop variable at the end of iteration through the loop. The syntax `i++` is Java shorthand for `i + 1`. Java also supports the shorthand `i--` to decrement the value of `i`. Like Python, you can also write `i += 2` as shorthand for `i = i + 2`.

In the final lines of the program, we compute the average grade for all students:

```csharp
double sum = grades.Sum();
double avg = sum / grades.Count;
Console.WriteLine("Average grade: " + avg);

Console.ReadLine();
```

The only line worth remarking on is the first, which includes the method call `grades.Sum()`. For lists with numeric data, `.Sum()` will return the sum of all of items in the list.

### List Methods and Properties

Let's gather up a few of the `List` methods and properties that we've encountered so far, along a few new ones. While these will be the most common methods and properties that you use with this class, they by no means represent a complete list. Refer to the [official documentation on the `List` class][list-class] for such a list, and for more details.

Name | Type | Description | Example |
-----|------|-------------|---------|
`Count` | Property | Represents the number of items in the list, as an `int` | `students.Count`
`Add` | Method | Adds an item to the list | `students.Add("Sally")`
`Contains` | Method | Checks to see if the list contains a given item, returning a boolean | `students.Contains("Haley")`
`IndexOf` | Method | Looks for an item in a list, returning the index of the first occurance of the item if contained in the list, -1 otherwise | `students.IndexOf("Zach")`
`Sort` | Method | Sorts a list, use the "default" sort comparison | `students.Sort()`
`ToArray` | Method | Returns an array containing the elements of the list | `students.ToArray()`

### Gradebook (Java Array Version)

We were introduced to arrays in Java in a previous lesson, so let's spend a moment comparing them to lists. As we noted at that beginning of this section, we are going to use the Java `List` type to store simple sets of data. They are easy to use and more closely match the way that Python lists behave.

Why does Java have both arrays and `List`? The answer is historical, in part at least. Java is a C-style language, and arrays are the most basic data structure in C. Additionally, using an array over a `List` might be preferred in some circumstances, primarily for performance reasons (arrays operations are generally faster than list operations). Also note that *arrays are of fixed size*. You can not expand or contract an array after it is created, so you must know exactly how many elements it will need to hold when you create it. This fact is reason enough to use lists in most scenarios.

To illustrate array usage, here is a version of the gradebook program that uses arrays instead of a lists:

```csharp
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace GradebookArray
{
    public class Program
    {
        public static void Main(string[] args)
        {
            // Allow for at most 30 students
            int maxStudents = 30;

            string[] students = new string[maxStudents];
            double[] grades = new double[maxStudents];

            string newStudent;
            int numStudents = 0;

            Console.WriteLine("Enter your students (or ENTER to finish):");
            do
            {
                newStudent = Console.ReadLine();
                if (newStudent != "")
                {
                    students[numStudents] = newStudent;
                    numStudents++;
                }
            }
            while (newStudent != "" && numStudents < maxStudents);

            // Get student grades
            for (int i = 0; i < numStudents; i++)
            {
                Console.Write("Grade for " + students[i] + ": ");
                double studentGrade = double.Parse(Console.ReadLine());
                grades[i] = studentGrade;
            }

            // Print class roster, summing grades as we go
            Console.WriteLine("\nClass roster:");
            double sum = 0;

            for (int j = 0; j < numStudents; j++)
            {
                Console.WriteLine(students[j] + " (" + grades[j] + ")");
                sum += grades[j];
            }

            double avg = sum / numStudents;
            Console.WriteLine("Average grade: " + avg);

            Console.ReadLine();
        }
    }
}
```

Note that we have to decide up front how large our arrays `students` and `grades` are going to be. Thus, we make the arrays potentially larger than they need to be (or potentially smaller, if there were a large number of students). Like lists, we can index into arrays with integers (`students[i]` for example). Unlike lists, however, there is no analog of `.Add()`, which adds an item to "the end" of a list. We must always access and assign array elements using an explicit index. This makes for code that can seem littered with array counters (like our friends `i` and `j`) and is more difficult to read (not to mention more error-prone).

Like lists, however, we can loop through an array using a `foreach` loop as long as we don't need to use the index of the current item. If we only wanted to print each student's name, and not their grade, at the end of our program, we could do the following:

```csharp
foreach (string student in students)
{
    Console.WriteLine(student);
}
```

We'll use an array from time-to-time, but for the most part you should rely on lists to store collections of values, or ordered data.

## Key/Value Data: Dictionaries

Just as Python provides the dictionary structure to allow us to store data as key/value pairs, Java also provides us a similar mechanism. Java also calls these objects dictionaries, and they are provided by the `Dictionary` class.

Considering the gradebook example, we can improve our program using a dictionary, and storing students' grades along with their names in the same data structure. The names will be the keys, and the grades will be the values.

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

### Gradebook (Java Dictionary Version)

Let's now turn to the Java version, using instances of the `Dictionary` class. As with lists, in Java we must specify the types of the objects we'll be storing when we declare a variable or parameter to be a dictionary. This means specifying both key and value data types, which are allowed to be different types for a given dictionary.

```csharp
using System;
using System.Collections.Generic;
using System.Linq;

namespace GradebookDict
{
    public class Program
    {
        public static void Main(string[] args)
        {
            Dictionary<string, double> students =
                new Dictionary<string, double>();
            string newStudent;

            Console.WriteLine("Enter your students (or ENTER to finish):");
            do
            {
                Console.Write("name: ");
                newStudent = Console.ReadLine();
                if (newStudent != "")
                {
                    // Get the student's grade
                    Console.Write("grade: ");
                    double newGrade = double.Parse(Console.ReadLine());

                    students.Add(newStudent, newGrade);
                }
            }
            while (newStudent != "");

            // Print class roster
            Console.WriteLine("\nClass roster:");
            foreach (KeyValuePair<string, double> student in students)
            {
                Console.WriteLine(student.Key + " (" + student.Value + ")");
            }

            double sum = students.Values.Sum();
            double avg = sum / students.Count;
            Console.WriteLine("Average grade: " + avg);

            Console.ReadLine();
        }
    }
}
```

As with lists, we can add a new item with a `.Add()` method, but this time we must specify both key and value: `students.Add(newStudent, newGrade)`.

And while we don't do so in this example, we may also access dictionary elements using bracket notation. If we had a key/value pair of `"jesse"/4.0` in the `students` dictionary, we could access the grade with `double jesseGrade = students["jesse"]`. As with Python, variables may be used to access elements:
```csharp
string name = "jesse";
double jesseGrade = students[name];
```

Looping through a dictionary is slightly more complex than it is for lists. Let's look at the foreach loop from this example:

```csharp
foreach (KeyValuePair<string, double> student in students)
{
    Console.WriteLine(student.Key + " (" + student.Value + ")");
}
```
The iterator variable, `student`, is of type `KeyValuePair<string, double>`. The built-in class `KeyValuePair` is specifically constructed to be used in this fashion, to represent key/value pairs within dictionaries. Each `KeyValuePair` object has a `Key` property and a `Value` property, which represent (surprisingly enough!), the key and value of the dictionary item.

If you only need to access the key of each item in a dictionary, you can construct a simpler loop:

```csharp
foreach (string student in students.Keys)
{
    Console.WriteLine(student);
}
```

A similar structure applies if you only need the values, using `students.Values`. One thing to note is that when iterating through a dictionary in either way we've presented, it is not allowed to modify the dictionary elements in any way. In fact, this is why we moved the entry of grades in our program up to the do-while loop, so the grade can be set at the same time as the student's name. If you want to use a foreach loop with a dictionary and be able to update items within the dictionary, you'll need to [do a little extra work](http://stackoverflow.com/questions/1070766/editing-dictionary-values-in-a-foreach-loop).

### Dictionary Methods

Let's collect some dictionary properties and methods. As we said about lists, this is by no means a comprehensive list. For full details on all properties and methods avaialble, see the [official documentation on the `Dictionary` class][dict-class].

Name | Type | Description | Example |
-----|------|-------------|---------|
`Count` | Property | The number of items in the dictionary, as an `int`. | `students.Count`
`Keys` | Property | A collection containing all keys in the dictionary. This collection may be used in a `foreach` loop just as lists are, but the dictionary may not be modified within such a loop. | `students.Keys`
`Values` | Property | A collection containing all values in the dictionary. This collection may be used in a `foreach` loop just as lists are, but the dictionary may not be modified within such a loop. | `students.Values`
`Add` | Method | Add a key/value pair to a dictionary. | `students.Add("Mark", 3.5)`
`ContainsKey` | Method | Returns a boolean indicating whether or not the dictionary contains a given key. | `students.ContainsKey("Chris")`
`ContainsValue` | Method | Returns a boolean indicating whether or not the dictionary contains a given key. | `students.ContainsValue(4.0)`


We have only brushed the surface of how lists and dictionaries work, and we leave it to you to refer to the official documentation linked below for more details. You'll certainly be using lists and dictionaries in ways not outlined in this lesson, but with the knowledge you have now, you should be able to use Java collections and pick up new uses as you go.

## References

- [Java Collections (msdn.microsoft.com)][collections]
- [List Class (msdn.microsoft.com)][list-class]
- [Dictionary Class (msdn.microsoft.com)][dict-class]
- [Arrays Tutorial (msdn.microsoft.com)](https://msdn.microsoft.com/en-us/library/aa288453(v=vs.71).aspx)
- [Extension Methods (msdn.microsoft.com)][extension-methods]

[list-class]: https://msdn.microsoft.com/en-us/library/6sh2ey19(v=vs.110).aspx
[dict-class]: https://msdn.microsoft.com/en-us/library/xfhwa508(v=vs.110).aspx
[extension-methods]: https://msdn.microsoft.com/en-us/library/bb383977.aspx
[collections]: https://msdn.microsoft.com/en-us/library/mt654013.aspx
