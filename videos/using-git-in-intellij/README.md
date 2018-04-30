---
title: "Using Git in IntelliJ"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/uUzRMOCBorg" frameborder="0" allowfullscreen></iframe></div>

## Notes

### How to Create a Project from Scratch and Connect it to GitHub

#### Create New Project

- Open IntelliJ and select "Create New Project"
- Select Java and accept the default of SDK 1.8 (no additional libraries needed)
- Check the box "Create project from template" which will then select "Command Line App" and click "Next"
- Give the project a name and click "Finish"
- Once inside your project, select "VCS" from the menu and select "Enable Version Control Integration"
- Choose "Git" from the dropdown and press "Ok"
- Look at the *Version Control* pane to see what files are in the project (if it is not showing automatically, select *View->Tool Windows->Version Control*)

#### Create `.gitignore`

- Create a `.gitignore` file by going to *File->New->.ignore file->.gitignore file (Git)*

<aside class="aside-note" markdown="1">
If you don't see *.ignore file* in the *New* menu, follow these steps to install the needed plugin.

For Mac:

1. Open IntelliJ preferences and select *Plugins* from the left-hand menu.
2. Enter “.ignore” into the search field and then click the link for *Search in Repositories*.
3. Install the plugin and restart IntelliJ when prompted.

For Windows:

1. Go to *File->Settings->Plugins->Browse repositories...* and then search for ".ignore".
2. Click the green "Install" button.
3. After installation, close IntelliJ and then re-open it.

</aside>

- Select a *Java* .gitignore template and click "Generate", then click "Yes" to *Add file to Git*
- Add files ending with the following to the `.gitignore` file: `.iml` and `.idea`

#### Make First Commit

- Make a commit by selecting desired files in the *Local Changes* pane, right clicking, and selecting *Commit Changes*
- Enter a brief but descriptive commit message, uncheck the box next to "Perform code analysis", then click "Commit"

#### Connect to a Remote

- Go to GitHub and create a new repository with the same name as your repository in IntelliJ
- Copy the url for the GitHub repo
- In IntelliJ, go to *VCS->Git->Remotes*
- Click the `+` button and under "Origin" paste the address of the remote

#### Push to your Remote

- Go to *VCS->Git->Push...* and click "Push"

<aside class="aside-note" markdown="1">
From now on when you choose to make a commit, you can select either to just commit locally or to also push to the remote by clicking the option "Commit and Push" from the dropdown on the "Commit" button.

</aside>

### How to Connect Your Project to LaunchCode's Repository

- Open up your `java-exercises` repository in IntelliJ
- Go to [LaunchCode's java-exercises](https://github.com/LaunchCodeEducation/java-exercises)
- Copy the Clone url
- In IntelliJ, go to *VCS->Git->Remotes*
- Click the `+` button and next to "Name" type "upstream" and underneath it paste the url you copied
- Select *VCS->Git->Fetch*
- In the lower right hand corner, open the Git context menu and select *upstream/master* and *Merge*

<aside class="aside-note" markdown="1">
We recommend you regularly perform the last two steps of fetching and merging so that you get the most recent updates to the repository.

</aside>
