# Assignment: Javagram

## Synopsis

This assignment will exercise your knowlege of interfaces, I/O, exceptions, and static class members while exercising some algorithmic creativity to produce image filters. You'll be completing a program called Javagram, which allows a user to filter images and save them to a new file.

## Getting Ready

Before diving in to the code, get the latest version of the `java-oo-exercises` repository. In Eclipse, do the following:

1. Right-click on the top-level directory of the project (i.e. `java-track`) and select **Team > Remote > Fetch from...**
2. Select the `launchcode` remote repository and click **Finish**. This will fetch the most recent changes from the main repository
3. Right-click on the top-level directory of the project and select **Team > Merge**
4. Select `launchcode/master` from the **Remote Tracking*** section of the dialog to merge

### What is RGB?

To create some interesting filters, you need to understand how images are represented as data in files, and displayed on a screen. This involves pixels and the RGB color model.

[Watch][rgb-vid]: An Instgram co-founder and a professional photographer explain digital representation of colors and filtering

[Read][rgb-wiki]: For more in-depth info and history on RGB, you may find this article useful

### Javagram Walkthrough

[Watch][javagram-walkthrough]: Chris walks through the starter code for Javagram

## Your Tasks

Once you have all of the proper background info, you're ready to get started.

### Create filters using interfaces

Currently, Javagram uses only one filter, which effectively removes all of the red and green, making the image blue. The code within the main method of the `Javagram` class can only handle single type of filter, `BlueFilter`. Let's fix that.

#### TODO 1

Create an interface named `Filter`, so that `BlueFilter` implements `Filter`. Refactor the code in `Javagram` to use a reference of type `Filter` rather than a `BlueFilter` reference. To do this, you'll need to modify code with `main` as well as the definition of the method `getFilter`. Your interface should live in the `javagram.filters` package.

#### TODO 2

We need a way for the user to select a filter. We want to present the user with a list of filters and let them select a filter by its menu number. This should behave similarly to the computer menu you saw implemented in the lesson on I/O, presented in the [walkthrough video][io-walkthrough].

The main difference is that your menu does not need to be presented as a loop that continues to prompt the user again and again until they exit. You should simply present the user with a list of filters, accept that input in the form of an integer. Then, refactor `getFilter` so that it takes an integer and returns an instance of the appropriate filter object. You should implement validation in the following way:

- `getFilter` should throw an exception if it is passed an integer that doesn't correspond to a filter
- In `main`, use a `try`/`catch` block to handle this exception in a reasonable way
- If the user inputs an invalid integer, after it is caught, the user should be prompted to make another selection. You'll likely want to use a [do-while loop][do-while] for this.

To do this, we recommend creating a method specifically for displaying the menu and getting the result from the user. For example, the following method signature would work well:

```java
    private static int displayFilterMenu(Scanner in)
```

Your code can now handle multiple filters, but it still has only one: `BlueFilter`.

#### TODO 3

Create at least two more filters, adding each to your menu. Your filters should live in the `javagram.filters` package, and each should implement the `Filter` interface.

Below are some ideas, but you may also come up with your own. We use the notation `(redValue, greenValue, blueValue)` to denote a specific RGB value. So, `(128, 0, 0)` is a pure red of medium brightness, `(0, 0, 0)` is black, and `(255, 255, 255)` is white.

For comparison, here's an unfiltered image, with filtered versions below.

![unfiltered](mentorcenter.jpg)

- `InvertFilter` - this should "flip" colors so that black goes to white, and vice versa. To do this, you should invert each of the red, green, and blue values individually. Make sure you don't have any values less than 0 or greater than 255.

![inverted](mentorcenter-inverted.jpg)

- `BrightnessFilter` - Increase the brightness of the image. Since `(255, 255, 255)` is white, you'll need to add some fixed value to each of the red, green, and blue values for a given pixel. You can either increase the brightness by a fixed amount, or incorporate the amount of brightness (an `int`) into the constructor. Read more on image brightness [here][brightness-tutorial].

![bright](mentorcenter-bright.jpg)

- `BlurFilter` - Blur the image using the technique from the [Chapter 7 studio][unit1-ch7-studio] in Unit 1.

![blurred](mentorcenter-blur.jpg)

- `MonochromeFilter` - Similar to `BlueFilter`, but `MonochromeFilter` could take as input to its constructor a specific color (either as a `Color` object, or RGB integer values), and create an image that contains only shades of that color. So, for example, if you passed in the color `(0,0,128)`, you'd get essentially the same result as `BlueFilter`. When using this in your program, you will need to either hardcode the color used, or add functionality to prompt the user for the color they want to use.

![monochrome](mentorcenter-mono.jpg)

- `GrayscaleFilter` - Make the image entirely grayscale. In other words, there should should be no color within the image. To do this, note that shades of gray in RGB are colors where each of the red, green, and blue values are the same. For example, `(25, 25, 25)` is a very dark gray, and `(200, 200, 200)` is a light gray.

![grayscale](mentorcenter-grayscale.jpg)

#### TODO 4

After the image is filtered, the user has the option to save the image in a file. However, it would be very easy for them to overwrite the original file by simply typing in the original file name. To prevent accidental overwriting of the original image, verify that the user does actually want to replace the original image in the case they type in the same file name. If they do not verify, the are reprompted to enter in a new file name.

### Hacker Additions

Here are a couple of additional features you might implement in your program, for an added challenge.

- Add some transformations, such as rotation or flip via the horizontal or vertical axis.
- Allow users to apply multiple filters at once.

### Sanity Check

Before submitting, make sure your code does each of the following.

- You have an interface named `Filter` and at least 3 filters (including `BlueFilter`) that implement the interface.
- When using the program, the user is presented with a list of filters to choose from, and they can indicate which filter should be used by entering an integer.
- If the user enters an invalid integer, they are given a reasonable error message and re-prompted.
- There are no references (i.e. local or instance variables) in the `main` method that have the type of a specific filter. All filter variables are of type `Filter`.
- If the user attempts to save the image in the same file as the original unfiltered image, they are asked to verify their choice before saving. If they do not verify, the are reprompted to enter in a new file name.

### How to Submit

There is no need to submit your code on Vocareum. Instead, demo your code with your TF.


[rgb-vid]: https://www.youtube.com/watch?v=15aqFQQVBWU
[rgb-wiki]: https://en.wikipedia.org/wiki/RGB_color_model
[io-walkthrough]: https://www.youtube.com/watch?v=XgVCx2VWKcA
[do-while]: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/while.html
[unit1-ch7-studio]: https://learn.launchcode.org/runestone/static/thinkcspy/Studios/Chapter7.html
[brightness-tutorial]: https://www.tutorialspoint.com/dip/brightness_and_contrast.htm
[javagram-walkthrough]: https://youtu.be/WwrkB_Tw8fY
