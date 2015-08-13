//
//  DetailTableViewController.h
//  OptionSelector
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>

//forward declarations. Is better than #import class here. I don't know why.
@class CQCategory;
@class MainTableViewController;

@interface DetailTableViewController : UITableViewController

@property (nonatomic) CQCategory *category;
@property (nonatomic,weak) MainTableViewController *delegate; 

@end
