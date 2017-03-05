---
title: Class 4 Prep Exercises
currentMenu: classes
---

Get some hands-on practice with views in MVC. Work on these exercises within the `CheeseMVC` app that was created during [part 1](../../videos/intro-to-spring-boot-views-1/) and [part 2](../../videos/intro-to-spring-boot-views-2/) of our Intro to Spring Boot Views lessons.

1. Add a `description` field to the application. This will involve:
    - Modifying the static `cheeses` list to be a `HashMap` object with key/value pairs that correspond to the name and description.
    - Adding a new form field in `cheese/add.html` to allow for submission of the description.
    - Modify the `processAddCheeseForm` action to insert the description of the new cheese into the `cheeses` HashMap.
    - Display the description field in the `cheese/index.html` view template.
2. Add some styles to `resources/static/css/styles.css` to improve the look and feel of your application. We added stylesheets to our application in [Intro to Spring Boot: Views (Part 3)](../../videos/intro-to-spring-boot-views-3/)
