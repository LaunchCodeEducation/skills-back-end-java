# Assignment: Blogz

If you haven't completed the four Blogz studios, you may find much of this assignment difficult or confusing. You can go back to the [Studios page][studios] to wrap them up.

You'll also need to have completed all of the [prep work for Class 13][class13-prep].

Your assignment is to finish implementing all functionality in the Blogz application.

## Getting Ready

Visit the [blogz-spring](https://github.com/LaunchCodeEducation/blogz-spring) repository page. Fork the repository, and then clone your fork to your laptop. You may do this either within Eclipse (**File > Import > Projects from Git**) or by using the command line to clone, and then via Eclipse doing **File > Import > Projects From Folder or Archive**.

Then, watch the [starter code walkthrough video][walkthrough].

## Tasks

There are several `TODO` comments within the code, to indicate what you need to be doing. Here they are, by class or template:

`AuthenticationController`
- Implement `signup`
- Implement `login`

`PostController`
- Implement `newPost`
- Implement `singlePost`
- Implement `userPosts`

`BlogController`
- Implement `index`
- Implement `blogIndex`

`UserDao` and `PostDao`
- Specify additional query methods, as needed. Recall that you do not need to implement these methdods, or create a class implementing the interface. However, your methods do need to follow the basic naming scheme of `findByProperty` (where `property` is a realy property name in the given class, such as `Uid`) or `findAll`.

`index.html`
- List all users, with links to their templates

`post.html`
- Display a single post, with author and creation time. Formatting the creation time is tricky, so we give that to you here: `${#dates.format(post.created, 'yyyy-MM-dd')}`

*Note:* You do not need to implement paging, as we did in the Python version of this assignment

### Some Tips
- When creating a new model object, be sure to use the appropriate DAO to save it.
- **Read all of the starter code**. There are lots of helpful methods that you may want to use, but we don't spell them all out here.
- If you have any questions about how something should work, look at your Python version of this app for guidance.

## Turning It In

Commit and push your code to your fork. Then submit your code via Vocareum and demo it for your Tf.

[cheat-sheet]: https://github.com/LaunchCodeEducation/thymeleaf-cheat-sheet
[studios]: ../../studios
[class13-prep]: ../../../schedule/class13-prep
[app-props]: https://gist.github.com/chrisbay/b95fe8bbe93986383728f0405101eaf1
[walkthrough]: https://www.youtube.com/watch?v=R4jMKkuqNNM
