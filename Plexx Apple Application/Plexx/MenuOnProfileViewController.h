//
//  MenuOnProfileViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/31/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ProfileViewController.h"

@interface MenuOnProfileViewController : UITableViewController
- (IBAction)profileButton:(id)sender;
- (IBAction)jobsButton:(id)sender;
- (IBAction)skillsButton:(id)sender;
- (IBAction)aboutPlexxButton:(id)sender;
- (IBAction)privacyPolicyButton:(id)sender;
- (IBAction)reportBugButton:(id)sender;

@property (nonatomic) ProfileViewController *parentViewController;
@end
