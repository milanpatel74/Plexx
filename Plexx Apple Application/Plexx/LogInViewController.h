//
//  LogInViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MessageUI/MFMailComposeViewController.h>
#import <FacebookSDK/FacebookSDK.h>


@interface LogInViewController : UIViewController
- (IBAction)forgotPasswordButton:(id)sender;
- (IBAction)logInButton:(id)sender;
- (IBAction)sendEmailButton:(id)sender;
- (IBAction)nevermindButton:(id)sender;
- (IBAction)signUpButton:(id)sender;
- (IBAction)facebookSignInButton:(id)sender;
@property (strong, nonatomic) IBOutlet UILabel *plexxTitle;

@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UIView *clearForLoading;

@property (strong, nonatomic) IBOutlet UIView *backgroundLinesView;
@property (strong, nonatomic) IBOutlet UIView *coverView;

@property (strong, nonatomic) IBOutlet UIButton *forgotPasswordButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *logInButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *sendEmailButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *nevermindButtonAttributes;

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

@property (strong, nonatomic) IBOutlet UIView *parentView;
@property (strong, nonatomic) IBOutlet UIView *inputViewContainer;
@property (strong, nonatomic) IBOutlet UIView *buttonSetAContainer;
@property (strong, nonatomic) IBOutlet UIView *buttonSetBContainer;
@end
