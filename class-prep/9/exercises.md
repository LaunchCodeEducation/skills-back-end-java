---
title: Class 9 Prep Exercises
currentMenu: classes
---

1. Let's add validation to our `edit` handlers. If you haven't set up edit functionality in your `cheese-mvc` app, you can add it by following the steps in [class 8 prep exercises](../8/exercises.html).

    In the `edit` handler that displays the form, you should already be passing in the `Cheese` object to be edited. This means that we can refactor the form in the `edit.html` template to use `th:object="${cheese}"` and then use `th:field="*{propertyName}"` to help render the inputs. Don't forget to modify the `<label>` elements to use `th:for="propertyName"`. Add error message elements for each of the properties.

    You'll also want to pass in the list of all `CheeseType` enum values, as we did in the `add.html` form from the [lesson video](./../videos/intro-to-spring-boot-enums/). You'll want to pre-select the specific option that is already stored on the given object.

    In the `edit` handler that processes the form, validate the model and respond appropriately.

1. Add an integer property to `Cheese` to allow the user to give each cheese a rating. Follow these steps:
    - Add the property to `Cheese.java`, along with [validation annotations](http://docs.oracle.com/javaee/6/tutorial/doc/gircz.html) to allow the user to enter a value between 1 and 5
    - Add the form input, label, and error message display to `templates/cheese/add.html`
    - Display the rating in `templates/cheese/index.html`
    - Add the rating to the `edit.html` template
    - Test!
