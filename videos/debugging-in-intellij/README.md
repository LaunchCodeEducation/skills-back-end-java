---
title: "Debugging in IntelliJ"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/1bCgzjatcr4" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video we will cover these aspects of debugging in **IntelliJ**:

### Steps to Find and Diagnose Logical Bugs

- Set a *breakpoint* where you want to pause execution of the code (so you can look in detail at what the program is doing at this point).
- Run your program in *Debug* mode
- Inspect the values of your variables at the breakpoint in the *Debugger pane*
- If needed, use the *Add/Watch* button to watch a specific expression as your program executes
- You can also set a *conditional breakpoint* to pause execution of the code when a certain condition is met

### Control the flow of execution

- *Step-over* button executes a given line then steps to the next executable line
- *Step-into* button allows you to review a called method and see what is going on line by line within that method
- *Step-out-of* button allows you to move out of the method you stepped into and resume stepping through the main code

### Advantage of Debugger Over Printing to the Console

- The debugger let's you look at **all** the values in your program instead of just guessing which values you want to track via logging to the console.
