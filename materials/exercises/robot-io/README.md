##### Java Track

[Back to Class 2 prep](../../class2-prep)


# Exercise: Robot I/O

Your task for this exercise is to create a simple menu system that people can use to interact with robots.

Create a class called `RobotMenu`. A `RobotMenu` has-a:

* List of `Robot`s that have been created.
* Scanner object that can be used for accepting user input

A `RobotMenu` has the following behaviors:

* When the menu starts, it prints out a list of available options:

```nohighlight
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
```

* The menu can accept an input from the user indicating which option they would like to perform. If the user selects an invalid option, the menu should display a message and ask the user to try again.

* Once a user has selected a valid option, the menu will ask the user which robot(s) they wish to manipulate (if applicable) and perform the selected action.

Here is an example of what the menu system might look like when you run it:

```nohighlight
Welcome to the robot menu!
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
Please select an option: 
1
Please enter a name for the robot: 
bender
Please enter an x position for the robot: 
10
Please enter a y position for the robot: 
20
Please enter a speed for the robot: 
5
Please enter an orientation for the robot (north = 1, east = 2, south = 3, west = 4): 
1
Welcome to the robot menu!
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
Please select an option: 
1
Please enter a name for the robot: 
r2d2
Please enter an x position for the robot: 
2
Please enter a y position for the robot: 
5
Please enter a speed for the robot: 
1
Please enter an orientation for the robot (north = 1, east = 2, south = 3, west = 4): 
2
Welcome to the robot menu!
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
Please select an option: 
2
1.)Name: bender Position: (10, 20) Speed: 5 Orientation: east
2.)Name: r2d2 Position: (2, 5) Speed: 1 Orientation: south
Welcome to the robot menu!
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
Please select an option: 
3
1.)Name: bender Position: (10, 20) Speed: 5 Orientation: east
2.)Name: r2d2 Position: (2, 5) Speed: 1 Orientation: south
Please select a robot: 
1
Here is the robot's status after it moved:
Name: bender Position: (15, 20) Speed: 5 Orientation: east
Welcome to the robot menu!
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
Please select an option: 
5
1.)Name: bender Position: (15, 20) Speed: 5 Orientation: east
2.)Name: r2d2 Position: (2, 5) Speed: 1 Orientation: south
Please select a robot: 
1
Please select a robot: 
2
The distance between the robots you selected is: 30.23243291566195
Welcome to the robot menu!
1. Create a robot
2. Display the list of available robots
3. Move a robot
4. Rotate a robot
5. Compute the distance between two robots
6. Exit
Please select an option: 
6
```