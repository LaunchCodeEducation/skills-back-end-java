---
title: 'Studio: Cheese MVC Persistent'
currentMenu: studios
---

## Part 1: Persisting a Single Class

Be sure you've completed the [setup steps](../) before starting these tasks.

## Setting Up the New Model

We'll use Spring Data -- along with JPA and Hibernate -- to create an object-relational mapping for a new class.

In `org.launchcode.models`, create a new model class named `Category`. Add the `@Entity` annotation to make the class persistent In other words, this annotation will ensure that the class is mapped to a relational database table.

Give it a private `id` field that's an `int`, along with a private `name` property that's a string. Add a public getter and setter for `name`, but only a getter for `id`. Other classes shouldn't be able to change our ID!

Mimic the same JPA annotations used in `Cheese`:

```java
@Id
@GeneratedValue
private int id;

@NotNull
@Size(min=3, max=15)
private String name;
```

Add two constructors to `Category`.
- Default (no-argument) constructor: This is required, and doesn't need a any code within its body. It will only be used by Hibernate in the process of creating objects from data retrieved from the database.
- A constructor that accepts a parameter to set `name`.

## Setting Up the New DAO

We'll want instances of this class to be stored in the database, so create a new interface in `org.launchcode.models.data` named `CategoryDao`. You can do this by creating a new class, and then changing `class` to `interface` in the boilerplate code. It should extend `CrudRepository` and have `@Repository` and `@Transactional` annotations, as shown here:

```java
@Repository
@Transactional
public interface CategoryDao extends CrudRepository<Category, Integer> {
}
```

## Adding Categories

Create a `CategoryController` in `org.launchcode.controllers`. Add the `@Controller` and `@RequestMapping("category")` annotations to the class. Just inside the class, add:

```java
@Autowired
private CategoryDao categoryDao;
```

This creates a private field `categoryDao` of type `CategoryDao`. This object will be the mechanism with which we interact with objects stored in the database. Recall that Spring will do the work of creating a class that implements `CategoryDao` and putting one of those objects in the `categoryDao` field when the application starts up. And all of this is thanks to the `@Autowired` annotation.

This code would need to be added to each controller class that you want to have access to the persistent collections defined within `categoryDao`.

<aside class="aside-warning" markdown="1">
We made the `@Autowired` annotation sound pretty dang magical! It's not that it isn't, but don't go adding `@Autowired` to every field under the sun that you want to us and expect them to be initialized for you.

Recall that `@Autowired` is part of Spring's dependency injection framework, and it works its magic in this case because we're using Spring's `CrudRepository` interface, along with the `@Repository` annotations, and some other implicit Spring Boot settings.
</aside>

### View All Categories

Create an `index` handler within `CategoryController`. Create an `index.html` template file in `resources/templates/category/` (you will have to create this last folder).

The `index` handler should correspond to the route `""` (that is, the path `/category`), and it should retrieve the list of all categories. This is done via the `categoryDao` object: `categoryDao.findAll()` returns a collection (actually, an `Iterable`) of all `Category` objects managed by `categoryDao`. Use this snippet to retrieve the list of categories, and then pass the list into the view by adding it to `model`. Also add a `"title"` to the model ("Categories" works).

The handler should render the `index.html` template that you just created. This view should display an unordered list (that is, a `<ul>`) of category names. The list will look a bit plain for now, but we will make it more interesting later on.

### Add Categories

Next, we want to enable the user to create a new category via a form. This will require multiple steps.

#### Add Handler Methods

Let's add controller handlers to render and process the form.

Create an `add` handler within `CategoryController` with input parameter `Model model`. It should create a new `Category` object using the default constructor and pass it into the view with key `"category"` (you can do this with the shorthand `model.addAttribute(new Category())`; note the omission of a string/key argument). Add the title "Add Category" to `model` as well.

The `index` handler should accept `GET` requests at `/category/add` (recall that you set the path segment "category" at the controller level already). The handler should render the `category/add` template (we'll add this template in a moment).

Create another `add` handler that accepts `POST` requests at `/category/add`. Its signature should be:

```java
public String add(Model model,
    @ModelAttribute @Valid Category category, Errors errors)
```

Within this second `add` handler:
- Determine whether or not there are any validation errors. If there are, return the form at `category/add`.
- If the form submission is valid:
    - Save the new `Category` object by calling `categoryDao.save(category)`.
    - Redirect to the `index` handler for `CategoryController` by returning the string `"redirect:"`.

#### Add View

In `resources/templates/category/` create a new template, `add.html`. Within the template, create a form that uses the `category` object that you passed in from the controller.

You'll need to bind the object to the form using `th:object="${category}"`. And you should use the appropriate attributes within the form: `th:for`, `th:field`, `th:errors`.

This is the same technique we've been using over the last couple of weeks.

### Adding Navigation Links

Let's make it easy to navigate to the new views that we've created.

Within the `fragments.html` template, add a link to `/category` to the list of navigation links.

Within the `category/index.html` template, add a link to `/category/add` with the text "Add Category". Place this link below the list.

## Test!

Start up your application -- don't forget to start MAMP first -- and try to add a new category!

Click on the *Categories* navigation link, then on *Add Category*. Complete the form, and if everything works as expected, you'll see your new category in the list. If everything seems to work -- that is, you are able to submit the form without any errors -- but you don't see your category in the list, here's what you should check:

- Is there any data in the `categories` table? Check by going to MAMP and hitting the *Open Start Page* button, then navigating to *Tools > phpMyAdmin*. Find the `cheese-mvc-data` database, and look within the `categories`. If there isn't any data in the table, you probably forgot to save the category when processing the form.
- If there's data in the database, check that you are correctly querying for the list of all categories in `CategoryController.index`: `categoryDao.findAll()`.
- Ensure you're passing this list into the view, and looping over the list of categories to display them in the page.

When everything works, move on to [Part 2](../one-to-many/).
