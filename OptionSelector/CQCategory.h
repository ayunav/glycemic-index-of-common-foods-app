//
//  CQCategory.h
//  Glycemic Index of Common Foods OptionSelector App
//
//  Created by Ayuna Vogel on 8/10/15.
//  Copyright (c) 2015 Ayuna Vogel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CQCategory : NSObject
/**
 * This represents a category to be shown on the main screen. It stores the
 * category's name, a list of the possible values under that category, and the
 * currently selected item in the category. This data is initialized and used
 * in MainTableViewController.
 */
@property (nonatomic) NSString *name;
@property (nonatomic) NSArray *options;
@property (nonatomic) NSString *selection;

@end
