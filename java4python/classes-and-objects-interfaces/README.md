---
title: 'Classes and Objects: Interfaces and Polymorphism'
currentMenu: java4python
---

The third and last **Pillar of Object-Oriented Programming** that we'll explore is **polymorphism**.

## Polymorphism

From our [glossary](../../glossary/):

<aside class="aside-definition" markdown="1">
**polymorphism**: An object-oriented mechanism that allows for objects of different types to be used in the same way.
</aside>

We've already encountered polymorphism made possible by inheritance. Recall the example from the [lesson on inheritance](../classes-and-objects-inheritance/#inheritance-in-java) where we defined a `Cat` class, with subclasses `HouseCat` and `Tiger`.

Suppose we had a `CatOwner` like below.

```java
public class CatOwner
{
    private Cat pet;

    public CatOwner(Cat pet) {
        this.pet = pet;
    }

    public void feedTheCat() {

        // ...code to prepare the cat's meal...

        pet.eat();
    }
}
```

The method `feedTheCat` uses the field `pet`, which is  of type `Cat`, but since a `HouseCat` *is a* `Cat` via inheritance, it is perfectly acceptable to use an instance of `HouseCat` to fill the `pet` field.

```java
HouseCat suki = new HouseCat("Suki", 12);
CatOwner Annie = new CatOwner (suki);

Annie.feedTheCat();
```

Similarly, `feedTheCat` can accept `Tiger` instances as well. This is because the only thing that the method requires is that the input parameter has the methods defined within `Cat`, and via inheritance, both of the subclasses satisfy this requirement. This is an example of polymorphism.

There's one more object-oriented mechanism that empowers us to code in a polymorphic way: the interface.


## Interfaces

An **interface** is a formal construction within Java that allows us to create a contract that classes can choose to fulfill. A Java interface may contain:

- Constants (that is, `static final` fields)
- Method signatures
- Static methods
- Default methods

<aside class="aside-note" markdown="1">
An interface may also contain "nested types", which we won't discuss in this class.
</aside>

The most useful aspect of interfaces is to specify method signatures. Recall that a method signature includes the name, parameters, and return type of a method, but no body. From the list above, we've seen every type of member except for **default methods**. We'll describe these briefly below.

Here's a simple example:

```java
public interface Feedable
{

    void eat();

}
```

And here are some observations:

