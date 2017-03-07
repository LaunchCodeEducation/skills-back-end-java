---
title: Class 5 Prep Exercises
currentMenu: classes
---

1. **Class Design:** In IntelliJ, create a new package `school` in the `java-exercises` project that has the class `Student` that was discussed in [the reading for this class][encapsulating-data]. Add all getters and setters. Think about the access level each should have, and reduce the access level of at least one setter to less than public. Make sure you can defend your reasoning in words.
1. **More class design:** In the `school` package, create a class `Course` with at least three fields. Before diving into IntelliJ, use pen and paper to work through what these might be, including the data type, access level, and whether it makes sense for any of them to be static or final. At least one of your fields should be an `ArrayList` or `HashMap`, and you should use your `Student` class.
1. **More Cheese:** More CheeseMvc, that is. Fire up this Spring Boot application, and create a new package within `org.launchcode` named `models`. Within that package, create a `Cheese` class that has `name` and `description` properties, along with getters and setters. Refactor the `CheeseController` to use `Cheese` objects rather than the strings that were used previously. You'll need to update your views as well.
1. **Review:** With a pen and paper, write down descriptions of each of the following field types, along with an example of a situation where you might use each: public field, private field, static field, final field. If you get stuck, review the lesson on [encapsulating data][encapsulating-data].


[encapsulating-data]: ../../java4python/classes-and-objects-encapsulating-data/
