---
title: 'Studio: CheeseMVC Persistent'
currentMenu: studios
---

## Part 3: Setting Up a Many-to-Many Relationship

This continues the guided studio in which we set up `cheese-mvc` to work with Spring Data. If you've completed [Part 2: Setting Up a One-to-Many Relationship](../one-to-many/) then you're ready to begin this activity.

If you get stuck on any of the steps here refer to the video lesson, or other code within the program that was provided. You'll often find the answers there.

## Creating the Menu Model

This final section of the studio has us set up a many-to-many relationship between two classes. The classes in question will be `Cheese` and `Menu`. We don't have the latter in place yet, so let's get it set up.

### The Menu Class

Create a new class named `Menu` in `org.launchcode.models`. It should have the `@Entity` annotation at the class level.

It should also have a `name` field that's a string, an `id` field that's an integer, and a field named `cheeses` of type `List<Cheese>`. This latter field will be used to hold all items in the menu, and Hibernate will populate it for us based on the relationships we set up in our controllers. Be sure to add getter and setter methods for these fields, though note that `cheeses` should not have a setter (why?).

Add JPA annotations to each of these fields. The `id` and `name` fields should get the same annotations as the corresponding fields in the `Cheese` class. Be sure you understand what each of these does as you are adding it.

Apply the `@ManyToMany` annotation to the `cheeses` list. This will set up one half of our many-to-many relationship.

We want to be able to add items to our menu, so implement a method with the following signature:

```java
public void addItem(Cheese item)
```

This method should simply add the given item to the list.

Finally, add two constructors: an empty default constructor, and one that accepts a value for, and sets, `name`.

### The MenuDao Interface

Now that the `Menu` class is set up to be persistent, we need to enable Spring Data to store and retrieve instances of the class.

Create a `MenuDao` interface in `org.launchcode.models.data`, following the pattern of previously-created interfaces in this package. This will allow us to access `Menu` objects via the data layer from within our controllers. Be sure to add the necessary annotations, as you did with `CategoryDao`.

### Setting Up the Other Side of the Relationship

Back in the `Cheese` class, add this field:

```java
@ManyToMany(mappedBy = "cheeses")
private List<Menu> menus;
```

This field will configure the other side of our many-to-many relationship. It represents the list of `Menu` objects that a given cheese is contained in. In order to tell Hibernate how to store and populate objects from the list, we specify that the field should be `mappedBy` the `cheeses` field of the `Menu` class.

In other words, the items in this list should correspond to the `Menu` objects that contain a given `Cheese` object in their `cheeses` list. And the inverse relationship is true as well: The items in `Menu.cheeses` should correspond to the `Cheese` objects that have a given `Menu` object in their `menus` list. Hibernate will notice that our list contains `Menu` objects, and will look in that class for a property with the same name as that specified by the `mappedBy` attribute.

We won't be accessing `menus` outside this class, so there's no need currently to make it anything other than `private`.

<aside class="aside-note" markdown="1">
There are multiple ways that we could have set up this relationship using JPA annotations. When looking at documentation, you'll surely see variations of this configuration.
</aside>

## The MenuController Class and Views

There are lots of changes to the controller and view layers that we'll need to make to fully enable usage of our new model class across the application.

Within `org.launchcode.controllers` create a new class, `MenuController`. At the top of the class, use `@Autowired` to declare instances of `MenuDao` and `CheeseDao` that should be initialized by Spring Boot.

Be sure to configure your controller with `@Controller` and `@RequestMapping(value = "menu")`.

### List Menus

We will now set up the view that displays a list of all menus in the system.

Write a handler method `index` that uses `menuDao` to retrieve all menus and display them in a list within the template `resources/templates/menu/index.html` (the rest of our templates will be in this same folder, so we'll omit the full path for the rest of this part of the studio). You'll have to create the `menu/` folder within `templates/`.

Each menu in the list should link to a URL of the form `/menu/view/5`, where 5 could be the ID of any menu. Add these links now, and we'll set up the handler to process these requests in a moment.

Within the `index.html` template, add a link below the list to the URL `/menu/add`. We'll set up this page next.

<aside class="aside-note" markdown="1">
Each template that you create in this part of the studio should use the `head` and `navigation` fragments from `resources/templates/fragments.html`.
</aside>

## Add a Menu

### Display the Add Menu Form

We want to allow users to add new, empty menus via a form. This is our next task.

In `MenuController`, create a handler method named `add` that responds to `GET` requests, and which displays the `add.html` template. The handler should also pass in a new `Menu` object created by calling that class' default constructor. We'll use this object to help render the form.

Within `add.html`, create a form that has the `menu` object bound to it using `th:object`. Add a single form input to accept the name of the new menu, along with a `<span>` element that can display any validation errors. Be sure to use `th:for`, `th:field`, and `th:errors` in creating the label, input, and span elements.

The form should `POST` to the same URL at which it is displayed.

### Process the Add Menu

Once the form is posted, we'll need process the data on the server.

In `MenuController` create a handler method named `add` that responds to `POST` requests. It should accept a valid `Menu` object passed in via model binding, along with the corresponding `Errors` object.

Check for the existence of errors. If errors exist, render the `add.html` form again. If not, save the `Menu` object using `menuDao.save()` (passing in your valid `Menu` instance). Then, redirect to `return "redirect:view/" + menu.getId()`. We'll se up this handler and view template next.

## View a Menu

Let's create functionality to allow the user to view the contents of a menu.

In `MenuController`, create a handler named `viewMenu` that accepts `GET` requests at URLs like `view/5`, where 5 can be any menu ID. You'll need to use the correct syntax within the `@RequestMapping` annotation, along with the `@PathVariable` annotation on a method parameter that you'll add (which should be an `int`).

Within the handler, retrieve the `Menu` object with the given ID using `menuDao`. Pass the give menu into the view.

<aside class="aside-note" markdown="1">
In the video lesson demonstrating this part of the application, the name, ID, and list of cheeses are each passed in separately to the view. Passing in the full `Menu` object, as we do here, is more efficient.
</aside>

The `viewMenu` method should render the `view.html` template. Let's build that template now.

Create `view.html` in the folder that contains your other templates associated with this controller. It should display the name of the menu as the page title. It should display a list of menu items in a `<ul>` element. Note that you'll need to loop over `menu.cheeses` (here was assume you've passed in the menu with the attribute name `menu`; if not, modify accordingly).

