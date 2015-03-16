//
//  OccupationTestTableViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

#import "ViewController.h"

//@class OccupationTestTableViewController;

//@protocol OccupationTestTableViewControllerDelegate <NSObject>
//- (void)addItemViewController:(OccupationTestTableViewController *)controller didFinishEnteringItem:(NSString *)item;
//@end

@interface OccupationTestTableViewController : PFQueryTableViewController

@property (nonatomic, retain) PFObject *className;

@property (nonatomic) ViewController *masterController;

//@property (nonatomic, weak) id <OccupationTestTableViewControllerDelegate> delegate;

@end
