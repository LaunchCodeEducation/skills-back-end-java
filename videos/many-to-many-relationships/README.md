---
title: "Many-to-Many Relationships"
currentMenu: videos
---

<div class="youtube-wrapper"><iframe width="776" height="437" src="https://www.youtube.com/embed/inhuiXTYUpI" frameborder="0" allowfullscreen></iframe></div>

## Notes

In this video, we look at many-to-many relationships in databases. With one-to-many relationships, we were able to construct these in the database using a foreign key column in the "owned" table. But the key to successfully constructing *many-to-many relationships* is to use a **join table**. A join table will have a column for each of the tables you want to relate, and each column will be a foreign key column into its respective table. Note that we do not make an `id` primary key column for join tables. Instead they have a composite key, which means that *the pairing* of the values in each column should be unique.
