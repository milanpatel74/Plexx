//
//  HumanViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "JobScreenViewController.h"


@interface HumanViewController : PFQueryTableViewController

@property (nonatomic, retain) PFObject *className;

@property (nonatomic) NSString *selection;
@property (nonatomic) NSMutableString *currentCategory;
@property (nonatomic) NSMutableArray *objectTable;

@property (strong, nonatomic) IBOutlet UITableView *jobsTable;
@property (nonatomic) UIImage *image;
@property (nonatomic) BOOL picturesFormatted;
@property (nonatomic) BOOL beenHere;
@property (nonatomic) int counter;
@property (nonatomic) NSString * categoryFilter;


@property (nonatomic) JobScreenViewController *parentViewController;

@end