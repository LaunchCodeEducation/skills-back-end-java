---
title: 'Studio: User Signup'
currentMenu: studios
---

For this studio you will add functionality to allow users to "sign up" for your `cheese-mvc` app.

## Getting Ready

Within `cheese-mvc` create the following files..
- Create a `UserController` in `org.launchcode.controllers`. Add the `@Controller` annotation, along with `@RequestMapping("user")` to configure routes into the controller.
- Create a new folder, `user/` within `resources/templates`
- Create `index.html` and `add.html` templates within`resources/templates/user/`
- Create a `User` class within `org.launchcode.models`

## Creating the Model

Your `User` class should have a few private fields with getters and setters: `username`, `email`, `password`. These should each be strings.

If you create a non-default constructor, be sure to also create a default constructor (which can be empty).

## Rendering the Add User Form

Within the controller, create a handler method `add(Model model)` to render the form. This handler should correspond to the path `/user/add`, and for now, it can just return the path to the `add.html` template.

Within the `add.html` template, create a form that accepts inputs for each of the `User` class properties, along with a Verify Password input. The form should be set up to `POST` to the same URL that it is displayed at.

Be sure to set `type="password"` for the password and verify inputs, to ensure the passwords are not visible when being typed into the form. You can also set `type="email"` on the email input, which will enable some basic client-side validation.

## Handling Form Submission

Within the controller, create a handler method with signature:
```java
public String add(Model model, @ModelAttribute User user, String verify);
```
This will use model binding to create a new user object, `user`, and pass it into your handler method. Check that `verify` matches the password within the `user` object. If it does, render the `index.html` view template with a message that welcomes the user by name. If the passwords don't match, render the form again with the username and email fields already populated, along with a message indicating what went wrong.

You don't need to store the `User` object anywhere for this studio. We're focusing on form handling and validation in this exercise. If you want to keep track of users using the method we employed in the models lesson video, check out the Bonus Missions below.

## Bonus Missions

1. Add a `userId` field to `User`, along with accessor methods (with appropriate access level). Create a `UserData` class within `org.launchcode.models` that provides access to a list of users via `add`, `getAll`, and `getById`.
1. Add additional validation within `UserController.add(Model, User, String)` to make sure that the username and email are not empty, that the username is between 5 and 15 characters long, and the username contains only letters. If any of these checks fails, render the form again with an appropriate message. When doing so, make sure that any inputs that *did* validate are populated with the value the user provided the first time.
1. This builds on 1. In the `user/index.html` view, display a list of all users by username. Each username should have a link that takes you to a detail page that lists the user's username and email.
1. Add a `Date` field in `User`, and initialize it to the time the user joined (i.e. when the `User` object was created). Display the value of this property in the user detail view.
