---
title: 'Studio: Quiz Time!'
currentMenu: studios
---

For this studio, you will design and build a console program that allows the user to take a quiz. This means you will have to create some questions, and get some input from the user.

First, the questions. We want to be able to handle multiple types of questions:
- **Multiple choice**: a question with a fixed set of possible answers, of which only one may be chosen and only one answer is correct
- **Checkbox**: a question with a fixed set of possible answers, of which any number may be chosen; there is one correct combination of choices
- **True/False**: a question that has a true/false answer

## Design

In order to design your program, consider:

* What do these types of questions have in common?
* What makes these question types different?

Use class diagrams to design a base class (called `Question`) that contains the common features, and design subclasses for each of the question types. For each question type be sure to include:
- Class name
- Fields and properties with access modifiers
- Methods with access modifiers
- Any inheritance relationship

Should any of the question classes be abstract? If so, should any of its methods be abstract?

Make sure that there is functionality included to display the questions, to display the possible answers, and to check to see if the answer(s) is correct.

Then design the `Quiz` class. A quiz has a list of questions, and we should be able to:
- Add questions
- Run, or carry out, the quiz
- Grade the quiz

## Implementation

Code the classes that you designed above. If you like, get some feedback on your design by talking through it with a classmate.

## Putting it all together

You're now ready to present these questions as an actual. Create a class named `QuizRunner` with only a `main` method. The program should create several questions, present them to the user, accept the user's responses, and then tell them whether their answers were correct or incorrect.

## Bonus Missions

1. Add a short answer question type that includes validation behavior to only allow the user to enter text with less than 80 characters.
2. Add a couple of more question types to your program:
    - Linear scale: a question that allows the user to provide a numeric response within an integer scale, which may vary from question to question. For instance, it could be 1-3 for on linear scale question, and 1-5 for another.
    - Paragraph: Similar to short answer, but allows for responses up to 500 characters.
