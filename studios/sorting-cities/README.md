---
title: 'Studio: Sorting Cities'
currentMenu: studios
---

This studio has some starter code. So let's get it set up first. You might enjoy [some music](https://www.youtube.com/watch?v=jJMxwBmQWHA) while you do so.

## Getting Ready

Set up a local copy of the project:
- Visit the [repository page](https://github.com/LaunchCodeEducation/sorting-cities) for this project and fork the repository to create a copy under your own GitHub account.
- Back in IntelliJ, if you have a project open, select *File > Close Project*.
- On the IntelliJ welcome screen, click *Check out from Version Control*, select Github.
- Choose your fork from the repository dropdown, select the parent directory where you'd like to store your project, and hit *Clone*.
- In the first modal screen, select *Create project from existing sources*. Accept the default settings on all other screens.

## Cities Project Overview

The project contains a data file, `city_data.csv`, that contains data on over 300 U.S. cities. It has columns representing name, state, population (from the 2010 census) and land area (in square miles).

There is also a `City` class. This class encapsulates the same properties contained in our data file, along with providing a couple of methods to make printing info about cities easier.

The class `CityDataImporter` has a static `loadData` method that opens the data file and parses it, returning a list of `City` objects.

Within `Main.java`, we load the data, sort the list of `City` objects by the `Name` property, and print it out. Here's part of that code:

```java
ArrayList<City> cities = CityData.loadData();

NameComparator comparator = new NameComparator();

cities.sort(comparator);
```

To sort the `cities` list, we use `NameComparator`, which is located in the `org.launchcode.comparators` package of the project. `NameComparator` implements `Comparator<City>` by providing the `compare(City, City)` method, which compares two cities to determine which should be ordered before the other. Since sorting by name is just sorting alphabetically by the `name` file, `NameComparator` uses the `compareTo` method of the `String` class with the `Name` properties of the given input parameters. `compareTo` is the "instance version" of a `Comparator.compare`; it returns integers under the same conditions, but can be called on a `String` instance rather than on a `Comparator` instance.

The `Comparator<T>` interface contains the method `compare(T, T)`. This method returns an integer which determines which of the two objects comes "before" the other, or is "less than" the other. If the int is less than zero, then the first parameter comes before the second. If the int is zero, then they are "the same" in terms of ordering. If the int is greater than zero, then the second parameter comes before the first. You can think of the result of calling `compare(x, y)` as being the "value" of subtracting `x - y`. If `x` is smaller than `y`, this value is negative, if `x` is larger than `y`, this value is positive.

In order to sort the list, the comparator object is passed in to the `sort` method for it to use. The list is sorted "in place". In other words, rather than returning a new list that is sorted, `sort` sorts the given list by reordering its contents.

## Your Task

Your task is to implement at least two of the following comparators:

- `StateComparator` - results in alphabetical sorting by state
- `PopulationComparator` - results in sorting by population, from largest to smallest
- `AreaComparator` - results in sorting by land area, from largest to smallest

Your comparators should be placed in the `org.launchcode.comparators` package, and they should implement `Comparator<City>`. Test them out by modifying the code in `Main.java`.

Refer to `NameComparator` and the [Comparator documentation](http://docs.oracle.com/javase/8/docs/api/java/util/Comparator.html) for guidance.

## Bonus Mission

Create a `CompoundComparator` class that is able to order based on multiple factors. For example, we should be able to order by state name alphabetically, and then by population.

Here are the steps to carry this out:

1. Create a class that implements `Comparator<City>`.
2. Create a field `comparators` of type `List<Comparator<City>>`.
3. Initialize `comparators` to be an empty list: `new ArrayList<>()`. You can do this in a constructor, or in the same line that you declare the field.
4. Provide a method `add(Comparator<City>)` that adds a comparator to the `comparators` list.
4. You'll need the following method in order to implement the interface:

    ```java
    @Override
    public int compare(City o1, City o2)
    ```

    This method should use each object in `comparators`, in order. You'll first use `comparator.get(0)` to compare `x` and `y`.

    You only need to move on to the next comparator if the first comparator returns 0. For example, if you're comparing cities by state and then by population, when comparing St. Louis and New York, you don't need to compare population. You know that St. Louis comes before New York because "Missouri" comes before "New York". However, when comparing St. Louis and Kansas City, you would need to compare population, since the cities are in the same state.

    We suggest using a `while` loop to do this, along with some variables to keep track of the state.
5. To use `CompoundComparator`, create an instance of the class and then add individual comparators in the order that want them to be used:
    ```java
    CompoundComparator comparator = new CompoundComparator();
    comparator.add(new StateComparator());
    comparator.add(new PopulationComparator());
    ```
