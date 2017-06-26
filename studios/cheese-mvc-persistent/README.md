---
title: 'Studio: CheeseMVC Persistent'
currentMenu: studios
---

In this studio, you'll implement the functionality described in the video lessons on using Spring Data.

## Getting Ready

Let's set up a new project for this studio. That way, everybody will start with the same code. If you've been working on `cheese-mvc` on your own, you should still do this. The instructions assume certain structure to your model classes and controllers.

Set up a local copy of the project:
- Visit the [repository page](https://github.com/LaunchCodeEducation/cheese-mvc-persistent) for this project and fork the repository to create a copy under your own GitHub account.
- Back in IntelliJ, if you have a project open, select *File > Close Project*.
- On the IntelliJ welcome screen, click *Check out from Version Control*, select Github..
- Choose your fork from the repository dropdown, select the parent directory where you'd like to store your project, and hit *Clone*.
- In the screens that follow:
    - Choose *Create Project From Existing Sources* on the first pane
    - Select *Auto Import* in the Gradle configuration pane
    - Select defaults on all other panes

## Getting Started

This studio has multiple parts that can be completed over the course of multiple class periods. Unlike previous studios, *do not* expect that you can complete all of the work here in a single class. Do as much as you can, and then pick up where you left off during the next class. Proceed at your own pace, but be sure to complete them all in order to learn the concepts.

## Database Setup

Follow the same steps in the [Setting Up the Database](../../class-prep/12/setup.html#setting-up-the-database) section of the setup article you followed, using the user name / password pair: **cheese-mvc-data** / **cheese**.

If you've started working with data in your own `cheese-mvc` app, these different names will keep those from trying to use the same database, which would cause problems.

- [Part 1: Persisting a Single Class](single-class-persistence/)
- [Part 2: Setting Up a One-to-Many Relationship](one-to-many/)
- [Part 3: Setting Up a Many-to-Many Relationship](many-to-many/)
