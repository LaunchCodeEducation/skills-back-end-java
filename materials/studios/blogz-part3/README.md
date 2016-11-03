# Studio: Blogz Part 3

We continue our work on the Java version of the Blogz app by creating a basic Spring Boot application and moving our previos work into this application.

Many of the steps in this studio mirror steps carried out in the Hello, Spring! walkthrough. Refer to the [video][hs-vid] and [source code][hs-source] for that walkthrough as needed.

1. Visit [start.spring.io](http://start.spring.io/) and create a project with Group and Artifact names `org.launchcode` and `blogz`, respectively. Add dependencies **Web** and **Thymeleaf** to your project and hit **Generate Project**.
2. Unzip the resulting .zip file and move it to a working directory. Import the project into Eclipse using **General > Projects from Folder or Archive**. If this option isn't available to you, upgrade to Eclipse Neon or try the **Maven > Existing Maven Project** option.
3. Create a `blogz` package within the `org.launchcode` package in the `src/main/java` folder. Create `models` and `controllers` packages within `org.launchcode.blogz`.
4. Copy your `User`, `Post`, and `Entity` classes from the `java-track` into `org.launchcode.models`. The best way to do this is to create the class files "cleanly" (right-click on the package, select **New > Class**) and then copy the class declaration and import statements into the new files. Be careful to not copy the old package declarations since those will be different in the new location.
5. Using the same method as the previous step, copy your unit tests into the new project, placing them in the `org.launchcode.blogz.models` package within the `src/test/java` (**not** `src/main/java`) folder. You'll need to create `blogz` and `models` packages here. Make sure your unit tests run and all pass in this new location.
6. Within `org.launchcode.blogz.controllers` create two controller classes: `AuthenticationController` and `PostController`. Give these classes the `@Controller` annotation.
7. We want to test that our application is set up properly, and will run. To this end, add a single method in `AuthenticationController` that responds to GET requests to the path `/login` with the simple string `"login form"`.(We'll add an actual login form soon.) You'll need the `@RequestMapping` and `@ResponseBody` annotations with appropriate parameters. See the source code linked above for reference.
8. Start your application by right-clicking on the `org.launchcode.BlogzApplication` class and selecting **Run As > Java Application**. Check the console to make sure the app started up cleanly, and then open `http://localhost:8080/login` in a browser to make sure you receive the correct response.

[hs-vid]: https://youtu.be/Kgnr9oMpcx8
[hs-source]: https://github.com/LaunchCodeEducation/hello-spring
