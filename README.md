# Option Selector

#### Summary 
Create a simple app with a few different categories (dogs, cars, food, planets, etc). When you tap on a category name it should take you into another `UITableViewController` with a list of possible options. Tapping on an option will show a checkmark at the right of the cell, and remove any other checkmarks on any other cells. When you navigate back to the initial `UITableViewController` you should see the option that you chose next in the corresponding cell. That is all.

You may pick any categories that you want.

![image](https://github.com/accesscode-2-2/unit-1/blob/master/lessons/week-4/images/options.gif?raw=true)

### Organization

This is a suggestion for how to organize your data.

1. Each category is represented by a class, let's call it `CQCategory`. This class has 3 properties: name (NSString*), options (NSArray*), selection (NSString*)
2. In your root `UITableViewController`, add a `property` that is an `NSArray` that can hold all of your `CQCategory` objects.
3. In `prepareForSegue`, pass the corresponding `CQCategory` object to the destination `UITableViewController`

### Process
1. Start simple. In your storyboard, drag out a `UINavigationController` with `UITableViewController` as the root view controller. Add an additional `UITableViewController`. Create a segue when the user taps on a cell in the first `UITableViewController`.
2. Set up your data. 
3. Populate your first `UITableViewController` based on the data that you set up.
4. Make sure that navigating between `UITableViewController`s is working. You'll need to pass relevant information to the second `UITableViewController` in `prepareForSegue:`
5. Set up the selection interaction in the second `UITableViewController`. You'll need to implement on of the `UITableViewDelegate` methods. The checkmark is `cell.accessoryType`, so it's built in.
6. When selection is made on a cell, update the corresponding objects `selection` property.
7. Make sure that the cells in the first `UITableViewController` are displaying the `selection` property.

:) :) :) 
