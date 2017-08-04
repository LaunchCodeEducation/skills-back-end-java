---
title: Objectives
currentMenu: objectives
---

## Learning Objectives

Listed below are the competencies you should demonstrate by the time you've completed each class's work.

### Class 1

- Install JDK
- Install IntelliJ IDEA
- Create a "Hello World!" program in Java using a text editor
- Compile and run this program on the command line
- Create and run a "Hello World!" program using IntelliJ
- Import a project from GitHub into IntelliJ
- Explain the difference between static and dynamic typing
- Write single and multi-line comments in Java
- Name the numeric types in Java
- Declare variables in Java
- Distinguish between the primitive types and their wrapper classes
- Follow proper Java naming conventions
- Utilize basic `String` methods in Java
- Declare and initialize an array (and describe how it differs from a list in Python)
- Perform standard input and output using the `Scanner` class and `System.out`
- Describe the differences between Python functions and Java methods
- Create classes in Java
- Create `static` methods
- Describe the components of the `main` method and why it is important

### Class 2

- Use conditional statements: `if`, `else`, `else if`, `switch`
- Explain why *fallthrough* happens in some `switch` statements and how to prevent it
- Use loops: `for`, `for-each`, `while`, and `do-while`
- Modify the flow of control in loops using `break` and `continue`
- Explain the difference between `break` and `continue`
- Use `ArrayList` and `HashMap` with some common methods
- Explain the differences between an array and an `ArrayList`
- Iterate through `ArrayList` and `HashMap`
- Read, understand, and modify code written by other programmers

### Class 3

- Describe what an IDE like IntelliJ offers programmers that text editors do not
- Run your program in an IDE
- Use keyboard shortcuts in IntelliJ
- Easily refactor and rename in IntelliJ
- Diagnose logical bugs using IntelliJ's debugging tools
- Step through code in debugging mode
- Create a repo and connect it to Git in IntelliJ
- Create a `.gitignore` file
- Connect to a remote, `commit`, and `push` using Git within IntelliJ
- Create and `fetch` from an upstream branch
- Describe the MVC pattern
- Create simple Spring Boot projects using Gradle
- Run a Spring Boot web app in IntelliJ
- Understand the role of controllers in a Java web app
- Create and modify controllers to handle different routes and request types
- Use the annotations `@RequestMapping`, `@Controller`, and `@ResponseBody`
- Get data from users via `GET`, `POST`, and URL segments
- Manipulate and return user-data in your controller
- Use the classes `Model` and `HttpServletRequest`
- Redirect users to a desired route

### Class 4

- Use Thymeleaf templates for the *View* portion of MVC
- Identify differences between XHTML and HTML5
- Modify the `build.gradle` file
- Create new Templates in IntelliJ
- Pass data from the views to controllers, and from controllers to views
- Use best practices for organizing templates and request mappings
- Explain what it means for Thymeleaf to be a "natural" template
- Iterate through `ArrayList`s and `HashMap`s using Thymeleaf syntax
- Conditionally display data using Thymeleaf syntax
- Use the annotation `@RequestParam`
- Refactor recurring HTML ("boilerplate code") into a reusable template
- Include static resources such as CSS and JavaScript files

### Class 5

- Define class fields
- Explain the relationship between a class and an object
- Properly use the `this` keyword
- Explain how encapsulation results in better code
- Explain and properly use the four access modifiers: `public`, `private`, `protected`, and default (package-private, or default access)
- Explain why fields should almost always be `private`
- Explain some of the most common reasons for using getters and setters to expose access to private fields
- Describe what a property is in Java, and how it is different from a field
- Create new instances of a class using constructors
- Write constructors to properly initialize class instances
- Describe and use constructer overloading
- Describe the default constructor, including when and how it will be provided for a given class
- Use `this()` to invoke one constructor from within another in the same class
- Explain and properly use the `static` keyword
- Explain and properly use the `final` keyword
- Create constant fields

### Class 6

