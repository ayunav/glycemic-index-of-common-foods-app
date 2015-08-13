//
//  DetailTableViewController.m
//  OptionSelector
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import "DetailTableViewController.h"
#import "CQCategory.h"
#import "MainTableViewController.h"

@interface DetailTableViewController ()

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

//do we need this?
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%@", self.category);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.category.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCellIdentifier" forIndexPath:indexPath];
    
    cell.textLabel.text = [self.category.options objectAtIndex:indexPath.row];
    
    //setting checkmark methods
    cell.accessoryType = UITableViewCellAccessoryNone;
    if ([cell.textLabel.text isEqualToString:self.category.selection]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    
    return cell;
}

//stores data about the string/cell row that was tapped/selected in the Detail table vc, hence the NSString *selection that belongs to CQCategory class 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    self.category.selection = [self.category.options objectAtIndex:indexPath.row];
    
    //because Main table vc is the delegate of the Detail vc, it call call the method on Main table vc to reload its data from inside this (didSelectRowAtIndexPath) method
    [self.delegate.tableView reloadData];
    
    [self.tableView reloadData];
}

@end
