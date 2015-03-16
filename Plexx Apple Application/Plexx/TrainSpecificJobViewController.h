//
//  TrainSpecificJobViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/30/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "SpecificJobViewController.h"
#import "JobSpecificSkillTableViewController.h"

@interface TrainSpecificJobViewController : PFQueryTableViewController
@property (nonatomic) JobSpecificSkillTableViewController *parentViewController;
@property (nonatomic, retain) PFObject *className;

@property (nonatomic) NSString *selection;
@property (nonatomic) NSMutableArray *objectTable;

@end
