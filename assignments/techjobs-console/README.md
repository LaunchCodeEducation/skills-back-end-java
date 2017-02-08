---
title: 'Assignment: TechJobs (Console Edition)'
currentMenu: assignments
---

## Introduction

Congratulations! Based on your hard work and strong coding skills, you've been brought an as an apprentice at LaunchCode. You're an apprentice member of the LaunchCode Tech Team, and you've been paired with a mentor to help you get comfortable and continue learning.

The Company Team at LaunchCode works with employer partners to match qualified programmers with apprenticeships. Theye've asked for a new tool to be built to help them easily manage data for currently available jobs. Over the next few weeks, you'll help them build this application alongside mentors from the Tech Team.

This first project will be a simple proof-of-concept prototype. It won't be pretty, or have lots of features, but it'll give you a chance to work through some initial concepts and get feedback from LaunchCode staff. Your mentor on this project is Kathy.

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

Kathy has created a basic console application structure and started to fill in some details. The starter code you've been given allows users to search job listings by employer and skill. It also is capable of displaying lists of all employers and all skills within the system.

Kathy has handed it off to you with the task of adding a couple of features, and then getting feedback from the Company Team.

If you work through the tasks Kathy has laid out for you, tackle one or more of the [bonus missions](#bonus-missions).

### Getting Started

Set up a local copy of the project:
- Visit the [repository page](https://github.com/LaunchCodeEducation/techjobs-console-java) for this project and fork the repository to create a copy under your own GitHub account.
- Back in IntelliJ, select *File > New > Project from Version Control > GitHub*.
- Choose your fork from the repository dropdown, select the parent directory where you'd like to store your project, and hit *Clone*.
- In the screens that follow, be sure to choose *Create Project From Existing Sources* on the first pane, and select the default values of all following panes.

Before diving in and starting to code, make sure you understand what the code you've been given does. Since you're starting with a functioning program, go ahead and run it to see how it works. To do this, right-click on the `main` method in the `TechJobs` class and select *Run TechJobs.main()*.

#### The TechJobs Class

The `TechJobs` class contains the `main` method that will drive our program's functionality. It contains three methods:

1. `main` - the main application runner
2. `displayChoiceMenu` - a utility method that displays a menut of choices, and returns the user's choice to the code that called it
3. `printJobs` - a utility method that prints a list of jobs to the console in a nicely-formatted manner

The logic within `main` presents menus in turn, and based on the user choice, takes appropriate action. Note all of the code within this method is contained in a while loop that starts `while (true)`. This may seem odd, but actually makes a lot of sense after a simple explanation. We want our application to continually run until the user has decided they want to quit. The simplest way to do this is to loop forever. When the user wants to quit, they can kill our program by pressing ctrl-C (a widely-known command to kill a console application).

<aside class="aside-note" markdown="1">Within IntelliJ's console, ctrl-C won't function the same way as in a normal console. Instead, use the red square "stop" icon on the left of the Run pane.</aside>

The `displayMenuChoice` method takes in an array of choices, along with a bit of intro text to print above the menu to describe the menu's purpose.

Most of it's code is within a do-while loop. A [do-while loop](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html) is similar to a while loop, but the conditional check is at the *end* of the loop's code block. This has the net consequence that the loop's code block *always runs at least once*. At the end of the block's execution, we check a condition to determine if we should run the block again. This nicely mimics the behavior of simple menu-driven applications.

Within this loop, menu options are printed to the screen and user input is collected. If input is valid, it returns the choice as an `Integer` to the caller, and if invalid, it re-prompts the user.

The `printJobs` method is relatively simple. We'll leave its behavior for you to explore.

#### The Data File: jobs_data.csv

Our simple app doesn't connect to a database. If the prototype proves useful and we continue development, we'll add that functionality later. But for now, we've been given a CSV (comma-separated values) file from the Company Team at LaunchCode that contains some recent jobs. This file was exported from an Excel spreadsheet into this format, which is easy for programs to read in.

If CSV files are new to you, don't worry, they're easy to understand. CSV files are conceptually similar to simple spreadsheets in that they organize data in rows and columns. The major difference is that they don't have the ability to carry out calculations the way spreadsheets do, and you can easily open, read, and edit them in plain text editors.

Open up `jobs_data.csv`, which is in the `resources` folder at the top level of the project. You'll see that the first line is:

```nohighlight
name,employer,location,position type,core competency
```

While it isn't required, the first line of a CSV file often represents the column names. We have 5 names here, which indicates that each of our rows in the CSV file should have 5 fields. In this file format, a "row" corresponds to a new line. So each line below the first will constitute a row of data, or a record.

Have a look a the data below line 1, and ask yourself the following quetions:
- Which fields match up with which column names above?
- Why do some lines/rows (e.g. line 10) have more commas than others, if commas are supposed to separate columns?
- What role do the double-quotes play?

#### The JobData Class

The `JobData` class is responsible for importing the data from the CSV file and parsing it into a Java-friendly format, that is, into `HashMap` and `ArrayList` form. The first method in this class is `loadData`, which does just what it advertises. After parsing the file data, it stores the data in the private property `allJobs` which is of type `ArrayList<HashMap<String, String>>`.

<aside class="aside-note" markdown="1">We haven't covered statics in-depth yet. For this assignment, know simply that they allow us to use properties and methods of a class without creating an object from that class. For example, we can call `JobData.getAllSkills()` from the `TechJob` class.</p>

If you want to create a new method in `JobData`, or add a property, be sure to declare it `static`.
</aside>

Let's look more closely at the data type is of `allJobs`. It purports to be an `ArrayList` that stores `HashMap` objects which have `String` keys and `String` values. If we were to represent some of this data visually, using `[]` for an `ArrayList` and `{}` with key/value pairs (as in Python lists and dictionaries), it would look like this:

```nohighlight
[
	{
		"name": "Junior Data Analyst",
		"employer": "Lockerdome",
		"location": "Saint Louis",
		"position type": "Data Scientist / Business Intelligence",
		"core competency": "Statistical Analysis"
	},
	{
		"name": "Junior Web Developer",
		"employer": "Cozy",
		"location": "Portland",
		"position type": "Web - Back End",
		"core competency": "Ruby"
	},
	...
]
```

If you look at `loadData` you'll see a lot of unfamiliar code. Kathy wrote this essential piece of code for you, and while you won't have to modify it, it will be useful to have an idea of how it works. Read through the code until you feel like you can describe its functionality at a basic level.

There are four more methods in `JobData`, each of which is public (and `static`, per our earlier note): `getAllEmployers`, `getJobsByEmployer`, `getAllSkills`, and `getJobsBySkill`. These methods have descriptive comments, so we leave it to you to read the code and ask questions if you don't understand what's happening.

Hear are a few questions to ask yourself while reading this code:
- What is the data type of a "job" record?
- Why does `getAllSkills` return something of type `ArrayList<String>` and `getJobsBySkill` return something of type `ArrayList<HashMap<String, String>>`?
- Why is `loadData` called at the top of each of these four methods? Does this mean that we load the data from the CSV file each time one of them is called?

### Your Tasks

#### Add Position Type Field

When initially providing input on how the app should work, the Company Team forgot to mention that they categorize skills in two ways. They list the primary skill required for the job, but they also list a "position type". For example, a job might consist of mostly writing Python programs, but more specifically might be a "Data Scientist / Business Intelligence" role (as opposed to a Python web developer).

Consequently, when you run the application, you'll see that the position type field is not displayed in a job listing. Your first task is to fix this.

Here are some questions to ask yourself as you get started:
- Is the position type field being imported from the CSV file into the `allJobs` propery of `JobData`?
- If not, how would you go about importing it? If so, what is the key string for this field within `allJobs`?
- Which user action(s) result in the display of full job listings? Where in the `TechJobs` class does the corresponding code live?
- Which method(s) will need to be changed in order to update job listing display?

#### Search and Browse By Position Type

Now that position types are being displayed in search results, the Company Team would like to be able to search and browser by position type. Your next task is to add this functionality.

There is nothing conceptually different about searching for listings with a given position type in comparison to searching for listings with a given skill or employer. And these latter search options are already part of the program's functionality. Thus, you should examine how search is implemented for employer and skill fields.

Here are some questions to ask yourself as you get started:
- How are the items in the Search and Browse menus determined?
- How does the `main` method of `TechJobs` respond to a user's selection of which field to search or browse by?
- Which code currently facilitates the lookup of jobs with a given skill or employer within the `JobData` class?
- Which code currently facilitates the listing of all skills or all employers within `JobData`?

#### Make Search Methods Case-Insensitive

You've completed your first two tasks! Then you demoed the updated application or the Company Team and they noticed a feature that could be improved. When searcing for jobs with the skill "JavaScript" some results were missing (e.g. the Watchtower Security job on line 31 of the CSV file). The search methods turn out to be case-senstivive, so they treat "JavaScript" and "Javascript" as different strings.

The Company Team has *demanded* (ahem, *strontly requested*, they politely clarify) that this be fixed. And you've told them that you're up to the task.

Here are some questions to ask yourself as you get started:
- Which methods are called when searching?
- How is the user's search string compared against the values of fields of the job `HashMap` objects?
- How can you make this comparison in a way that effectively ignores the case of the strings?
- How can  you do this *without* altering the capitaliztion of the items in `allJobs`, that is, so that you don't change the data, and consequently it is printed out the same way that it appears in `job_data.csv`?

Once you have an idea for how to approach this, you'll likely need your favorite search engine to find out exactly how to it in Java.

When this task is completed, you're done!

### Sanity Check

Before submitting, make sure that your application:

- Lists position type as a separate field in each job listing.
- Allows users to browse by position type, with a resulting list of all position types displayed.
- Allows users to search by position type, with all matching job listings displayed.
- Search results for employer, skill, and position type are case-insensitive.

### How to Submit

To turn in your assignment and get credit, follow the [submission instructions][submission-instructions].

## Bonus Missions

If you want to take your learning a few steps further, here are some additional problems you can try to solve. We're not providing you much guidance, but we have confidences that you can figure these problems out!

- **Sorting browse listings**: When browsing lists of employers, skills, and position types, it would be nice if results were sorted alphabetically. Make this happen.
- **Magic strings**: Programmers use the phrase "magic value" (e.g. ["magic number"](https://en.wikipedia.org/wiki/Magic_number_%28programming%29) or "magic string") to refer to a literal value that appears within code without a clear reason for why it has the value that it does. Magic values can easily lead to confusion and bugs. There are multiple magic strings throughout our code. In particular, the column names from the CSV file are used explicitely in `TechJobs.printJobs` and each of the public methods of `JobData`. If we were to change the column names in the CSV file, it would be a pain (and error-prone) to update our code. Get rid of these magic strings, replacing the column names with constants (i.e. `static final` strings) within the `JobData` class and update the rest of the code to use them.
- **DRY off**: The public methods of `JobData` are not very DRY. There's a lot of similar code in `getAllSkills` and `getAllEmployers` are very similar, as are `getJobsByEmployer` and `getJobsBySkill`. See if you can reduce these four methods to two. *Hint:* You'll likely have to change the method signatures of each, and thus the code that calls them in `TechJobs`.
- **Search all columns**: If you complete the previous item, you'll find it easy to add search and browse functionality for *all* columns, including location and name.

[submission-instructions]: ../
