//
//  DetailTableViewController.h
//  OptionSelector
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Mike Kavouras. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CQCategory.h"

@interface DetailTableViewController : UITableViewController

@property (nonatomic) CQCategory *category; 
@property (nonatomic) NSString *selection;

@end
