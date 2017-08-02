---
title: Class 11 Prep Exercises
currentMenu: classes
---

We've learned that `ArrayList<T>` implements both `List<T>` and `Iterable<T>`. In fact, `List<T>` extends `Iterable<T>`, which means that `List<T>` includes all of the contracted methods that `Iterable<T>` does. Check out the documentation for [List&lt;T&gt;](https://docs.oracle.com/javase/8/docs/api/java/util/List.html0) and [Iterable&lt;T&gt;](https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html) to confirm for yourself!

Open up your `techjobs-mvc` solution. Within `ListController` and `SearchController`, change every local variable that's declared to be of type `ArrayList` to be either a `List` or an `Iterable`, using the least restrictive type as possible. In other words, if you only need to loop over the collection, use `Iterable`, but if you also need to access elements of the collection by index -- as in, `var item = items.get(0)` -- then use `List`. Be sure to look at the templates to see how collections being passed into the templates are used. Also be sure to test your code after making these changes!
