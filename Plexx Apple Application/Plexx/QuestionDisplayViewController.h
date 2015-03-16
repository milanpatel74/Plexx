//
//  QuestionDisplayViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/2/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionDisplayViewController : UITableViewController
@property (nonatomic) NSArray *questionsArray;
@property (nonatomic) NSArray *answersArray;

+ (NSMutableArray *) cellArray;

@end
