---
title: "Intro to Spring Boot: Controllers"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/5kkW_Sx1zHA" frameborder="0" allowfullscreen></iframe></div>

## Notes

Spring Boot is a framework used to build Java web applications that implement the [MVC](https://code.tutsplus.com/tutorials/mvc-for-noobs--net-10488) pattern. For more about Spring, check out [Spring IO](https://spring.io/). Some of the benefits of Spring Boot are:

- Web development is simplified even more in Spring Boot than in Spring
- It provides Tomcat as an embedded web server
- A lot of settings are preconfigured for us so there's no need for additional XML configuration

### Create a Simple Spring Boot Project

- Go to [start.spring.io](https://start.spring.io/)
- Select *Gradle Project*, *Java*, and *1.5.12* from the dropdown for "Generate a \_\_\_ with \_\_\_ and Spring Boot \_\_\_"
- Put the title for your project, `hello-spring`, in the section marked *Artifact*
- Search for and add the following *dependencies*: Web, Thymeleaf, DevTools then click "Generate"
- Move the downloaded unzipped folder from downloads into another location such as `LC101` or your home directory
- Start IntelliJ
- Select *Import Project* and browse to where you put the downloaded file
- Select "Create project from existing sources"
- Accept all defaults as you create the project
- If you see an *Unlinked Gradle Project* popup, go ahead and click "Import Gradle Project", then check the "Use auto-import" box and leave everything else as it is.

<aside class="aside-note" markdown="1">
You may see a pop-up in the lower left-hand corner in your _Event Log_ that reads: **Unindexed remote maven repositories found**.

1. Select **Open repositories list** in the Event Log message. This will open the _Preferences_ (or _Settings_ for Windows users) window to _Build, Execution, Deployment > Build Tools > Maven > Repositories_ .
2. Select the Maven repository (https://repo1.maven.org/maven2) and click _Update_ on the side.

</aside>

<aside class="aside-warning" markdown="1">
This update usually takes about 20 minutes but can last up to an hour.
</aside>


- To run the application, click on the Gradle icon on the side, then go into *Tasks->application* and double-click *bootRun*

<aside class="aside-note" markdown="1">
If you don't see the Gradle side bar, click the panel icon in the bottom left and select *Gradle*.

Also note that you may not see the same output in the Gradle panel as is shown in the video. You may see something that looks more like this:
![windows bootRun](images/windowsBootRun.png)

If you do, click the circled icon to toggle the view so that it matches the one in the video.
</aside>
- You can then visit the corresponding web page at `localhost:8080` (Right now, you'll see an error page, but we'll fix that below.) Now go ahead and stop the application.

### Create a Controller for your Spring Boot Project

- First, add the necessary classes to your *src->main->java->org.yourorgname->HelloSpringApplication*: `SpringBootApplication` and `SpringApplication`.
- Next, go to *src->main->java* and right click on your `org.yourorgname` package and then select *New->Package* and name your new package `controllers`.
- Add a *New->Java Class* to the package `controllers` and name it `HelloController`.
- Above the class definition for `HelloController` add the annotation `@Controller` and add the corresponding class to your project.
- Add this code to the body of your `HelloController` class:
```Java
    @RequestMapping(value="")
    @ResponseBody
    public String index(){
        return "Hello World";
    }
```
- Use Gradle to *bootRun* again and visit *localhost:8080*. You should see "Hello World"
- Now add another controller at another path by adding this code below the code posted above:
```Java
    @RequestMapping(value="goodbye")
    @ResponseBody
    public String goodbye(){
        return "Goodbye";
    }
```
- Run the application again and visit *localhost:8080/goodbye* and you should see "Goodbye".

Congratulations! You just ran your first Spring Boot program in IntelliJ!

<aside class="aside-pro-tip" markdown="1">
IntelliJ has a lot of helpful keyboard shortcuts. You saw me use `option + return` (or `alt + enter` on Windows and Linux) in this video. Find out more [here](https://www.jetbrains.com/help/idea/2017.1/keyboard-shortcuts-you-cannot-miss.html).
</aside>
