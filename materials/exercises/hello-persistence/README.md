# Exercise: Hello, Persistence!

If you haven't done so already, follow along with the [persistence video][persistence-walkthrough] to implement storing data in our Hello, Spring! application.

You'll need the following files:
- [applications.properties][props]
- [pom.xml][pom]

For the POM, you may also add the dependencies manually though the dependencies tab of the POM editor in Eclipse. If doing so, use these Group/Artifact pairs:
- `org.springframework.boot` / `spring-boot-starter-jdbc`
- `org.springframework.boot` / `spring-boot-starter-data-jpa`
- `mysql` / `mysql-connector-java`

If you complete that task with time to spare, implement another persistent model class of your choosing, and use it in your models and controllers in some fashion.

[persistence-walkthrough]: https://www.youtube.com/watch?v=kEwiIYUFolA
[props]: https://gist.github.com/chrisbay/59b530ea924ad1a4d150c69778203483
[pom]: https://gist.github.com/chrisbay/f1e8b1085ed07677a733079c8d881427
