---
title: 'Assignment: TechJobs (Console Edition)'
currentMenu: assignments
---

## Introduction

Congratulations! Based on your hard work and strong coding skills, you've been brought an as an apprentice at LaunchCode. You're an apprentice member of the LaunchCode Tech Team, and you've been paired with a mentor to help you get comfortable and continue learning.

The Company Team at LaunchCode works with employer partners to match qualified programmers with apprenticeships. Theye've asked for a new tool to be built to help them easily manage data for currently available jobs. Over the next few weeks, you'll help them build this application, along with your mentor.

This first project will be a simple proof-of-concept prototype. It won't be pretty, or have lots of features, but it'll give you a chance to work through some initial concepts and get feedback from LaunchCode staff.

## Learning Objectives

In this project, you'll show that you can:

- Read and understand code written by others
- Use core Java syntax (methods, variables, loops, conditionals)
- Utilize `ArrayList` and `HashMap` collection types
- Work with console I/O via the `Scanner` class
- Work with data types and arrays

## TechJobs (Console Edition)

The app you'll be working on is a simple console (i.e. command-line) prototype of the new TechJobs app. It will allow users (i.e. LaunchCode staff) to browse and search listings of open jobs by employer partners.

The prototype process will give everybody a chance to work out some initial ideas without investing a ton of time into developing a finished product. Once everybody is happy with the prototype, the Tech Team will begin work toward a full-fledged application.

## Your Assignment

Your staff mentor has created a basic console application structure and started to fill in some details. The starter code you've been given allows users to search job listings by employer and skill. It also is capable of displaying lists of all employers and all skills within the system.

Your mentor has handed it off to you with the task of adding a couple of features, and then getting feedback from the Company Team.

### Getting Started

Before diving in and starting to code, make sure you understand what the code you've been given does. Since the code that you've been given is a functioning program, go ahead and run it to see how it works. To do this, right-click on the `main` method in the `TechJobs` class and select *Run TechJobs.main()*.

#### The TechJobs Class

The `TechJobs` class contains the `main` method that will drive our program's functionality. It contains three methods:

1. `main` - the main application runner
2. `displayChoiceMenu` - a utility method that displays a menut of choices, and returns the user's choice to the code that called it
3. `printJobs` - a utility method that prints a list of jobs to the console in a nicely-formatted manner

The logic within `main` presents menus in turn, and based on the user choice, takes appropraite action. Note all of the code within this method is contained in a while loop that starts `while (true)`. This may seem odd, but actually makes a lot of sense once explained. We want our application to continually run until the user has decided they want to quite. The simplest way to do this is to loop forever. When the user wants to quit, they can kill our program by pressing ctrl-C (a widely-known command to kill a console application).

> *NOTE:* Within IntelliJ's console, ctrl-C won't function the same way as in a normal console. Instead, use the red square "stop" icon on the left of the Run pane.


The `displayMenuChoice` method takes in an array of choices, along with a bit of intro text to print above the menu to describe the menu's purpose.

Most of it's code is within a do-while loop. A [do-while loop](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html) is similar to a while loop, but the conditional check is at the *end* of the loop's code block. This has the net consequence that the loop's code block *always runs at least once*. At the end of the block's execution, we check a condition to determine if we should run the block again. This nicely mimics the behavior of simple menu-driven applications.

Within this loop, menu options are printed to the screen and user input is collected. If input is valid, it returns the choice as an `Integer` to the caller, and if invalid, it re-prompts the user.

The `printJobs` method is relatively simple. We'll leave it's behavior for you to explore.

#### The Data File: jobs_data.csv

Our simple app doesn't connect to a database. If the prototype proves useful and we continue development, we'll add that functionality later. But for now, we've been given a CSV (comma-separated values) file from the Company Team at LaunchCode that contains some recent jobs. This file was exported from an Excel spreadsheet into this format, which is easy for programs to read in.

If CSV files are new to you, don't worry. CSV files are conceptually similar to simple spreadsheets in that they organize data in "rows" and "columns". The major difference is that they don't have the ability to carry out calculations the way spreadsheets do.

Open up `jobs_data.csv`, which is in the `resources` folder at the top level of the `java-exercises` project. You'll see that the first line is:

```nohighlight
"name","desc","employer","skills","core skill"
```

Often in CSV files, as is the case here, the first line represents the column names. We have 5 names here, surrounded with doubl-quotes, which indicates that each of our rows in the CSV file should have 5 fields. In this file format, a "row" corresponds to a new line. So each line below the first will constitute a row of data, or a record.

Have a look a the data below line 1, and ask yourself the following quetions:
- Which fields match up with which column names above?
- Why do some lines/rows have more commas than others, if commas are supposed to separate columns?
- What role do the double-quotes play?

#### The JobData Class

