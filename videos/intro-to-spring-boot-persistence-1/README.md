---
title: "Intro to Spring Boot: Persisting Objects with JPA"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/8JI2vH3GwSg" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this lesson we'll enable persistence in our `cheese-mvc` application. Specifically, we'll create a Data Access Object interface and we'll look at the following useful annotations: `@Entity`, `@Id`, `@GeneratedValue`, `@Autowired`, `@Repository`, and `@Transactional`.

### Lions and Tigers and Bears!

Spring Data, JPA, Hibernate! What are these things? Why do we have to use them? And don't they kind of seem like the same thing?

These are good questions, and we agree that it's a confusing situation. These three packages do different things, yet they're each necessary to work with data in our Spring Boot applications. And the lines between them can be confusing. Together, they make up the "data layer" of our Spring Boot applications.

Here's a high-level way of understanding what these three packages are, and what they do.

#### Spring Data

This Spring Project strives to make it easy to work with data within Spring applications. For example, Spring Data provides the `CrudRepository` interface that we use within our controllers to find and save objects. In general, you can think of functionality at the "front" of the data layer - that is, where the controller layer interacts with the data layer - as being provided by Spring Data.

#### Java Persistence API (JPA)

The [Java Persistence API](https://en.wikipedia.org/wiki/Java_Persistence_API) is a specification that describes how relational data can be managed within Java applications. It is a standard, and not a specific implementation of the functionality that it describes.

Using the JPA - in our case, via JPA annotations - means that we can code to a specification rather than a specific framework. We can write our code so that it it works with JPA standard annotations, and our application can be agnostic of the way in which the specification is implemented. The implementation of JPA that is used is typically a third-party package, and we could swap out such packages readily without having to change our own code that uses the JPA standard.

This is similar to the way in which an interface works. If we code to an interface, we don't need to worry about the specific class that implements the interface, because all we need to be concerned with is the interface contract.

In working with data in Spring, we use JPA when we annotate our model classes with `@Entity`, and when we annotate model fields using annotations like `@Id` and `@OneToMany`. These annotations are part of the JPA standard. We can think of the main functionality of our data layer as being laid out by JPA.

#### Hibernate

JPA is a specification. In other words, it provides the rules that our code must abide by to store object data in a database, but it doesn't provide the actual functionality to do so. This is where Hibernate comes in.

Hibernate provides an implementation of the JPA standard. We use the JPA standard annotations to indicate how our model classes should be stored in a database, but the hard work of actually translating our object date into relational data -- from Java classes to MySQL table rows -- is carried out by Hibernate.

Hibernate is a large package. It provides an implementation of the JPA standard, but it does much more. We'll only use its JPA-related features, which means that for the most part, when we're writing code we won't even know that Hibernate is part of the equation. We'll use Spring Data interfaces, and JPA annotations, and they'll work thanks to Hibernate's work in the background.

Thus, we can think of the "back" of the data layer - that is, the portion that interacts directly with the database - as the Hibernate framework.

## Code

We start this lesson with the code in the `video-jpa-start` branch of the cheese-mvc repo: [starting code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-jpa-start)

We end this lesson with the code in the `video-jpa-end` branch of the cheese-mvc repo: [ending code](https://github.com/LaunchCodeEducation/cheese-mvc/tree/video-jpa-end)

## References

- [Accessing Data in Spring Boot with MySQL](https://spring.io/guides/gs/accessing-data-mysql/)
- [Spring Boot Persistence Cheatsheet](https://github.com/LaunchCodeEducation/cheatsheets/tree/master/spring-persistence)
- [CrudRepository Interface](http://docs.spring.io/spring-data/commons/docs/1.6.3.RELEASE/api/org/springframework/data/repository/CrudRepository.html)
- [Query Creation](http://docs.spring.io/spring-data/jpa/docs/current/reference/html/#repositories.query-methods.query-creation)
- [Java Persistence API](http://docs.oracle.com/javaee/6/tutorial/doc/bnbpz.html)
