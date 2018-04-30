---
title: "Intro to Spring Boot: Views (Part 3)"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/pLVjuN4OPy8" frameborder="0" allowfullscreen></iframe></div>

## Notes

### Create a Thymeleaf Template

To prevent having to modify the HTML template to match Thymeleaf specs every time you want to make a new template, you can instead create a reusable Thymeleaf template. To do so, right click in the left hand pane and select *New->Edit File Templates...* and paste in the basic code that you will use for all your Thymeleaf templates:

```HTML
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title></title>
</head>
<body>

</body>
</html>
```

Then name the template "Thymeleaf" and give it the extension `.html`. From now on, instead of selecting to create a new HTML file, you can select to create a new Thymeleaf file.

### Utilize a Base Template and Extensions

Next, let's refactor out duplicate code by utilizing a base template and template extensions. To do so, we'll first create a `fragments.html` file that will be our base template and will live in the `templates` directory (*not* `templates.cheese` directory). This file consists of the basic HTML above with some modifications to create elements and link resources that will be reusable by the other templates in our application. 

```HTML
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head th:fragment="head">
    <meta charset="UTF-8"/>
    <title th:text="${title}">My Cheeses</title>
</head>
<body>

</body>
</html>
```

We can utilize the fragment above in our `index.html` and `add.html` files by deleting what is presently in the `<head>` section and inserting this instead:

```HTML
<head th:replace="fragments :: head"></head>
```

We can also add a navigation element to the body of our `fragments.html` as follows:

```HTML
<nav th:fragment="navigation">
    <a href="/cheese">List</a>
    <a href="/cheese/add">Add</a>
</nav>
```

And we can utilize it in our `index.html` and `add.html` files by removing the `<a>` tag that took us back to the "Add" page and insert this below the title `<h1>` tag instead:

```HTML
<nav th:replace="fragments :: navigation"></nav>
```

Remember that fragments consist of an entire HTML element and the content inside of it. What belongs in a fragment? Anything that you will use in more than one template!

### Add Stylesheets and JavaScript Files

Follow the video instructions to add directories for JavaScript and CSS files to the `static` directory in `resources`. Then add a `styles.css` file and a `script.js` file. Then add this to your `styles.css`:

```css
body {
    font-family: sans-serif;
}
```

Now let's add CSS and JavaScript files to the `<head>` of our `fragments.html` so that they will be available to our template extensions:

```HTML
    <link rel="stylesheet" th:href="@{/css/styles.css}"/>
    <script type="text/javascript" th:src="@{/js/script.js}"></script>
```

## Code

We start this lesson with the code in the `video-views-pt3-start` branch of the cheese-mvc repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-views-pt3-start).

We end this lesson with the code in the `video-views-pt3-end` branch of the cheese-mvc repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-views-pt3-end).
