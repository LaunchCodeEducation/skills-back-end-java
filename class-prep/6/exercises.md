---
title: Class 6 Prep Exercises
currentMenu: classes
---

1. In your `Student` class, update the code to reflect the constructor additions that were added in [Classes and Objects: Encapsulating Behavior](../../java4python/classes-and-objects-encapsulating-behavior/). Complete the implementations of `addGrade` and `getGradeLevel`. For the method `addGrade`, you'll need to update the student's GPA. To do this, note that GPA is computed via the formula:
    ```nohighlight
    gpa = (total quality score) / (total number of credits)
    ```
    The total quality score is the sum of the quality scores of all classes, and the quality score for a class is found by multiplying the point score (0.0-4.0) by the number of credits. For example, if a student received an A (worth 4 points) in a 3-credit course and a B (worth 3 points) in a 4-credit course, their quality score would be: 4.0 \* 3 + 3.0 \* 4 = 24. And their GPA would then be 24 / 7 = 3.43.

    To update the GPA, you'll need to update the quality score. You can compute the existing quality score by calculating `gpa * numberOfCredits`. Then update the quality score and `numberOfCredits`, and compute the new GPA with the new numbers.

    In `getGradeLevel` you will need to determine the level of the student based on the number of credits: freshman (0-29 credits), sophomore (30-59 credits), junior (60-89 credits), or senior (90+ credits).
1. Add custom `equals()` and `toString()` methods to the `Student` class.
2. Add custom `equals()` and `toString()` methods to the `Course` class which you started in the [exercises for class 5](../5/exercises.html).
