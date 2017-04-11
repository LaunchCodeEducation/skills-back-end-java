---
title: 'Studio: CheeseMVC Persistent'
currentMenu: studios
---

## Part 2: Setting Up a One-to-Many Relationship

This continues the guided studio in which we set up `cheese-mvc` to work with Spring data. If you've completed [Part 1: Single Class Persistence](../single-class-persistence/) then you're ready to begin this activity.

If you get stuck on any of the steps here refer to the video lesson, or other code within the program that was provided. You'll often find the answers there.

## Add Cheeses to Category

Within `Category`, add a private property `cheeses` of type `List<Cheese>` and initialize it to an empty `ArrayList`. After we set up the `Cheese` class to work with `Category` objects, this list will represent the list of all items in a given category. We'll do this in a bit.

Add the following annotations:

```java
@OneToMany
@JoinColumn(name = "category_id")
private List<Cheese> cheeses = new ArrayList<>();
```

We're setting up a one-to-many relationship: Each one category will have many cheeses, but each cheese can have only one category. Hence, we use the `@OneToMany` JPA annotation to declare this relationship.

We also add the `@JoinColumn` annotation with the parameter `name = "category_id"`. This tells Hibernate to use the `category_id` column of the `cheese` table to determine which cheese belong to a given category.

Hibernate will be very smart about this, storing and retrieving cheeses and categories in a way that maintains their relationships to each other. It will also populate this particular list for us, based on these relationships.

## Replace CheeseType with Category

Up until now, we've been using the enum class `CheeseType` to represent the type of cheese that the user may choose from. This isn't very flexible, however, as the user can't create new types. For a new type to be added to the application, the `CheeseType` enum class must be changed, which requires editing code, of course.

Using the `Category` class to categorize cheese objects will be much more flexible, as it will allow users to create new categories themselves.

Within `Cheese`, replace the `type` field with a field named `category`, of type `Category`. Give it the `@ManyToOne` annotation, specifying that there can be many cheeses for any one category.

```java
@ManyToOne
private Category category;
```

By setting up the field this way, Hibernate will create a column named `category_id` (based on the field name) and when a `Cheese` object is stored, this column will contain the `id` of its `category` object. The data for the `category` object itself will go in the table for the `Category` class.

This complimentary pair of annotations -- `@ManyToOne` and `@OneToMany`, along with `@JoinColumn` clarifying how the latter should behave -- set up this relationship to be managed properly on both the application / object-oriented side and the database / relational side.

Delete the `CheeseType` class by right-clicking on `CheeseType.java` in the package pane and selecting *Delete*. This will create compiler/build errors where this type is used, but we're about to fix them!

## Updating CheeseController

Open up `CheeseController`. We'll make several updates here.

### displayAddCheeseForm

We now need to pass in a list of categories into the view, rather the array of enum values. Modify the appropriate line so that the `model` has an attribute `"categories"` equal to the result of calling `categoryDao.findAll()`.

Let's take a detour to the `cheese/add.html` template to make sure these categories are properly displayed in the form. Open that file, and modify the section that renders the `<select>` element to look like this:

```html
<label th:for="type">Type</label>
<select name="categoryId">
    <option th:each="category : ${categories}"
            th:text="${category.name}"
            th:value="${category.id}"></option>
</select>
```

This loops over the list of categories, using the `name` and `id` properties to set up each value. Note also that we've set `name="categoryId"`, indicating that the posted property will be called `categoryId`.

### processAddCheeseForm

This action creates a new cheese. Based on our updates to `add.html` above, we can add `categoryId` to the method signature:

```java
public String processAddCheeseForm(
                @ModelAttribute  @Valid Cheese newCheese,
                Errors errors,
                @RequestParam int categoryId,
                Model model)
```

We'll need to have the `Category` object corresponding to this ID, so we can set up the new cheese properly. Get it from the data layer like this:

```java
Category cat = categoryDao.findOne(categoryId);
```

This will fetch a single `Category` object, with ID matching the `CategoryID` value selected. Then set it:

```java
newCheese.setCategory(cat);
```

## Review Cheese Deletion Code

The code to remove a `Cheese` object is already in place for you, but since we won't have a reason to use the `delete` method on a `CrudRepository` interface, read the code in `displayRemoveCheeseForm` and `processRemoveCheeseForm` to see how to remove an item from the database.

## One more thing...

We've touched almost every file except the `cheese/index.html` template. Go into that file and update the table to display the category name of a given cheese instead of its type. Update the header as well, so it has "Category" in place of "Type".

## Test!

You made a lot of changes! Great work.

Assuming you don't have any remaining compiler errors, start up your application. (Don't forget to start MAMP first!) Make sure you can create a new cheese object, selecting a pre-existing category. Then make sure the proper category name is displayed in the table on the home page after doing so.

When everything works, move on to [Part 3](../many-to-many/).

## Bonus Missions

- Within `CheeseController`, create a handler named `category` that responds to `GET` requests at URLs like `/cheese/category/2`, where 2 may be the ID of any category in the system. This handler should retrieve all cheeses in the given category and pass them into the view. You should use the `cheese/index.html` template to display the results, with an appropriate title.
