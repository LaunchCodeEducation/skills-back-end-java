# Studio: Blogz Part 4

This studio will introduce templates into our Blogz application.

1. Make sure you have the Thymeleaf dependency in your `pom.xml`. If you don't add it in the Dependencies tab of the POM editor using:
    - Group ID: org.springframework.boot
    - Artifact ID: spring-boot-starter-thymeleaf
2. We want to recreate most of the templates, routes, and handler/controller methods as were in place in the python version of `Blogz`. Open up the source code for that project in Atom to use as a reference.
3. Create the directories `src/main/resources/templates` and `src/main/resources/static`. Within the `templates` directory, move all of your templates over the Spring project. As you go, refactor the Jinja2 templates to be Thymeleaf templates. Here are a few things to keep in mind:
    - Your `base.html` template will serve the same purpose of collecting HTML shared across all of your templates, but it needs to look much different, and define fragments. Reference the [source code for the last Hello, Spring! walkthrough][hs-source] as well as the [Class 12 videos][class12-videos]. Note that we used `template.html` as the "parent" template in that example.
    - Each template file needs the following snippet at the top:
        ```html
        <!DOCTYPE html>
        <html xmlns:th="http://www.thymeleaf.org/">
        ```
    - Thymeleaf is more strict about HTML syntax than most browsers or editors. In particular, it requires that all tags be closed. To avoid getting exceptions at runtime, check that each opening tag is either self-closing (e.g. `<br />`) or has a closing partner (e.g. `<input>...</input>`).
    - Refactor *all* Jinja2 syntax. For example, in our Jinja2 template we had this line:
        ```html
        <input name="username" type="text" value="{{ username }}">
        ```
        After refactoring and closing the `input` tag, we get this:
        ```html
        <input name="username" type="text" th:value="${username}"></input>
        ```
        Reference our [Thymeleaf Cheat Sheet][cheat-sheet] as needed.
    - Move your CSS files from the Python project to the Spring project, placing them in `src/main/resources/static/css`. Include these files in your Thymeleaf `base.html` (or `template.html`, depending on your naming choice), using the correct Thymeleaf syntax.s
    - Once you're done with the templates, stub out all of the relevant controller methods in `AuthenticationController` and `PostController`. To see which routes and controllers you'll need to set up, reference `main.py` in your Python project. Each route there should exist in our new application, with one slight modification. This route:
        ```python
        webapp2.Route('/blog/<id:\d+>', ViewPostHandler)
        ```
        becomes should correspond to this annotation on the appropriate controller method:
        ```java
        @RequestMapping(value = "/blog/{username}/{uid}", method = RequestMethod.GET)
        ```
        The main change here is that a URL that previously looked like `/blog/5` (displaying post 5) will now look like `/blog/chris/5`. We need to make this change due to slightly different ways in which Spring and Webapp2 handle dynamic URL mapping. We'll have more to say on dynamic routes below.
    - Each controller will need to return something, so return the appropriate template or redirect (see the note on redirects below). Leave the controller methods empty for now, but be sure that there are no errors in your code, that your application starts up properly, and that you can access the routes that you via your browser after starting the app. We'll work on implementing the remaining functionality in the next studio.


## Dynamic Routes / URL Parameters

In order to get a parameter from a URL, for use in your Java code, you'll need the `@PathVariable` annotation. If you named the controller that displayed a single post `singlePost`, then the method definition woudld look like this:
```java
@RequestMapping(value = "/blog/{username}/{uid}", method = RequestMethod.GET)
public String singlePost(@PathVariable String username, @PathVariable int uid, Model model) {
    ...
}
```
Note that `{username}` in the route corresponds to the method parameter `username`, and that the latter is preceded by `@PathVariable`. Spring will attempt to properly cast values for your, so there's no need to do so within your method. Simply declare the method parameter to be the type that you require.

## Redirecting

In some controllers, you may wish to redirect to a different URL within your application. In Python/Webapp2, we did this as follows.
```python
self.redirect('/blog/newpost')
```
In Spring, use this syntax.
```java
return "redirect:newpost";
```
Note that we use the template name to redirect rather than the associate request path.



[hs-source]: https://github.com/LaunchCodeEducation/hello-spring/tree/walkthrough3/src/main/resources
[class12-videos]: http://education.launchcode.org/skills-back-end-java/videos/
[cheat-sheet]: https://github.com/LaunchCodeEducation/thymeleaf-cheat-sheet
