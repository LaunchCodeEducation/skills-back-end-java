---
title: Staff notes
---

Hey folks! This curriculum is still under development. While it is evolving, I will post regular notes here as I update things. Check back here regularly, and please provide me feedback via Slack to I can fix errors, clarify confusing language, and generally improve to make sure it's the best possible for our students.

Thanks,

Chris (@chris)

### 2/1/17

Initial release of (most of) the first 3 weeks of material (classes 1-6). Some items here will continue to evolve a bit.

#### Notes

- When going through the initial repo setup, I suggest setting up a new remote to point to our upstream repo (i.e. the original `java-exercises` repo):
    ```nohighlight
    git remote add upstream LAUNCHCODE_REPO_URL
    ```
    This way, if we make some changes during development you'll be easily able to [merge them in](https://help.github.com/articles/syncing-a-fork/)
- We've re-written large portions of *Java For Python Programmers* from the original open-source version, but will likely continue to evolve portions of this. In particular, the content on abstract classes and interfaces can be improved.
- The Glossary is still a work-in-progress
- Content marked **Bonus Mission** is optional, and generally of a more advanced nature than what is contained in the rest of a given lesson/assignment/studio. This content is a new addition, and should be good for keeping more advanced students engaged. **If you have suggestinos for more bonus missions, let us know!**
- Spring Boot videos use Eclipse and Maven. These are going to be redone shortly using IntelliJ and Gradle.

To be added to classes 1-6:
- Studios for each classes 2-6
- Video introducing the overall goals and structure of the unit
- Video demonstrating more features and usage of IntelliJ than in the Udacity lesson from Class 1 Prep. **Quick tip for those new to IntelliJ:** You can right-click on any `main` method in a source file and select "Run ClassName.main()" to run any `main` method without creating a new run config.
- Add unit tests to first two assignments, along with a brief unit test lesson in class 5
- More examples in the `demos` package of `java-exercises`