- An interface is defined similarly to an abstract class, using the keyword `interface`. (We'll discuss similarities and differences between interfaces and abstract classes below.)
- `eat` only has a signature. We do not allowed to provide a body for methods defined in interfaces.
- `eat` does not have an access modifier. Interface members are always `public`, and while we may use the `public` modifier, it's unnecessary. An interface method may not be less than public.
- The interface itself is declared `public`, which means any other class may use it. We may also leave off `public`, making the interface package-private, or usable only within the same package.
- The name is indicative of the behavior that the interface is intended to describe. While this is only a convention, most interfaces have names that are adjectives. Whatever you do, use meaningful names!

The purpose of an interface is to define a contract that classes may choose to uphold. In doing so, we say that they "implement the interface". The syntax for doing so is similar as that for inheritance. Here's how we can use this interface in defining our `Cat` class.

```java
public class Cat implements IFeedable
{

    @Override
    public void eat()
    {
        // method implementation
    }

    // ...rest of the class definition...

}
```

Since we've declared that `Cat` implements `Feedable`, we have to provide an implementation for the `eat` method, with signature as specified in the interface definition. Note that we use `@Override`, just as we do when overriding an inherited method in a subclass. Like that situation, using `@Override` when implementing methods defined in an interface will enable compiler checking that your method does indeed match that of the interface.

<aside class="aside-note" markdown="1">
You may extend a class and implement an interface at the same time:
```java
public class MyClass extends MySubclass implements MyInterface
{
    // ...code...
}
```
</aside>

As with classes, interfaces define a type that can be used when declaring fields, parameters, and local variables.

Using an interface allows us to relax the requirements on our code elsewhere, thus making it more extensible and adaptable. For example, here's how we might modify `CatOwner`:

```java
public class CatOwner
{
    private Feedable pet;

    public CatOwner(Feedable pet) {
        this.pet = pet;
    }

    public  void FeedTheCat() {

        // ...code to prepare the cat's meal...

        pet.eat();
    }
}
```

Note that we've declared the property `pet` to be of type `Feedable`. This class assumes that the only behavior of `pet` that we'll need within the class is the ability to `eat`. But if that's all we need, then we should relax the requirements on the `pet` property as much as possible. In fact, there's nothing specific about cats in this class, so we might make our code a step more abstract and flexible by doing the following:

```java
public class PetOwner
{
    private Feedable pet;

    public PetOwner(Feedable pet) {
        this.pet = pet;
    }

    public void FeedThePet() {

        // ...code to prepare the pet's meal...

        pet.eat();
    }
}

public class CatOwner extends PetOwner
{
    // code that requires Cat-specific behavior
}
```

We've created a `PetOwner` class that encapsulates the behavior that could apply to any pet (any `Feedable`, actually), and have `CatOwner` extend `PetOwner`. This allows other classes to extend `PetOwner` to make, say, a `DogOwner` that knows how to play fetch with their pet, or a `HorseOwner` that knows how to ride their pet. It also reduces the dependency of the `FeedThePet` method on the specific type of pet, since it doesn't need to care.

To use this new class design, we can look at the exact same sample code from above:

```java
HouseCat suki = new HouseCat("Suki", 12);
CatOwner Annie = new CatOwner(suki);

Annie.feedTheCat();
```

While the code usage here remains unchanged, the opportunities for using the classes we've built are much wider since the defined classes are no longer dependent on the specific `Cat` class. Also notice that we've used the object `suki` in a polymorphic way, creating it as a `HouseCat`, but using it as an `Feedable` within the `CatOwner` class.

<aside class="aside-note" markdown="1">
Like inheritance, interfaces enable polymorphic usage of objects. We can create an object, and then use it in different contexts based on any interfaces that it implements.
</aside>

One final note before discussing how we might use interfaces in our code: *Interfaces may not be created like objects are, with* `new`. You may implement an interface, or declare variables and parameters as interface types. You can not, however, create an interface.

## Interfaces In The Wild

The most immediate situations that you'll encounter in which you'll want to use interfaces are when working with interfaces and classes that are part of Java. Here are just a few.

### Comparable&lt;T&gt;

**Purpose**: A class implements `Comparable<T>` in order to allow comparison -- in a "greater than" and "less than" sense -- to another instance of the class. This is a "parameterized" interface, which means that when using it you need to specify the class that it will be comparing. For example, `Comparable<Job>` would compare `Job` objects.

**Important Methods**: `compareTo(T)`

[Comparable&lt;T&gt; Documentation](http://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html)

### Comparator&lt;T&gt;

**Purpose**: Compare two objects of a given class. When wanting to compare objects from a given class, you can create several different `Comparator` classes to allow different types of comparison and ordering. The class that you want to compare objects of *does not* implement the interface itself.

**Important Methods**: `compare(T, T)`

[Comparator&lt;T&gt; Documentation](http://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html)

This interface can be used to determine, given two objects of the given type, which one is "greater" than the other. It is also used by collections such as [ArrayList<T>](http://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html) to sort its contents with the [sort](http://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html#sort-java.util.Comparator-) method.

### Iterable&lt;T&gt;

**Purpose**: Enable iteration over a collection of objects using for-each loop

**Important Methods**: `iterator()`

[Iterable&lt;T&gt; Documentation](http://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html)

This interface is implemented by the `ArrayList<T>` class, which we've been using throughout this course.

**Example**

```java
Iterable<String> collection = new ArrayList<>();

// Add items to the collection

for (string item : collection) {
    // do something with each item
}

```

### List&lt;T&gt;

**Purpose**: Enable access to objects in a collection by index. In other words, enable ordered collections.

**Important Methods**: `add(int, T)`, `get(int)`, `indexOf(T)`

[List&lt;T&gt; Documentation](http://docs.oracle.com/javase/8/docs/api/java/util/List.html)

This interface is also implemented by the `ArrayList<T>` class, which we've been using throughout this course. In face, `List<T>` extends `Iterable<T>`. An interface may extend another interface, in the same way that classes may extend each other.

**Example**

```java
List<String> collection = new ArrayList<>();

// Add items to the collection

// Get the first item
String firstItem = collection.get(0);
```

### Map<K, V>

**Purpose**: Represent a collection of key/value pairs.

**Important Methods**: `get(K)`, `containsKey(K)`, `put(K, V)`

[Map<K, V> Documentation](http://docs.oracle.com/javase/8/docs/api/java/util/Map.html)

This interface is implemented by the `HashMap<K, V>` class, which we've been using throughout this course.

**Example**

```java
Map<String, String> collection = new HashMap<>();

// Add items to the collection

// Get item with key "hello"
String hello = collection.get("hello");
```

### Default Methods

We mentioned above that we would introduce **default methods**, so let's do that now. A default method has a body. In other words, it is a fully-formed method. It is preceded with the `default` keyword, and it may be overridden by classes implementing the interface.

```java
public interface MyInterface {

    void someMethod();

    default void someOtherMethod() {
        // ...code goes here...
    }

}
```

Default methods were added to Java 8 (the most recent version of Java), and thus are relatively new. Their intended purpose is to allow programmers to add a method to an interface that has already been released, while not forcing those already using the interface to add new code to their classes. You should avoid using default methods in all other situations other than the one described here. *Do not use default methods when writing a new interface.*

## Comparison to Abstract Classes

We mentioned above -- and you likely noticed yourself -- that interfaces share some characteristics with abstract classes. Recall that an abstract class is one declared with the `abstract` keyword. You may not create an object from an abstract class, and like an interface, an abstract class is allowed to contain methods that only have signatures (that is, they don't have implementation code).

The main differences between interfaces and abstract classes are:
- You *implement* an interface, while you *extend* an abstract class. The net effect of this is that a class may implement many interfaces while also extending a class.
- Abstract methods may contain non-constant fields, while interfaces may not.
- Interfaces may only contain implementation code inside of default or static methods, thus they can't contain methods that need to be shared by class instances in the same way that abstract classes are. In particular, any method that needs to use an instance property may not be part of an interface, since interfaces don't have instance properties.
- Abstract classes should be used to collect and specify behavior by related classes, while an interface should be used to specify related behaviors that may be common across unrelated classes.

For example, we could implement `Comparator` in many ways, to sort a wide variety of classes whose objects may be compared to one another: `Date` (compare by temporal order), `Student` (compare by GPA), `Person` (compare by age), `City` (compare by population). However, it's unlikely that these classes would have any implementable behavior that would warrant that they have the same base class.

## Benefits of Using Interfaces

Interfaces are great! Trust us, they really are. Once you get use to them, you'll begin to think more abstractly about which *behaviors* your code requires rather than which *classes* your code requires. This means you'll be able to code to interfaces instead of coding to classes, and your code will become more flexible and extensible.

Here are a few benefits of using interfaces:

- You can only extend one class, but you may implement many interfaces.
- You can extend a class and implement an interface at the same time.
- By declaring variables and parameters as interface types, you make your useful for a much wider variety of situations.
- When you declare properties and return types to be interface types, you decouple code using your classes from the actual class types you use. This means that you are free to change the specific implementation of your classes without affecting those using them. For example, if from a public method you returned an object of type `Iterable<Job>` then you would be free to change the method's internal structure to use, say, a [HashSet](http://docs.oracle.com/javase/8/docs/api/java/util/HashSet.html) instead of an [ArrayList](http://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html).

Remember that you don't need to start creating interfaces to use their power! When working with collections, in particular, think about the behaviors that your code requires, and declare variables and parameters to be interface types if you only need to use specific behaviors such as ordering or iteration.

## References

- [Interfaces Tutorial](https://docs.oracle.com/javase/tutorial/java/IandI/createinterface.html)
- [Comparable Interface](http://docs.oracle.com/javase/8/docs/api/java/lang/Comparable.html)
- [Comparator Interface](http://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html)
- [Iterable Interface](http://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html)
- [List Interface](http://docs.oracle.com/javase/8/docs/api/java/util/List.html)
- [Map Interface](http://docs.oracle.com/javase/8/docs/api/java/util/Map.html)
