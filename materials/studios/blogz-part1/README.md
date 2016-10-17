# Studio: Blogz Part 1

In Unit 2, we built a blog application in Python, [Blogz][blogz]. It was a web application with all of the basic features a blog needs: authentication, post listings, validation, and so on.

We're going to work towards building essentially the same application in Java, using the Spring MVC web framework. To that end, we'll start modeling some of our classes now, using new Java concepts as we learn them.

When creating the classes below, be sure to create getters and setters for the properties, as necessary. Not all properties should have setters, so think about which properties should be able to be updated after the object is first created.

For this studio, complete  the following tasks, writing unit tests in a class `PostAndUserTest` as you go.

1. Create a `User` class with properties to represent username and hashed password. The constructor should take in a password in plain text (that is, non-hashed) and call a private static method `hashPassword` to generate the hashed password before setting the appropriate instance property. For now, this method can just return the the password that is passed in, unchanged. We'll implement hashing later on.
1. Write a method to verify a password against its hash, `isValidPassword`.
1. In the `User` class, write a static method `isValidPassword` that returns a boolean signifying whether or not the given string is valid. A username should be considered valid if it is 4-12 characters long, starts with a letter, and contains only letters, numbers, `-`, and `_`. This check should happen in the constructor, and an appropriate exception should be thrown if the password is not valid. For this task, use the [`Pattern` class][pattern-class], following the pattern used near the top of the linked reference page. The regular expression to use is: `[a-zA-Z][a-zA-Z0-9_-]{4,11}`.
1. Add a static property of type `List<User>` to hold the list of all users along with a method to return this list. This is similar to what you did in [Gradebook Revisited][gradebook-revisited]. Note that `List` is an interface, so you'll need to choose an appropriate implemented type, such as `ArrayList`, when initializing this property.
1. Create a `Post` class with properties to represent a blog post's `body` and `title`, along author and `created` properties (this last one should be of type `Date` from the `java.util.Date` package). The `created` property should not be updated after it is set, to declare it as `final` (and [read up on final properties][final-properties] while you're at it): `private final Date created;`
1. Add a property to keep track of when the post is modified. Unlike `created`, this property should be modifiable, and your methods should update it appropriately when changing the `title` or `body` fields.
1. Finally, make sure you've tested all of the behaviors that you've coded.

[blogz]: http://education.launchcode.org/web-fundamentals/assignments/blogz/
[gradebook-revisited]: ../exercises/gradebook-revisited
[final-properties]: https://en.wikipedia.org/wiki/Final_(Java)
[pattern-class]: https://docs.oracle.com/javase/8/docs/api/java/util/regex/Pattern.html
