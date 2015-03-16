//
//  JobSpecificSkillTableViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface JobSpecificSkillTableViewController : PFQueryTableViewController

@property (nonatomic, retain) PFObject *className;
@end
