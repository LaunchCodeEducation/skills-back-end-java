---
title: Naming Conventions
currentMenu: java4python
---

Java has some very straightforward naming conventions. These are universally used by Java programmers, and differ in some cases from conventions commonly used in Python or other languages.

Again, these are conventions. Not following them will not prevent your code from running, as long as you are following Java's naming rules

Identifier Type | Convention | Examples
|---------------|------------|----------|
Package | All lowercase | `demos.java4python` <br> `org.launchcode.utilities`
Class | Start with an uppercase letter | `Scanner` <br> `System` <br> `Hello`
Method | Start with a lower case letter, and use camelCase to represent multiword method names | `nextInt()` <br> `getId()`
Instance variable | Start with a lowercase letter and use camelCase | `id` <br> `firstName`
Constant* | All uppercase letters, words separated by underscores | `MAX_INT`

\* Constants in Java are variables created using both `static` and `final` modifiers. For example: `static final Double PI = 3.14159;`

Oracle, the company that develops the Java language, provides some [more detailed naming conventions](http://www.oracle.com/technetwork/java/codeconventions-135099.html). (From the date on this article, you'll note that these have been relatively standard for a very long time!)
