//
//  OccupationTestViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OccupationTestViewController : UIViewController// <OccupationTestTableViewControllerDelegate>
- (IBAction)skipButton:(id)sender;
- (IBAction)continueWithSelectionsButton:(id)sender;

@property (strong, nonatomic) IBOutlet UILabel *plexxTitleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dreamPromptText;

@end
