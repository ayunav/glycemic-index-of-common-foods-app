//
//  MainTableViewController.m
//  Glycemic Index of Common Foods OptionSelector App
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import "MainTableViewController.h"
#import "CQCategory.h"
#import "DetailTableViewController.h"

@interface MainTableViewController ()

@end

//  Glycemic Index of Common Foods OptionSelector App
@implementation MainTableViewController

-(void)initializeCategories {
    CQCategory *category1 = [[CQCategory alloc]init];
    category1.name = @"Low GI Foods";
    
    NSArray *meats = @[@"Pork", @"Beef", @"Veal", @"Lamb", @"Mutton", @"Goat", @"Chicken", @"Turkey", @"Duck", @"Goose", @"Rabbit", @"Wild Boar"];
    
    category1.options = @[
                          @{@"All Meats" : meats}, //NSDictionary for the NSArray above
                          @"Eggs",
                          @"Peanut Butter",
                          @"Nuts",
                          @"Yogurt",
                          @"Oranges",
                          @"Tomato Juice",
                          @"Couscous",
                          @"Hummus",
                          @"Lentils",
                          @"Barley",
                          @"Popcorn",
                          @"Avocado",
                          @"Grapefruit"];
    
    CQCategory *category2 = [[CQCategory alloc]init];
    category2.name = @"Moderate GI Foods";
    category2.options = @[@"Low Fat Yogurt", @"Pizza", @"Bananas", @"Old Fashioned Oatmeal", @"Corn Tortillas", @"Grapes", @"Quinoa", @"Milk", @"Brown Rice", @"Sweet Potato", @"Whole Grain/Wheat Bread", @"Soy/Almond/Rice Milk"];
    
    CQCategory *category3 = [[CQCategory alloc]init];
    category3.name = @"High GI Foods";
    category3.options = @[@"Potato Chips", @"Candy Bars", @"White Rice", @"White Bread", @"Bagel", @"Cake", @"Muffin", @"Soda", @"Instant Oatmeal", @"Mac & Cheese", @"Baked/Mashed Potatoes", @"Pancakes/Waffles", @"Raisins/Dates", @"Most Juices", @"Sweetened Cereals"];
    
    self.categories = @[category1, category2, category3];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Glycemic Index of Common Foods";
    [self initializeCategories];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.categories.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCellIdentifier" forIndexPath:indexPath];

    CQCategory *categoryToDisplay = [self.categories objectAtIndex:indexPath.row];
    cell.textLabel.text = categoryToDisplay.name;
    
    //Without the below method, the NSString *selection displays in the detail text label in the main table vc with delay. Setting up else method to an empty string solves the delayed display issue
    if (categoryToDisplay.selection != nil) {
        cell.detailTextLabel.text = categoryToDisplay.selection;
    } else {
        cell.detailTextLabel.text = @" ";
    }

    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    DetailTableViewController *controller = segue.destinationViewController;
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    
    //pass the CQCategory object with all its properties to the next view controller
    CQCategory *category = [self.categories objectAtIndex:indexPath.row];
    controller.category = category; //the next vc has an object class 
    
    //delegate declaration has to happen in the prepare for segue method for main table vc. Main table vc is the delegate of the Detail vc. 
    controller.delegate = self;
}

@end
