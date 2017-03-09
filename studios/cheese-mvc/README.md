---
title: 'Studio: CheeseMVC'
currentMenu: studios
---

In this studio, we'll extend the application that you started building in the lesson videos for [Class 4](../../class-prep/4/).

## Add Description Field

If you didn't get to the [exercises for Class 4](../../class-prep/4/exercises.html), go back and complete the first one, to add a description field to the `CheeseMvc` app.

## Remove Cheese

Add functionality to remove cheese(s) from the list. We present two ways to do this. Read about each, and choose which you would like to pursue. For an additional challenge, try to do each!

### Remove Cheese Via New View

Create a new controller method and view to present a form to remove cheese. The form should make  `POST` request to a controller at the same URL as the form, and should redirect to the `Index` view associated with the `Cheese` controller.

When presenting the form, you have a couple of options:
1. Present a checkbox next to each cheese. Recall that a checkbox is an `input` element of `type='checkbox'`. Look up details on [w3c](https://www.w3schools.com/html/html_form_input_types.asp). For this scenario, you'll want the same `name` attribute for each checkbox. Additionally, it will be possible for users to submit multiple cheeses for deletion at once, so in the controller handling form submission, the input parameter should be a collection. For example, if you have `name='cheese'` on each checkbox, you'll want an input parameter `ArrayList<String> cheese`.
2. Present a dropdown to allow the user to select which cheese they would like to delete. This approach allows for only one item to be deleted at a time. You'll need to use a `select` element for this, which you can [read about on w3c](https://www.w3schools.com/htmL/html_form_elements.asp).

To remove an item from an ArrayList, have a look at the [ArrayList documentation](http://docs.oracle.com/javase/8/docs/api/java/util/ArrayList.html).

### Remove Cheese Via Links

<aside class="aside-warning" markdown="1">
It's rare to use `GET` requests to delete data, and should be avoided in the vast majority of situations, especially if the actions aren't protected by a login. Bots and scripts could easily crawl your site and delete your data by following links.
</aside>

This approach adds the remove functionality without creating an additional view. In the `Index` view, next to each cheese present a "remove" link. Clicking on the link should submit a `GET` request that removes the cheese, and then presents the updated `Index` view.

There are two ways to submit a `GET` request that passes data to the server:
1. Via query parameters. For example: `/Cheese/Remove?name=cheddar`
2. Via a URL segment. For example: `/Cheese/Remove/cheddar`

Choose the method you would like to implement. Each requires different controller configuration, and were covered in the [lesson on routes](../../videos/intro-to-mvc-routes/). Note that each cheese will require a different URL, which you'll need to generate properly in the view.

## Bonus Missions

**Add Validation:** Validate the user's input when adding a new cheese, in the appropriate existing controller. While the `description` field should be optional, the `name` field should be required, with only alphabetic characters and spaces allowed. If the user doesn't provide a valid name, present them with the form again with an error message describing the problem.
