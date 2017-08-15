---
title: Class 4 Prep Exercises
currentMenu: classes
---

Get some hands-on practice with views in MVC. Work on these exercises within the `CheeseMVC` app that was created during our [Intro to Spring Boot: Views](README.md) video lessons.

1. Add a `description` field to the application. This will involve:
    - Modifying the static `cheeses` list to be a `HashMap`\* object with key/value pairs that correspond to the name/description of the cheese.
    - Adding a new form input field in `cheese/add.html` to allow for submission of the description.
    - Modifying the `processAddCheeseForm` method to insert the name and description of the new cheese into the `cheeses` HashMap. \*\*
    - Displaying the description field in the `cheese/index.html` view template. \*\*\*
2. Add some styles to `resources/static/css/styles.css` to improve the look and feel of your application. We added stylesheets to our application in [Intro to Spring Boot: Views (Part 3)](../../videos/intro-to-spring-boot-views-3/)
3. Answer the following questions:
- What does it mean that "Thymeleaf templates are **natural** templates"?
- What are the benefits of using a `fragments.html` base template?
- Describe some best practices involving template organization and annotating request paths. (Hint: these are covered in [Intro to Spring Boot: Views (Part 1)](../../videos/intro-to-spring-boot-views-1/).)

\* You can review `HashMap` syntax [here](../../java4python/data-structures-and-collections/#keyvalue-data-hashmaps).  
\*\* To use multiple `@RequestParam`s, use this syntax:
```Java
public String multiParamExample (@RequestParam String one, @RequestParam String two)
```
\*\*\* When iterating over a map, the components of each item can be accessed using `.key` and `.value`:
```HTML
 <tr th:each="mapItem : ${map}">
    <td th:text="${mapItem.key}">Key</td>
    <td th:text="${mapItem.value}">Value</td>
 </tr>
```
Also, you may find Thymeleaf syntax like the following useful:
```HTML
<p th:text="${oneThing + '! ' + anotherThing}"></p>
```
Where `oneThing` and `anotherThing` are data passed in from the controller. For example, if the value of `oneThing` were "This rocks" and the value of `anotherThing` were "Doesn't it?", the above would render in the browser as:
```nohighlight
This rocks! Doesn't it?
```

Don't forget to use this [Thymeleaf Cheatsheet](https://github.com/LaunchCodeEducation/cheatsheets/tree/master/thymeleaf) if you need a reference!
