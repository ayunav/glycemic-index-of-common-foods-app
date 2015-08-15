//
//  DetailTableViewController.h
//  Glycemic Index of Common Foods OptionSelector App
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import <UIKit/UIKit.h>

//According to Cameron, it's better to use forward declarations instead of #import here. I don't know why. Note to myself: research forward declarations
@class CQCategory;
@class MainTableViewController;

@interface DetailTableViewController : UITableViewController

@property (nonatomic) CQCategory *category;
@property (nonatomic) NSArray *options;
@property (nonatomic,weak) MainTableViewController *delegate; 

@end
