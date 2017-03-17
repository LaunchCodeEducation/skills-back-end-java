---
title: Class 7 Prep Exercises
currentMenu: classes
---

- **Class design:** Pick one or more of the following groups of classes, and diagram your design for each (including methods and properties). Be sure to use lines/arrows to indicate inheritance relationships, and to include data and behavior that somebody using your classes would likely want.
    - Shape, Square, Rectangle, Circle
    - Computer, Desktop, Laptop, SmartPhone
    - Student, GraduateStudent, UndergraduateStudent
- **Class implementation:** For one of the groups of classes above, implement your design and test it in a `Program.cs` class.
- **Abstract class design:** Consider the group of classes that you designed. Suppose you had a web program that used these classes, and you needed to assign an unique ID to every object created from one of these classes within the application. In other words, each such class should have an `Id` property, and no two objects created from any of the classes may have the same ID value. Create an abstract class, `AbstractEntity`, that contains the behavior for assigning and accessing such a unique ID for each class that extends it. Add this class to your program above, and add `AbstractEntity` to the class hierarchy in the correct place.
