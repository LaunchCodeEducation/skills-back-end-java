---
title: "Intro to Spring Boot: Model Validation"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="560" height="315" src="https://www.youtube.com/embed/INLNoeCD-m8" frameborder="0" allowfullscreen></iframe></div>

## Notes

When adding validation to a model in a controller method, you need the `Errors errors` parameter to directly follow the parameter being validated. For example:

```java
public String handlerMethod(Model model,
                @ModelAttribute @Valid someObject, Errors errors)
```

If you don't put the `Errors` parameter after the parameter with the `@Valid` attribute, you'll receive an HTTP error.

## Code

We start this lesson with the code in the `video-validation-start` branch of the `cheese-mvc` repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-validation-start)

We end this lesson with the code in the `video-validation-end` branch of the `cheese-mvc` repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-validation-end)

## References

- [Java Validation API Annotations](http://docs.oracle.com/javaee/6/tutorial/doc/gircz.html)
- [Hibernate Validator Annotations](https://docs.jboss.org/hibernate/stable/validator/reference/en-US/html_single/#validator-defineconstraints-hv-constraints) - **NOTE**: You must have the proper Hibernate package included as part of your project to use these. For us, they will be included as part of the `spring-boot-starter-web` dependency that is in our `build.gradle` file.