- Call instance methods of an object
- Define and call static methods
- Explain why instance variables may not be referenced within static methods
- Write a custom `toString` method for a given class
- Explain the concepts of object identity and equality, and how they differ
- Explain and properly use `.equals` to determine when two objects are equal
- Explain the behavior of `==` with respect to objects in Java
- Use the Single Responsibility Principle to create small, well-designed classes
- Describe and implement the best practices for implementing `.equals` within a class
- Explain when `.hashCode` should be implemented within a class
- Use IntelliJ's code generation tools to generate well-structured `.equals` and `.hashCode` methods

### Class 7

- Use the `extends` keyword to allow one class to inherit from another
- Explain which fields and methods are inherited by a class extension, based on Java's rules and taking into account access modifiers
- Call a parent class constructor from a child class constructor
- Override methods when extending a class
- Describe the role of the `Object` class in each class' hierarchy
- Describe and use abstract classes and abstract methods
- Explain how variable and parameter declaration relates to inheritance (i.e. how inheritance enables polymorphic behavior)
- Use basic class diagrams to visualize and design class relationships

### Class 8

- Use some basic Bootstrap classes to improve the look and feel of your application
- Use the Intelli-J "Generate" feature to quickly produce boilerplate code
- Explain what *refactoring* is
- Describe what the *Model* part of MVC is used for
- Differentiate between what kind of functionality should be handled by the Model versus the Controller
- Describe what model binding does, what its benefits are, and how to use it
- Explain why we should create a default constructor for all of our classes
- Describe how to use a unique identifier in a class (as we did when we solved the "remove" functionality problem)
- Describe what Spring Boot does behind the scenes for `processAddCheeseForm` when we use model binding and what annotation we have to add to utilize it
- Explain why the names of the class fields must match the names of the form fields for model binding to work

### Class 9

- Use validation on your models
- Describe how to use the Java Validation API annotations
- Explain how we can validate bound model data in the controller and how the annotations we use in the controller relate to the validation annotations we use in the model class
- Display error messages in the view
- Use the Thymeleaf `th:object` tag in a form
- Explain what *enum types* are and when you would want to use them
- Use an enum type and then represent that data in a `<select>` element.
- Explain the difference between these syntaxes in Thymeleaf: `*{}` and `${}`


### Class 10

- Define what an exception is
- Describe what happens "behind the scenes" when an exception occurs
- Explain what the following terms and phrases mean: *throw an exception*, *call stack*, *exception handler*, *catch the exception*, *catch or specify requirement*
- Describe the three kinds of exceptions and whether each is subject to the Catch or Specify Requirement
- Describe how to use the three exception handler components: the `try`, `catch`, and `finally` blocks
- Explain how to throw exceptions and how the `Throwable` class fits into this
- Explain what *chained exceptions* are and how they can be useful to programmers
- Create your own exception classes
- Describe the advantages of exceptions
- Explain what the best practices are for exception handling
- Use exceptions appropriately in your programs (follow the golden rules of handling exceptions)

### Class 11

- Define polymorphism
- Describe what an interface is and how it enables polymorphism
- Explain whether an interface can be instantiated
- Implement common standard Java interfaces 
- Define what a default method is and whether you should write one when creating a new interface
- Use the appropriate interface for collection types depending on the behavior they must exhibit
- Describe the differences between abstract classes and interfaces
- Explain what the benefits are to "coding to an interface"
- Use the `Comparator.compare()` method

### Class 12

- Define Object-Relational Mapping
- Describe waht a data layer is and how it is used in ORM
- Explain what the acronym *CRUD* stands for 
- Describe the one-to-many relationship 
- Use the following annotations and describe what they accomplish: `@Entity`, `@Id`, `@GeneratedValue`, `@Autowired`, `@Repository`, `@Transactional`, `@OneToMany`, `@JoinColumn`, `@ManyToOne`
- Explain what a *DAO* is and how it functions
- Understand how Spring Data, JPA, and Hibernate function in our `cheese-mvc` application


### Class 13

- Describe the many-to-many relationship and give an example of when this may be a good way to represent data in your database 
- Explain what a join table is and how it is used
- Define what a composite key is
- Build model classes that enable persistent many-to-many relationships
- Use the `@ManyToMany` annotation
- Work with many-to-many relationships in the view and controller
- Push the changes you make to objects in your program to the database


