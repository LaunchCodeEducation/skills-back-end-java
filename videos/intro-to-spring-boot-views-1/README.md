---
title: "Intro to Spring Boot: Views (Part 1)"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/W80csGBWpBw" frameborder="0" allowfullscreen></iframe></div>

## Notes

To create this new project, follow the instructions in [Create a Simple Spring Boot Project](../intro-to-spring-boot-controllers/#create-a-simple-spring-boot-project) and name the *Artifact* `cheese-mvc` instead of `hello-spring`.

Then, code along with the video to continue building the `cheese-mvc` application. You can utilize the [source code](#code) below for reference.

<aside class="aside-warning" markdown="1">
Be aware that your Thymeleaf templates must conform to [XHTML](https://www.w3schools.com/html/html_xhtml.asp) standards. This includes adding a forward slash to closing tags that do not require it according to HTML5 standards, for example, the `input` element.
</aside>

<aside class="aside-pro-tip" markdown="1">
To avoid having to stop and restart the server every time you make a change to your templates, add this to the bottom of your `build.gradle` file:

```nohighlight
    bootRun {
        addResources = true
    }
```    
</aside>


## Code

We start this lesson with the code in the `video-views-pt1-start` branch of the cheese-mvc repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-views-pt1-start).

We end this lesson with the code in the `video-views-pt1-end` branch of the cheese-mvc repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-views-pt1-end).
