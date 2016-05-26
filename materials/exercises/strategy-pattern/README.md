##### Java Track

[Back to Class 5 prep](../../class5-prep)


# Exercise: Strategy Pattern

Now that you know about inheritance and interfaces, you are ready to enter the world of [Design Patterns](https://sourcemaking.com/design_patterns). Design patterns are repeatable solutions to commonly occuring situations. The pattern we are going to look at today is called the [Strategy Pattern](https://sourcemaking.com/design_patterns/strategy)

The Strategy pattern is useful when you have multiple ways of implementing the same behavior. In this exercise, we are going to implement behavior for our robots.

In previous exercises you made [different types of robots](../robot-diversification). Now that you have types of robots, consider a goal for your robots to achieve. Here are some ideas:

* If you made a robot that can push or lift something, your goal might be pushing or moving something to a certain position
* If you made an attack robot, your goal might be destroying another robot.

Regardless of the goal you chose, there will likely be multiple ways of achieving the goal. For example, if you are designing an attack robot, you might want to only have your robot attack if the other robot gets too close. Or maybe you want your robots to be more aggressive and chase other robots around. Or perhaps you'd rather build a defensive robot that only attacks if it is provoked by another robot. All of these are different *strategies* that could be implemented for an attack robot.

To create your strategies, do the following:

* Create an interface called `RobotBehavior`. The methods in this interface are ultimately up to you, but there should be at least one method in this interface called `doNextMove()`. Think about what the return type of this method should be!
* Create at least two classes that implement this interface. If I were developing attack robots, I might call one class `AggressiveBehavior` and another class `DefensiveBehavior`
* Implement the methods in each of these classes with the desired behavior. If you do not have enough information to implement the desired behavior, you may wish to add some parameters to your `doNextMove()` method (such as a `Robot` instance) or create additional methods.
* In your `Robot` base class, create a `setBehavior(RobotBehavior)` method that accepts a behavior for your `Robot`.

You are now ready to try out your strategies! In a `main` method (or some other appropriate method). Do the following:

* Create a `Robot`
* Create one of your strategies and set it with `setBehavior()`
* Repeat this process for a second robot
* Create a loop that continuously calls `doNextMove()` for both robots and then prints out their information
* End the loop when one or both `Robots` achieves its goal

Congratulations, you have just completed your first design pattern! You have also completed your first [Artificial Intelligence](https://en.wikipedia.org/wiki/Artificial_intelligence) exercise! I hope your robots don't become sentient and [take over the world](https://www.youtube.com/watch?v=TQs3gVobcfg).