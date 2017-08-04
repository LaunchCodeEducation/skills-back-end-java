---
title: "Intro to Spring Boot: Persisting One-to-Many Relationships"
currentMenu: videos
---

<div class="youtube-wrapper">
<iframe width="776" height="437" src="https://www.youtube.com/embed/6GnUuh4qNrM" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we'll look at how to structure model objects that have relationships with each other. In particular, we'll look at one-to-many relationships. "One-to-many relationships" describe classes that can have many instances of another class. 

In our `cheese-mvc` application, an example of this is the relationship between the `Cheese` class and the `Category` class. Each `Category` may have many `Cheese` objects related to it. Therefore, we use the `@OneToMany` annotation within the `Category` class, along with the `@JoinColumn` annotation, above our declaration of the `cheeses` ArrayList. Then, in our `Cheese` class, we use the `@ManyToOne` annotation above the declaration of the `category` field.

For a more detailed walkthrough of the code in this video, look at Parts 1-3 of the [CheeseMVC Persistent studio](http://education.launchcode.org/skills-back-end-java/studios/cheese-mvc-persistent/).

## Code

We start this lesson with the code in the `video-one2many-start` branch of the cheese-mvc repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-one2many-start)

You'll create the code for the end of the lesson yourself as part of an in-class studio!
