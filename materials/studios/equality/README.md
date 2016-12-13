---
title: "Studio: Equality"
---

Get some practice with implementing `.equals()` method by revisiting some of the classes that you've already written.

1. Write a `.equals()` method for both `Class` and `Student` from the Gradebook assignment.
2. Write a `.equals()` method for the Blogz studio classes. Make sure you have completed [Studio: Blogz Part 2][blogz2] before attempting this. At this point, `User` and `Post` inherit from `Entity`, and given the work you did in the last studio, you should be able to put `.equals()` in the `Entity` class, and there will be a natural way to test for sameness.

In each case, we leave it to you to decide how to determine of two different objects have sameness in the sense of "value equality". You need not check the value of every property of the object, but instead focus on the property or properties that are guaranteed to make sure objects are "the same."

If you're not sure where to start, revisit the [Sitepoint article][sitepoint] as well as the [walkthrough video][walkthrough].

[blogz2]: ../blogz-part2
[sitepoint]: https://www.sitepoint.com/implement-javas-equals-method-correctly/
[walkthrough]: https://www.youtube.com/watch?v=iyT7pgKzOZM
