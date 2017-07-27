---
title: "Intro to Spring Boot: Models (Part 2)"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/fuQJ5oh08_0" frameborder="0" allowfullscreen></iframe></div>

## Notes

We'll begin this lesson by designing a "remove" implementation that will work with our new `Cheese` class. The first step is to create a field, `cheeseId` that will help us easily distinguish `Cheese` objects that have the same name. Then we'll create a "no-arg" constructor to initialize this field and to increment the related static field, `nextId`. 

The controller should not be responsible for managing model objects in any way at all. So let's refactor `CheeseController` to move the data management code into the `CheeseData` model class. Create the utility methods `getAll`, `add`, `remove`, and `getById` in that new class. Now we can refactor `CheeseController` to use these methods. We then need to modify our `remove.html` template to finish implementing our "remove" functionality.

Next, we'll refactor `processAddCheeseForm` and `add.html` to use model binding. Model binding reduces the amount of code we need to write and helps with validation (which we'll explore further in a future lesson). Because we use the `@ModelAttribute` annotation, Spring Boot will try to create a `Cheese` object for us when it gets the `POST` request from `/add`.

## Code

We start this lesson with the code in the `video-models-pt2-start` branch of the `cheese-mvc` repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-models-pt2-start)

We end this lesson with the code in the `video-models-part2-end` branch of the `cheese-mvc` repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-models-part2-end)
