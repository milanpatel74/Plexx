//
//  ReportBugViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
@interface ReportBugViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *plexxTitleLabel;
@property (strong, nonatomic) IBOutlet UITextView *bugReportTextField;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGesture;

- (IBAction)nevermindButton:(id)sender;
- (IBAction)sendButton:(id)sender;


@end
