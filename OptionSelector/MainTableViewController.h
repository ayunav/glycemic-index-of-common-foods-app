//
//  MainTableViewController.h
//  OptionSelector
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController

@property (nonatomic) NSArray *categories;
-(void)initializeCategories;

@end
