//
//  SkillTableViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "SkillViewController.h"

@interface SkillTableViewController : PFQueryTableViewController

@property (nonatomic, retain) PFObject *className;

@property (nonatomic) SkillViewController *parentViewController;
@property (nonatomic) NSString *selection;
@property (nonatomic) NSMutableArray *objectTable;

@end
