---
title: "Intro to Spring Boot: Models (Part 1)"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/cRdjxG-Qbj8" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we will focus on creating distinct, **POJO** model objects. POJO stands for "plain, old Java object". We will then move all data operations out of the controller layer and into the model layer. We will use model binding to auto-create model classes on form submission.

Code along with the video using the starter code below. There have been some changes to the codebase since the last video, so you'll want to look at the branch listed below to get those changes.

Some Bootstrap classes we have added to improve the look and feel of our application are: `container`, `form-group`, and `form-control`.

If you haven't already done this in the course of previous class exercises, begin **refactoring** (*improving your code while not adding new features*) your `CheeseController` by creating a `models` package and creating a `Cheese` Java class. Use auto-generation (see Intelli-J Tip below) to create a constructor and the relevant getters and setters. Continue refactoring `CheeseController` and then update your templates to use the newly-created `Cheese` class instead.

At the end of this lesson, the remove functionality will not work. We will tackle the solution to that problem, as well as how to get the data out of our controller, in the next lesson!

### Intelli-J Tip

Use right-click and select "Generate" to select among boilerplate code generation options to speed up your program development.

## Code

We start this lesson with the code in the `video-models-pt1-start` branch of the cheese-mvc repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-models-pt1-start)

We end this lesson with the code in the `video-models-pt1-end` branch of the cheese-mvc repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-models-pt1-end)

## References

- [Bootstrap](http://getbootstrap.com/)
- [Bootstrap CDN](https://www.bootstrapcdn.com/)
