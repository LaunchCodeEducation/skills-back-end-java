# Hacker Assignment: Spring Stocks

A Java (Spring Boot) implementation of an app to simulate buying and selling stocks.

## Getting ready
We need to prep our environment before diving into the code.
* Install [MAMP](https://www.mamp.info), if you haven't already. We'll use MAMP as a convenient way to fire up and inspect our MySQL database (via either phpMyAdmin or Sequel Pro, which is bundled with MAMP). We won't use the Apache or PHP portions of the app for this project, but having them around isn't a bad thing.
* Fire up MAMP and open either phpMyAdmin or Sequel Pro (default user:pass is typically root:root or root:(blank)). Create a database called `stocks`, a user `stocks` with password `daytrader`, and grant `stocks` all privileges on your new database (for `localhost` only).
* Fork the [project repository][stocks-repo]
* Import the project to Eclipse in one of the following ways.
    * At the command line, clone the repo to your working directory. Then import it to Eclipse via **Import > Projects From Folder or Archive**
    * Fire up Eclipse, and create a new project via **File > Import > Projects From Git**. Follow the remaining dialogs.

## Getting started
In this project we combine our new knowledge of Spring Boot, Thymeleaf, and data persistence. That's a lot, but fear not. You'll get used to it all with a bit of guidance, by reading the code base, and referencing documentation online.

Once you have your new Eclipse project, you can start up your web app by right-clicking on the `StocksApplication` class in the `org.launchcode.stocks` package and selecting **Run As > Java Application**. If you see an exception stack trace in the console, something went wrong. The most common issue here is that your database isn't running. Make sure it's actually running. If that's not it, try to get some hints from the stack.

Once the app starts up cleanly, point your browser at http://localhost:8080 and you should see the Stocks login page.

Have a look around at the code. You'll see that it's all in the `org.launchcode.stocks` package (`src/main/java/org/launchcode/stocks/`), with sub-packages for `models` and `controllers`, and a couple more below that. Our templates are stored in `src/main/resources/templates/` with the Tymeleaf extension of `.html` since they're "natural templates" (that is, templates that can still be displayed in a browser without any additional rendering engine).

## What to do
1. First, register a user or two for testing via the register link on the login page. (Notice how we've already implemented that one for you!)
2. You have a few TODOs left in the comments (open **Window > Show View > Tasks** and sort by Path for a handy guide). The first is to implement quote lookup. You'll find the request handler for this action in `StockController.java`, and templates in `quote_form.html` and  `quote_display.html`. Take it from there, using the parameters already put in place for you in the template.
3. We failed to make the `symbol` field of `StockHolding.java` case-insensitive, which will cause unintended results when buying and selling. Fix this by updating the appropriate constructor for the `StockHolding` class to make the symbol either always be upper or lowercase (your choice). You'll also have to update the static `buyShares` and `sellShares` methods in the same class.
4. Implement buy and sell functionality. You'll find request handlers in `StockController.java`, relevant model methods in `StockHolding.java`, and a shared buy/sell template in `transaction_form.html` and `transaction_confirm.html`. Note that you're making changes that should be persisting data in the database, so be sure that's happening correctly before checking this one off your list. You'll have to deal with a `StockLookupException` in some cases. Your controller should `try/catch` the affected calls and respond appropriately (hint: see `AbstractFinanceController.displayError` and it's usage in other locations within the project).
5. Now that you can buy and sell, let's make sure our users can't buy indefinitely (we forgot to give them a cash limit). Add a `cash` field to the `User` model class, making sure to include the proper persistence annotations. Then, update the user's cash on buy/sell requests, and handle a request to buy that exceeds available funds appropriately. You should give Users a default amount of cash when they are created, and you'll need to add cash to any existing users by editing the database directly.
6. Display the user's stocks in a table. You'll find some code already in place in `PortfolioController.java` and the `portfolio.html` template. You should display the following fields for each stock in the template: display name (use `Stock.toString()`), number of shares owned, current price, and total value of shares owned. Format the currency values appropriately, with 2 decimal places. You may find the `th:each` Thymleaf tag useful here.

[stocks-repo]: https://github.com/LaunchCodeEducation/spring-stocks
