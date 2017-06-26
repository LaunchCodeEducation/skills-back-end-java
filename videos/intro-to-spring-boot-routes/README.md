---
title: "Intro to Spring Boot: Routes"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/C3ZrOj4unss" frameborder="0" allowfullscreen></iframe></div>

## Notes

A *route* is the mechanism by which a request path gets assigned to a controller within our application. In this video we'll explore routes and how data is transferred from a web page to a specific controller. 

<aside class="aside-note" markdown="1">
Be aware that you can change the URL segment for a group of controllers by using the `@RequestMapping` annotation at the class level. We won't be doing much of this right now, but in future web apps that technique will come in handy. 
</aside>

We'll look at three different ways handlers can receive data from users:
1. Via a `GET` request and query parameters
2. Via a `POST` request and post parameters
3. Via a URL segment and a path variable

### Data Transfer by `GET` 

- Add to your controller a parameter that is a request object of the `HttpServletRequest` class.
- Get data from this request object by using the key of the desired parameter and the method `getParameter`.
- Use the data in your controller to return a customized greeting.
```Java
    @RequestMapping(value = "")
    @ResponseBody
    public String index(HttpServletRequest request){
        String name = request.getParameter("name");
        return "Hello " + name;
    }
``` 

### Data Transfer by `POST`

- Display a form that will allow the user to submit data. To do this, create a new request handler that returns a string of HTML.
```Java
    @RequestMapping(value = "hello", method = RequestMethod.GET)
    @ResponseBody
    public String helloForm(){
        String html = "<form method='post'>" +
                "<input type='text' name='name' />" +
                "<input type='submit' value='Greet Me!'/>" +
                "</form>";
        return html;
    }
```
- Create another handler that will handle `POST` requests and access the request object.
```Java
    @RequestMapping(value = "hello", method = RequestMethod.POST)
    @ResponseBody
    public String helloPost(HttpServletRequest request){
        String name = request.getParameter("name");
        return "Hello " + name;
    }
```

### Data Transfer by URL Segment

- Create a new handler that will access data via a URL segment:
```Java
    @RequestMapping(value = "hello/{name}")
    @ResponseBody
    public String helloUrlSegment(@PathVariable String name){
        return "Hello " + name;
    }
```

<aside class="aside-note" markdown="1">
Also know that you can redirect a user by removing the `@ResponseBody` annotation from the controller and returning `"redirect:/DESIREDPATH"`.
</aside>