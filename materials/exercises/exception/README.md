##### Java Track

[Back to Class 5 prep](../../class5-prep)


# Exercise: I take Exception to that!

Your goal for this exercise is to add some exceptions into your code. Think about the methods that you've made in your `Robot` classes. How could they be used incorrectly? Write some code that checks for these situations and throws an Exception.

Be careful, not every situation is worthy of an Exception! Remember that Exceptions are primarily for other programmers not your users. Anything that a user might do incorrectly (such as typing in a password incorrectly) should be handled with validation.

As an example of what you might use exceptions for, recall the [strategy pattern exercise](../strategy-pattern). If someone were to try using `doNextMove()` before `setBehavior()` was called, this should be an exception.

Once you have implemented a few exceptions, write some unit tests for them. Use the `try/catch` structure.