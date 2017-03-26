---
title: 'Studio: User Signup Continued'
currentMenu: studios
---

We'll build on the [User Signup](../user-signup/) studio from last class, adding in model validation.

## Getting Started

Open up your `cheese-mvc` application and navigate to the `User` model class.

## Add Validation Annotations

Let's take our first steps toward enabling validation. Add [validation annotations](http://docs.oracle.com/javaee/6/tutorial/doc/gircz.html) to ensure these conditions are satisfied:
- Username, password, and verify are required
- Username is between 5 and 15 characters
- Email is optional
- If provided, the email has the format of a valid email address.

    **How to do this**: The Java Validation API doesn't provide an annotation to validate an email address. However, one is provided by the [Hibernate Validator](https://docs.jboss.org/hibernate/stable/validator/reference/en-US/html_single/#validator-defineconstraints-hv-constraints) library. This library is already in your project, since it's included in the `spring-boot-starter-web` dependency that's part of our Gradle configuration. You can use any of these annotations in the same way you've been using the Java Validation API annotations.
- The password and verify fields match.

    **How to do this**: Your `verify` parameter in the form handler is not part of the user class, so checking that the `User` object's password matches the `verify` isn't possible using validation annotations. We'll walk through these details on how to manually conduct this check below.
- The password is at least 6 characters long

## Using the Model to Render the Form

In the `UserController`, modify the `add` method that displays the form so that it passes in an "empty" `User` object with:

```java
model.addAttribute(new User());
```

This object will be accessible in the template, by name, as `user`. Within the template, use this object within the form by adding `th:object="${user}"` to the form element. Then you can use the `th:for`, `th:field` and `th:errors` tags within the form as outlined in the [lesson on validation](../../videos/intro-to-spring-boot-model-validation).

While you're in the `add.html` template, make sure that the password and verify fields have `type="password"` in the form markup, and that the email field has `type="email"`.

<aside class="aside-pro-tip" markdown="1">
This last item will provide some client-side validation on the email field, but we shouldn't consider that sufficient. Even with client-side validation (that is, in the browser), you should always validate data on the server as well. You might want to provide constraints in addition to or beyond what the browser does, and it's also possible for a clever (or, more often, malicious) user to bypass the browser's validation.
</aside>


## Validating Form Submission Data

<aside class="aside-warning" markdown="1">
If you did any of the Bonus Missions in the previous studio, you'll be tearing out some of that code, since we'll now have the framework handle validation. Don't worry, it'll be worth it!
</aside>

Now that you have your form set up, go back to `UserController` and add validation on form submission by adding the `@Valid` annotation to the `User` parameter that is bound, along with an additional parameter: `Errors errors`. **You must put this parameter directly after the `User` parameter in the method definition for it to work properly.**

Within the `add` handler, check for errors configured by the validation annotation using `errors.hasErrors()`. If this returns `true`, return the user to the form. Be sure to add the `user` object to the `model` in this case: `model.addAttribute(user)`. The `user` object contains the error messages associated with validation.

### Validating That Passwords Match

As we mentioned above, we are not able to use Spring's validation machinery to validate that the two password fields match given the setup we have here. Checking `errors.hasErrors()` will only tell us if there are errors in other form data fields.

To check that the two password fields match, you'll need to manually compare them. At this point, our method signature is:

```java
public String add(Model model, @ModelAttribute @Valid User user,
                      Errors errors, String verify)
```

We can access the primary password field by using `user.getPassword()`. Make sure that neither this value nor the `verify` variable are null, and then compare them with `.equals()`. If one of them is null, or if they don't match, then add a custom error message to `model` and clear the password field so it isn't displayed when we return the form: `user.setPassword("")`. Finally, return the form, and manually add markup in `add.html` to display this error.

Now we have two validation sections: one for the annotation-configured validation (which checks `errors.hasErrors()`), and one that checks that the password fields match. Make sure they work in-sync with each other to properly return to the form if any of the validation conditions fail.

<aside class="aside-pro-tip" markdown="1">
You can, in fact, validate that passwords match using annotations by taking a slightly more difficult approach than we've done here. We outline how to do so in the Bonus Mission section.
</aside>

## Test, Test, Test!

You made a lot of changes! Be sure to throughly test them to make sure everything works as expected.

## Bonus Mission

Let's set up our `User` class so we can validate that the password fields match using annotations.

1. Add a `private String verifyPassword` field to `User`, along with getters and setters.
1. Add a new method, `private void checkPassword`, that compares `password` and `verifyPassword`. If neither is `null` and they don't match, then set `verifyPassword = null`.
1. In both `setPassword` and `setPassword`, call `checkPassword` **after** setting the given field.
1. Add `@NotNull` to the `verifyPassword` field with the error message: "Passwords do not match".
1. Refactor the controller and `add.html` template to use the built-in, annotation-based validation instead of the manual password validation that we carried out previously. Be sure to update the verify field and label in the form to use the field on the `User` class, and to remove `String verify` from the `add` method signature.

The result of these changes is that when the `User` object is bound to the request, both `password` and `verifyPassword` are set. Spring does this by calling the setters on these fields. The setters call `checkPassword`, so when the second one is set (whichever that may be), we'll know that both `password` and `verifyPassword` are not `null` and we'll compare them. If they don't match, we manually violate the `@NotNull` validation on `verifyPassword` by setting that field to `null`.
