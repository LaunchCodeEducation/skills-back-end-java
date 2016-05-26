##### Java Track

[Back to Class 1 prep](../../class1-prep)


# Exercise: It's Alive!

Your task for this exercise is to design and implement a `Robot` class.

A `Robot` has-a:

* Name
* Position (this should be two dimensional, use x and y coordinates)
* Speed
* Orientation: which direction is the robot facing? To keep this simple, we we limit ourselves to four directions: north, south, east, and west.

To keep things simple, you should consider implementing the position and speed as integers. Consider what data type would be best for the direction - this one might be a little tricky!

A `Robot` has the following behaviors:

* It can move. Where it ends up depends on its current position, its orientation, and its speed.
* It can rotate. This changes the robot's orientation. Each rotation should be exactly 90 degrees to the left or the right.
* Our `Robot` can determine how far away it is from another `Robot` object.
* Our `Robot` can return a String that contains its name, position, speed, and orientation.

Use this information to design your `Robot` class. Once you are satisfied with your design, you should implement it and create a simple main method to test your robot's functionality.
