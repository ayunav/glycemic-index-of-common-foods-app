//
//  MainTableViewController.m
//  OptionSelector
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "MainTableViewController.h"
#import "CQCategory.h"
#import "DetailTableViewController.h"

@interface MainTableViewController ()

@end

@implementation MainTableViewController

-(void)initializeCategories {
    CQCategory *category1 = [[CQCategory alloc]init];
    category1.name = @"Low GI";
    category1.options = @[@"apple", @"avocado", @"chicken"];
    
    CQCategory *category2 = [[CQCategory alloc]init];
    category2.name = @"Moderate GI";
    category2.options = @[@"grapes", @"banana", @"quinoa"];
    
    CQCategory *category3 = [[CQCategory alloc]init];
    category3.name = @"High GI";
    category3.options = @[@"candy", @"chips", @"white rice"];
    self.categories = [NSArray arrayWithObjects:category1, category2, category3, nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.navigationItem.title = @"Glycemic Index of Common Foods";
    [self initializeCategories];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"number of categories: %lu", (unsigned long)self.categories.count);
    return self.categories.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CategoryCellIdentifier" forIndexPath:indexPath];
    NSLog(@"check2");
    CQCategory *categoryToDisplay = [self.categories objectAtIndex:indexPath.row];
    cell.textLabel.text = categoryToDisplay.name;
    
    return cell;
}

//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    // 1 figure out how to access the data you want for the detailTableViewController using indexpath
//    // 2 pass that data into sender
//    [self performSegueWithIdentifier: @"mainToDetail" sender:@"hello!"];
//    
//}
//

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    DetailTableViewController *controller = segue.destinationViewController;

    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    //pass the object with its name and an array to the next view controller
    CQCategory *category = [self.categories objectAtIndex:indexPath.row];
    controller.category = category; //the next vc has an object class 

    
    
//    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//    NSArray *keysForTypes = [self.pokemonTypes allKeys];
//    NSString *keyAtARowInASection = keysForTypes[indexPath.section];
//    NSString *littlePoke = [self.pokemonTypes[keyAtARowInASection] objectAtIndex:indexPath.row];
//    
//    PKPokemonDetailViewController *vc = segue.destinationViewController;
//    vc.pokemonName = littlePoke;
//    NSString *imageName = [littlePoke lowercaseString];
//    vc.pokemonImageName = imageName;
    
}


@end
