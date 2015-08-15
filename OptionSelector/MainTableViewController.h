//
//  MainTableViewController.h
//  Glycemic Index of Common Foods OptionSelector App
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainTableViewController : UITableViewController

@property (nonatomic) NSArray *categories;
-(void)initializeCategories;

@end
