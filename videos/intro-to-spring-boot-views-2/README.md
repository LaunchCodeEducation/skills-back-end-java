---
title: "Intro to Spring Boot: Views (Part 2)"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/0z_hjs5XRy0" frameborder="0" allowfullscreen></iframe></div>

## Notes

Keep building functionality into your *CheeseMVC* application by coding along with the video. We'll cover some new Thymeleaf syntax including the following:

### For Loops

Example of creating an unordered list from model data:

```HTML
<ul>
    <li th:each="cheese : ${cheeses}" th:text="${cheese}"></li>
</ul>
```

### Conditions

Example of conditionally displaying a message if there is no model data for `cheeses` or the size of the `ArrayList` is zero:

```HMTL
<p th:unless="${cheeses} and ${cheeses.size()}">no cheese :(</p>
```

<aside class="aside-note" markdown="1">
To make your code more Spring-like replace these lines:

```Java
    public String processAddCheeseForm(HttpServletRequest request){
        String cheeseName = request.getParameter("cheeseName");
```

with this:

```Java
    public String processAddCheeseForm(@RequestParam String cheeseName){
```

If you want to learn more about `@RequestParam`, check out [this tutorial](http://www.logicbig.com/tutorials/spring-framework/spring-web-mvc/spring-mvc-request-param/) and the [Spring Docs](http://docs.spring.io/spring/docs/3.1.x/spring-framework-reference/htmlsingle/spring-framework-reference.html#mvc-ann-requestparam).
</aside>

<aside class="aside-warning" markdown="1">
At this point in your project, make sure you have enabled version control for the CheeseMVC application. Details on how to do so can be found in the video at 30:13. If you get a message about reviewing errors when you try to make your initial commit, you do not need to review them, you can go ahead and commit. We will fix these errors in later lessons; most are related to missing import statements.
</aside>

## Code

We start this lesson with the code in the `video-views-pt2-start` branch of the cheese-mvc repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-views-pt2-start).

We end this lesson with the code in the `video-views-pt2-end` branch of the cheese-mvc repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-views-pt2-end).
