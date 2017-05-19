---
title: Initial Setup
currentMenu: classes
---

The steps here will walk you through setting up a repository that you'll use to study example code, work on studios, and complete your first assignment of this unit.

- Create a copy of the `LaunchCodeEducation / java-exercises` repo on GitHub by visiting the [repository page](https://github.com/LaunchCodeEducation/java-exercises) and clicking on the *Fork* button below your profile picture at the top right.
- Open IntelliJ.
    - If the app opens up to an existing project, select *IntelliJ > Preferences > Appearance & Behavior > System Settings* and uncheck *Reopen last project on startup*. (For Windows users: *File > Settings > Appearance & Behavior > System Settings*.) Close and Reopen IntelliJ.
- From the "Welcome to IntelliJ" dialog, select *Check out from Version Control > GitHub*
- The first time you use GitHub within IntelliJ you'll have to configure IntelliJ to use your GitHub Account. We recommend taking the extra step of authenticating using a token. This takes only one brief extra step, and will prevent you from having to update IntelliJ settings if you ever change your GitHub password.
- From the project selection dialog, select the `java-exercises` repository, along with an appropriate source destination directory (i.e. a folder where you've stored other projects for this class).
- When asked "Would you like to create and IDEA project..." select *Yes*, and then accept all of the default options that are presented.

With that, you're ready to go!

Here's a video walking through the last 4 steps above:

<div class="youtube-wrapper"><iframe width="560" height="315" src="https://www.youtube.com/embed/OPCaYVXRm_c" frameborder="0" allowfullscreen></iframe></div>

## Troubleshooting

### ClassNotFoundException

If you experience `java.lang.ClassNotFoundException` when trying to run code after setting up the project, follow these steps:
1. Select *File > Close Project*
2. From the IntelliJ modal window, click the *X* next to `java-exercises` in the left-hand pane.
3. From the same modal window, select *Import Project* from the right-hand pane.
4. Follow the steps that IntelliJ guides you through, accepting all defaults. When prompted to overwrite IntelliJ settings files, you confirm that you want to do so.
