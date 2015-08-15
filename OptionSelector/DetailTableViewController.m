//
//  DetailTableViewController.m
//  Glycemic Index of Common Foods OptionSelector App
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
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
    //the method belows deals with having a NSArray *options that is a property of class CQCategory and is an array that contains a NSDictionary and NSStrings
    if (self.options != nil) {
        return self.options.count;
    }
    return self.category.options.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemCellIdentifier" forIndexPath:indexPath];
    
    // object will either be an NSString or a NSDictionary
    id object;
    if (self.options != nil) {
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
    if (self.options != nil) {
        object = [self.options objectAtIndex:indexPath.row];
    } else {
        object = [self.category.options objectAtIndex:indexPath.row];
    }
    
    if ([object isKindOfClass:[NSDictionary class]]) {
        // treat it like a dictionary
        NSDictionary *dictionary = [self.category.options objectAtIndex:indexPath.row];
        NSString *key = [[dictionary allKeys] firstObject];
        NSArray *options = [dictionary objectForKey:key];
        
        //methods to push new stack when string All Meats is tapped in the Detail table vc
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        // create a new instance of UIViewController from our storyboard
        DetailTableViewController *controller = [storyboard instantiateViewControllerWithIdentifier:@"DetailController"];
        // set any properties on viewController
        controller.options = options;
        controller.category = self.category;
        // tell the UINavigationController to push the new view controller on to the stack
        [self.navigationController pushViewController:controller animated:YES];
        
        [self.delegate.tableView reloadData];
        [self.tableView reloadData];
    } else {
        // treat it like a string
        if (self.options != nil ){
            self.category.selection = [self.options objectAtIndex:indexPath.row];
        } else {
            self.category.selection = [self.category.options objectAtIndex:indexPath.row];
        }
        //because Main table vc is the delegate of the Detail vc, it can call the method on the Main table vc to reload its data from inside this (didSelectRowAtIndexPath) method
        [self.delegate.tableView reloadData];
        [self.tableView reloadData];
    }
}

@end