The `JobData` class is responsible for importing the data from the CSV file and parsing it into a Java-friendly format, that is, into `HashMap` and `ArrayList` form. The first method in this class is `loadData`, which does just what it advertises. After parsing the file data, private property `allJobs`, which is an `ArrayList<HashMap<String, String>>`.

Let's look at what this data type is. It purports to be an `ArrayList` that stores `HashMap` objects which have `String` keys and `String` values. If we were to represent some of this data visually, using `[]` for an `ArrayList` and `{}` with key/value pairs (as in Python lists and dictionaries), it would look like this:

```nohighlight
[
    {
        "employer": "Enterprise",
        "name": "Full-stack Java Web Developer",
        "description": "Enhance and maintain our team's Spring application for company payroll",
        "skills": "Java, HTML, CSS, SQL",
        "core skill": "Java"
    },
    {
        "employer": "Asynchrony",
        "name": "Front-end Developer",
        "description": "Develop cutting-edge Javascript apps to meet client needs",
        "skills": "Javascript, HTML, CSS",
        "core skill": "Javascript"
    },
    ...
]
```

If you look at `loadData` you'll see a lot of unfamiliar code. Your mentor wrote this essential piece of code for you, and while you won't have to modify it, it will be useful to have an idea of how it works. Read through the code until you feel like you can describe it's functionality at a basic level.

There are four more methods in `JobData`, each of which is public: `getAllEmployers`, `getJobsByEmployer`, `getAllSkills`, and `getJobsBySkill`. These methods have descriptive comments, so we leave it to you to read the code and ask questions if you don't understand what's happening.

Hear are a few questions to ask yourself while reading this code:
- What is the data type of a "job" record?
- Why does `getAllSkills` return something of type `ArrayList<String>` and `getJobsBySkill` return something of type `ArrayList<HashMap<String, String>>`?
- Why is `loadData` called at the top of each of these four methods? Does this mean that we load the data from the CSV file each time one of them is called?

### Your Tasks

#### Add Core Skills Field

When initially providing input on how the app should work, the Company Team forgot to mention that they categorize skills in two ways. They list all skills required for the job, but since not all skills are utilized equally, they also list a "core skill". For example, a job might consist of mostly writing Java programs, but might also require a bit of SQL and HTML knowledged. The core skill field helps them easily identify which skill is most important for each job.

Consequently, when you run the application, you'll see that the core skill field is not displayed in a job listing. Your first task is to fix it.

Here are some questions to ask yourself as you get started:
- Is the core skill field being imported from the CSV file into the `allJobs` propery of `JobData`?
- If not, how would you go about importing it? If so, what is the key string for this field within `allJobs`?
- Which user actions result in the display of full job listings? Where in the `TechJobs` class does the corresponding code live?
- Which method(s) will need to be changed in order to update job listing display?

#### Search and Browse By Core Skill

Now that core skills are being displayed in search results, the Company Team would like to be able to search and browser by core skill. Your next task is to add this functionality.

There is nothing conceptually different about searching for listings with a given core skill when compared to searching for listings with a given skill or employer. And these latter search options are already part of the program's functionality. Thus, you should

Here are some questions to ask yourself as you get started:
- How are the items in the Search and Browse menus determined?
- How does the `main` method of `TechJobs` respond to a user's selection of which field to search or browse by?
- Which code currently facilitates the lookup of jobs with a given skill or employer within the `JobData` class?
- Which code currently facilitates the listing of all skills or all employers within `JobData`?

#### Make Search Methods Case-Insensitive

You've completed your first two tasks well! Then you demoed the updated application or the Company Team and they noticed a feature that could be improved. When searcing for jobs with the skill "JavaScript" (as it is sometimes spelled) no results were returned, even though there were actual Javascript jobs in the system. The search methods turn out to be case-senstivive, so they treat "JavaScript" and "Javascript" as different strings.

The Company Team has *demanded* (ahem, *strontly requested*, they politely clarify) that this be fixed. And you've told them that you're up to the task.

Here are some questions to ask yourself as you get started:
- Which methods are called when searching?
- How is the user's search string compared against the values of fields of the job `HashMap` objects?
- How can you make this comparison in a way that effectively ignores the case of the strings?
- How can  you do this *without* altering the capitaliztion of the items in `allJobs`, that is, so that you don't change the data, and consequently it is printed out the same way that it appears in `job_data.csv`?

### Sanity Check

Before submitting, make sure your application:

- Core skills are listed as a separate field in each job listing.
- Allows users to browse by core skill, with a resulting list of all core skills displayed.
- Allows users to search by core skill, with all matching job listings displayed.
- Search results for employer, skill, and core skill are case-insensitive.

### How to Submit

To turn in your assignment and get credit, follow the [submission instructions][submission-instructions].

[submission-instructions]: ../
