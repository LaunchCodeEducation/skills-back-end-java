---
title: 'Studio: Restaurant Menu'
currentMenu: studios
---

Let's practice designing classes using the following scenario. You've been hired to create a web application for a local restaurant. They want to not only be able to display their current menu, but also edit it through an admin panel.

## Design

You know you'll need to create classes within the web application to facilitate this behavior and represent the various components of the menu. After talking to the owner, you have these details:

- The menu consists of several menu items
- Each menu item has a price, description, and category (appetizer, main course, or dessert)
- It should be possible to display whether a menu item is new or not
- The app should know when the menu was last updated, so visitors can see that the restaurant is constantly changing and adding exciting new items

Starting with pen and paper (or your favorite notes application on your laptop), begin to sketch out the design for two classes, `Menu` and `MenuItem`. List the fields that each should have, along with the data type and access level of each. Also consider whether any field should be static or final.

Once you have sketched out your fields, find a classmate to describe your design to. Class design can be subjective, so it's important to properly think through your choices before coding.

While a classmate is presenting their design to you, ask questions about why they made the decisions that they did, and think about use cases that that might come up, to see if their design fits with those.

## Implementation

Within the `java-exercises` solution, create a new package named `restaurant`. Add classes `Menu` and `MenuItem` and code the design that you created above. Be sure to add getters and setters as appropriate.

Create another class `Restaurant` with only a `main` method, and test your code by creating a `Menu` and several `MenuItem` objects to add to the menu. Write code to print out the menu to the console, displaying data for each menu item.
