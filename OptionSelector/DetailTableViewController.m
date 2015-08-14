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
    self.navigationItem.title = @"🍅🍉Check to Track🍕🍔";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.category == nil) {
        return self.options.count;
    }
    return self.category.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCellIdentifier" forIndexPath:indexPath];
    
    // object will either be an NSString or NSDictionary
    id object;
    if (self.category == nil) {
        object = [self.options objectAtIndex:indexPath.row];
    } else {
        object = [self.category.options objectAtIndex:indexPath.row];
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        // treat it like a dictionary
        NSDictionary *dictionary = object;
        NSString *key = [[dictionary allKeys] firstObject];
        cell.textLabel.text = key;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    } else {
        // treat it like a string
        cell.textLabel.text = (NSString *)object;
        cell.accessoryType = UITableViewCellAccessoryNone;
        if ([cell.textLabel.text isEqualToString:self.category.selection]) {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    
    return cell;
}

//stores data about the string/cell row that was tapped/selected in the Detail table vc, hence the NSString *selection that belongs to CQCategory class 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // object will either be NSString or NSDictionary
    id object;
    if (self.category == nil) {
        object = [self.options objectAtIndex:indexPath.row];
    } else {
        object = [self.category.options objectAtIndex:indexPath.row];
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        // treat it like a dictionary
        NSDictionary *dictionary = [self.category.options objectAtIndex:indexPath.row];
        NSString *key = [[dictionary allKeys] firstObject];
        NSArray *options = [dictionary objectForKey:key];
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        
        // create a new instance of UIViewController from our storyboard
        DetailTableViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DetailController"];
        
        controller.options = options;
        
        // set any properties on viewController
        // tell the UINavigationController to push the new view controller on to the stack
        [self.navigationController pushViewController:controller animated:YES];

        NSString *option = [options objectAtIndex:indexPath.row];
        self.category.selection = option;
        [self.delegate.tableView reloadData];
        [self.tableView reloadData];


        
    } else {
        // treat it like a string
        self.category.selection = [self.category.options objectAtIndex:indexPath.row];
        //because Main table vc is the delegate of the Detail vc, it call call the method on Main table vc to reload its data from inside this (didSelectRowAtIndexPath) method
        [self.delegate.tableView reloadData];
        [self.tableView reloadData];
    }
}

@end
