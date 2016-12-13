---
title: "Exercise: Gradebook Revisited"
---

For this exercise, you'll revisit your code for [Gradebook][gradebook].

## Refactoring `Student`

In the `Student` class, we created a method `createLegacy` that takes in two `Student` objects (representing two parents) and creates a new `Student` object that represents this child of those parents. The method signature looks something like this:

```java
public Student createLegacy(Student firstParent, Student secondParent)
```

This method doesn't use any instance properties on the object that calls it, and it doesn't really need an existing object to be used. As long as we have two parents, we should be able to create the child. Refactor this method (and the associated unit tests) so that `createLegacy` is a static method.

## Enhancing `Course`

If you imagine your program being used to manage class enrollment at a university, or at an organization like LaunchCode, there are a lot of additional features you'd want to be able to use. In particular, it would be nice to get a list of *all* classes being offered.

In your `Course` class, add a static method `getAllCourses` that returns an ArrayList of all courses. You will need a way to collect all of your courses (using a static class member). Think about how each new course should be added to the list of all courses. Where can you do this in a way that guarantees that every class is accounted for?

Be sure to add some unit tests to test your new code! When doing so, keep in mind that your code will accumulate all `Course` objects created throughout your test file, and not just those created within a specific method.

If you're relatively new to `ArrayList`, read about them at [Java for Python Programmers][java-for-python-arraylist].

[gradebook]: ..assignments/gradebook
[java-for-python-arraylist]: http://interactivepython.org/runestone/static/java4python/Java4Python.html#list
