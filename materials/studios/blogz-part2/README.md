# Studio: Blogz Part 2

In this studio, we'll continue working on our `Post` and `User` classes from the last studio. If you didn't finish [Blogz Part 1][blogz-1], go back and finish up that work first.

To contextualize the work that you're about to do, think about the `User` class you created for Blogz Part 1. If you were to try to store its data in a database, it might look something like this:

![user data](user-data.png)

Tables in a relational database should have a column where each of the rows has a unique value. Such a column is called a **primary key**. We could use the `username` column for this purpose, but there are two good reasons not to:

1. It would be nice if users could change their username, but primary keys [should not be changed][pk-immutable].
2. When building large applications with persistent data, it turns out to be very useful to assign objects keys/IDs that are unique across *all* persistent object types and not just across all objects of a particular type. Obviously, a username doesn't apply to, say, a `Post` object.

Thus, we'll use unique integers for IDs in the objects that we want to store, and these IDs will be unique across all objects that are to be stored. We haven't yet discussed storing objects in a database yet, but that topic is on the horizon. When we're done, the data will look something like this.

![user data](user-data-uid.png)

## Implementing Unique IDs

We'll use the power of abstract classes to implement this behavior. We'll do this in two steps.

### Create an `Entity` class

Create an abstract class named `Entity`. It should have an instance property called `uid` (for **u**nique **id**entifier) that is an integer. Its constructor needs to set this property, which should be `private` and `final`, in a way that ensures it is unique and positive (we don't want IDs like -5). There are a few ways to do this, and we'll leave the exact implementation up to you.

Make sure `uid` has an associated getter, but no setter (why?).

### Extending the `Entity` class

The two objects that we have, `User` and `Post` should be stored in a database. In other words, they should be Entities, in the sense of extending our new `Entity` class. Add `Entity` as a superclass in each of these two class declarations.

In order to have the constructor for `Entity` called when these objects are created, we need to call `super();` in every constructor in the `User` and `Post` classes. If `super` is new to you, [read up on it][super].

Now, every `User` and `Post` object you create will have a unique integer ID automatically assigned to it when it is created. And if we want to add this behavior to any other class that we might create, all we have to do is extend `Entity` and call `super();` in its constructor!


[blogz-1]: ../blogz-part1
[math-random]: https://docs.oracle.com/javase/8/docs/api/java/lang/Math.html#random--
[super]: https://docs.oracle.com/javase/tutorial/java/IandI/super.html
[pk-immutable]: http://stackoverflow.com/questions/3838414/can-we-update-primary-key-values-of-a-table
