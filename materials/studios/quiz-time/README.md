##### Java Track

[Back to Class 4](../../class4)


# Studio: Quiz Time!

Your next task will be to create a program that allows the user to take a quiz. This means you will have to create some questions, and get some feedback from the user.

First, the questions. We want to be able to handle multiple types of questions: multiple choice and fill in the blank.

Consider:

* What do these types of questions have in common?
* What makes these question types different?

Construct a base class (called `Question.java`) that contains the common features, and create subclasses as necessary.

Make sure that there is functionality included to display the questions, the choices (if necessary) and check to see if the answer is correct.

Create some unit tests for each of the classes that you have created.

##Putting it all together

You're now ready to present these questions as a Quiz. Create a quiz class that will choose a question, present it to the user, accept the user's response, and then tell them whether their answer was correct or incorrect.

##Submitting

Though you most likely created a few separate classes for this studio, the only file you need to submit to Vocareum is `Question.java`.