Below the list, add the following link:

```html
<p><a th:href="'/menu/add-item/' + ${menu.id}">Add Cheese</a></p>
```

This will link to a form that we are about to create.

## Add Menu Items

We can create menus, and view them, but as of now, any menu we create would be empty! Let's address that.

Within `MenuController`, create a method named `addItem` that responds to `GET` request of like `add-item/5`, where 5 can be any menu ID. As above, you'll need to use the correct syntax within the `@RequestMapping` annotation, along with the `@PathVariable` annotation on a method parameter that you'll add (which should be in `int`).

Retrieve the menu with the given ID using `menuDao`.

### AddMenuItemForm

To aid in validation and display of this form, let's create a model class to represent the form. Create a new package, `forms`, within `org.launchcode.models`. Within that package, create the `AddMenuItemForm` class. This class will not be persistent, so there's no need to add `@Entity`.

We'll need two fields to render the form: `private Menu menu` and `private Iterable<Cheese> cheeses`. Add accessors for each of these.

We'll need two fields to process the form: `private int menuId` and `private int cheeseId`. These will need accessors as well. Further, we want to be able to validate that these fields are not `null`, so add the appropriate annotation to do so.

Finally, add two constructors: a default no-arg constructor and one that accepts and sets values for `menu` and `cheeses`. The default constructor is needed for model binding to work.

### Rendering the Form

Now, back in `MenuController.addItem`, create an instance of `AddMenuItemForm` with the given `Menu` object, as well as the list of all `Cheese` items in the database. Pass this form object into the view with the name `"form"`, along with a title that reads "Add item to menu: MENU NAME" (using the actual menu name).

This handler should render the form `add-item.html`. Make sure it returns the correct string to do so, and then create this template.

The template should contain a form that posts to `/menu/add-item`, and renders the form using the `form` attribute that was passed in. Use `th:object` to bind `form` to the `<form>` element, and display a `<select>` element that contains all of the cheeses. The `name` of this input should be `cheeseId`, and the `value` attribute of each `<option>` should be the `id` of the given cheese. This will result in the ID of the item to add being passed in the request. Be sure to use `th:for`, `th:field`, and `th:errors` in creating the label, input, and span elements.

Below the `<select>`, add this input:

```html
<input type="hidden" name="menuId" th:value="*{menu.id}" />
```

This will pass the ID of the menu in the post request, but will not be visible to the user.

Add a submit button, and you're ready to process the form!

### Process the Form

Back in `MenuController`, create another handler named `addItem` that responds to `POST` requests at `/menu/add-item`. It should accept a valid `AddMenuItemForm` object via model binding, along with the associated `Errors` object.

Check for errors, rendering the `"menu/add-item"` template again if there are any.

If there are no errors, find the given `Cheese` and `Menu` by ID, using the respective DAO objects, and add the item to the menu. Use `menuDao` to save the menu: `menuDao.save(theMenu)`.

<aside class="aside-warning" markdown="1">
If the menu isn't saved here, the changes will not be pushed to the database, and hence will be lost.
</aside>

To finish this handler, redirect to the URL corresponding to the full menu view for this menu. This was created above, and we leave it to you to figure out the correct redirect URL.

## Clean Up the Navigation

Let's improve the navigation of our app. In `resources/templates/fragments.html` modify the header navigation fragment so that it displays a menu like this:

<img src="../images/main-nav.png" />

The *Menus* link should link to `/menu`.

And in `resources/templates/cheese/index.html`, ensure the navigation links below the table look like this:

<img src="../images/home-footer-nav.png" />

## Test!

You made a lot of changes! Great work.

Assuming you don't have any remaining compiler errors, start up your application. (Don't forget to start MAMP first!) Make sure you can create a new cheese object, selecting a pre-existing category. Then make sure the proper category name is displayed in the table on the home page after doing so.

When everything works, you're done! Congrats!

[Turn in your work](../../../assignments/), or tackle one of the Bonus Missions below.

## Bonus Missions

- Add the ability to edit a `Cheese`. To do this, follow the instructions outlined in [Class 8 Prep Exercises](../../../class-prep/8/exercises.html), with the following modifications. In steps 5 and 9, rather than using `CheeseData` to get and save the object, use `cheeseDao`. And don't forget to call `.save()` to make sure your edits are stored in the database!.
