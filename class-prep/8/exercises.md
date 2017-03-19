---
title: Class 8 Prep Exercises
currentMenu: classes
---

Add edit functionality to the `cheese-mvc` application by following these steps. It assumes that you've added all of the code from both of the [models lessons](../../videos/).

1. Add two handler methods to `CheeseController`:
    - `public String displayEditForm(Model model, int id)` - this will be used to display the form
    - `public String processEditForm(Model model, int id, String name, String description)` - this will be used to process the form
1. Add the necessary annotations to these forms for them to both live at the path `/cheese/edit` (not that we've configured `@RequestMapping` on the controller class already), and so that the first handles `GET` requests, and the second `POST` requests.
1. Create an `edit.html` view template in `resources/templates/cheese`.
1. Copy the code from `add.html` into `edit.html`. You can copy the entire file contents.
1. Back in `displayEditForm` handler, ask `CheeseData` for the object with the given `id` and put it in the `model`. Return the appropriate template string.
1. Within the form fields in `edit.html`, get the name and description from the cheese that was passed in via the `model` and set them as the values of the form fields.
1. Add another input to hold the id of the cheese being edited. This should be hidden from the user:
    ```html
    <input type="hidden" value="${cheese.cheeseId}" name="cheeseId" />
    ```
1. Add a heading at the top of `edit.html` that says "Edit Cheese NAME (id=ID)" where NAME and ID are replaced by the values of the given cheese.
1. Back in `processEditForm`, query `CheeseData` for the cheese with the given id, and then update its name and description. Redirect the user to the home page.
1. In `resources/templates/cheese/index.html`, add a link to edit the cheese:
    ```html
    <a th:href="${'/cheese/edit/' + cheese.cheeseId}">edit</a>
    ```
    You can put this link in a third table column, or in one of the existing table cells.
1. Test your code! With so many changes, it's likely that you made an error somewhere. Be patient, use IntelliJ's debugger, and read your error messages.
