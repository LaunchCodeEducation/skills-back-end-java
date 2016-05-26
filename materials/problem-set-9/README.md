##### [Java Track](../..)

# PSET: Student and Course

###Synopsis

This problem set will give you some practice with encapsulation in Java, as well as some practice using git.

###Using Encapsulation

Your task is to generate two classes: Student and Course

First, take a look at the StudentAndCourseTest.java file. In that file you will see unit tests. Unfortunately, none of the tests will currently pass. You can use these tests as you develop your classes to verify whether they are working as intended. You are also encouraged to write some additional tests of your own. Be sure to test often!

Next, start crafting a Student class. Students have lots of wonderful properties, but we are primarily interested in these:

* Name (first and last)
* Student ID
* Credits
* GPA

Add these properties to your class, create a constructor, create some getters and setters, and test!

Now we want to add some functionality to our Student class. Add the following methods:

**`getClassStanding()`** - returns the students class standing based on how many credits they have:

- Fewer than 30: Freshman
- More than or equal to 30 but less than 60: Sophomore
- More than or equal to 60 but less than 90: Junior
- More than or equal to 90: Senior

**`submitGrade()`** - this method takes in a course grade (as a value between 0 and 4) and the number of credits for a course, and updates the students GPA accordingly. GPA can be computed by the following formula:

Take the number of credits for a course and multiply it by the grade for that course. This is called the quality score. GPA is computed as the sum of all of the quality scores for each course the student has taken, divided by the total number of credits.

You should also round the GPA so that it only contains three digits after the decimal.

**`computeTuition()`** - this method returns the total amount of tuition the student has paid. The average cost of tuition for 1 semester in the United States is roughly $20,000. Assume that there are 15 credit hours per semester, and come up with a strategy to handle any "leftover" credits.

**`createLegacy()`** - it is not unusual for two students to meet at college, get married, start a family, and send their children to the same school. This method should take a Student object as a parameter then create a new Student object based on the following criteria:

- Use one parent's full name as the baby's first name, the other parent's full name as the baby's last name
- Assign the baby a student ID that is the sum of its parents IDs.
- The legacy's estimated GPA will be the average of its parents GPA.
- The legacy's estimated number of credits will be the maximum of its parents credits

Hint: it may be useful to create an additional constructor!

**`toString()`** - returns the students full name and student ID

Before moving on, make sure that the tests pass!

###Creating a Course class

The Course class should contain the following properties:

* Name
* Credits
* Number of seats
* Roster of Students

Add these properties to your class, create a constructor, create some getters and setters, and test!

Next, implement the following functionality:

**`addStudent()`** - returns a boolean based on whether or not the student was successfully added to the course. Check to make sure that the student has not already enrolled, and update the number of seats remaining.

**`generateRoster()`** - Returns a String that represents a roster with all of the students in the course. Make sure to omit "empty" seats!

**`averageGPA()`** - returns the average GPA of all students enrolled in the course. Make sure to omit "empty" seats!

**`toString()`** - should contain the course number and credits

###How to Submit

Once you are finished, make sure all of the tests pass.

Then, submit your code on Vocareum. There is a script that will grade your submission automatically. Note: if your code has a package declaration (it will say "package" towards the top), you will need to remove this before submitting your code.

###Additional Features

This pset could also be extended to include `Department`, `Instructor`, `University`, and  `Semester` classes. Try designing some of these and incorporating them into this problem set if you have time. Don't forget to test!