//
//  LogInViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "LogInViewController.h"
#import "LogInTableViewController.h"

#import "SignUpViewController.h"
#import "OccupationTestViewController.h"
#import "JobScreenViewController.h"

#import "FacebookLoginViewController.h"

#import "ViewController.h"

@interface LogInViewController ()

@end

@implementation LogInViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize plexxTitle;

@synthesize emailTextField;
@synthesize passwordTextField;

@synthesize coverView;
@synthesize parentView;
@synthesize backgroundLinesView;
@synthesize inputViewContainer;

@synthesize buttonSetAContainer; // Has log in and forgot password buttons
@synthesize buttonSetBContainer; // Has send and nevermind buttons


@synthesize forgotPasswordButtonAttributes;
@synthesize logInButtonAttributes;
@synthesize sendEmailButtonAttributes;
@synthesize nevermindButtonAttributes;

@synthesize activityIndicator;
@synthesize clearForLoading;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [activityIndicator setAlpha:0];
    [self.view sendSubviewToBack:clearForLoading];
    
    UIFont *UbuntuBig = [UIFont fontWithName:@"Ubuntu-Medium" size:30.f];
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    UIFont *UbuntuMini = [UIFont fontWithName:@"Ubuntu-Medium" size:12];

    
    [plexxTitle setFont:UbuntuBig];
    
    // Configuring the email text box
    [emailTextField setDelegate:(id)self];
    [emailTextField setPlaceholder:@"Email"];
    [emailTextField setFont:UbuntuSmall];
    [emailTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    
    // Configuring the password box
    [passwordTextField setDelegate:(id)self];
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setFont:UbuntuSmall];
    [passwordTextField setKeyboardType:UIKeyboardTypeDefault];
    [passwordTextField setSecureTextEntry:YES];
    
    [[forgotPasswordButtonAttributes titleLabel] setFont:UbuntuMini];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                        action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [emailTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:(BOOL)animated];
    
    [activityIndicator setAlpha:0];
    [self.view sendSubviewToBack:clearForLoading];
    
    // before the view appears
    [emailTextField setText:@""];
    [passwordTextField setText:@""];
    
    
    // Configuring the password box
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setSecureTextEntry:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (IBAction)sendEmailButton:(id)sender{
    BOOL atSymbolPresent = [[passwordTextField text] rangeOfString:@"\u0040"].location == NSNotFound;
    BOOL dotSymbolPresent = [[passwordTextField text] rangeOfString:@"."].location == NSNotFound;
    if (!atSymbolPresent && !dotSymbolPresent) {
        NSLog(@"at exists");
        
        [PFUser requestPasswordResetForEmailInBackground:[passwordTextField text]];
        
        [[[UIAlertView alloc] initWithTitle:@"Password Reset"
                                    message:@"You will receive an email soon"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
        
        [passwordTextField setText:@""];
        [passwordTextField setPlaceholder:@"Password"];
        [passwordTextField setKeyboardType:UIKeyboardTypeDefault];
        [passwordTextField setSecureTextEntry:YES];
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            buttonSetBContainer.frame = CGRectMake(0, 239, 320, 88);
            [UIView commitAnimations];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelay:0.3];
            [UIView setAnimationDuration:0.3];
            buttonSetAContainer.frame = CGRectMake(0, 271, 320, 88);
            [UIView commitAnimations];
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            coverView.frame = CGRectMake(0, 172, 320, 55);
            [UIView commitAnimations];
        } else {
            // code for 3.5-inch screen
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            buttonSetBContainer.frame = CGRectMake(0, 151, 320, 88);
            [UIView commitAnimations];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelay:0.3];
            [UIView setAnimationDuration:0.3];
            buttonSetAContainer.frame = CGRectMake(0, 183, 320, 88);
            [UIView commitAnimations];
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            coverView.frame = CGRectMake(0, 84, 320, 55);
            [UIView commitAnimations];
        }

    } else {
        NSLog(@"at doesnt exist");
        
        [[[UIAlertView alloc] initWithTitle:@"Invalid Email"
                                    message:@"You have entered an invalid email."
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];

    }
}

- (IBAction)forgotPasswordButton:(id)sender {
    // Changing Screen to input an email to send new password to
    //    NSLog(@"1");    // Configuring the password box
    [passwordTextField setText:@""];
    [passwordTextField setPlaceholder:@"Email"];
    [passwordTextField setKeyboardType:UIKeyboardTypeEmailAddress];
    [passwordTextField setSecureTextEntry:NO];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        // code for 4-inch screen
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        buttonSetAContainer.frame = CGRectMake(0, 239, 320, 88);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        buttonSetBContainer.frame = CGRectMake(0, 271, 320, 88);
        [UIView commitAnimations];
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        coverView.frame = CGRectMake(0, 227, 320, 55);
        [UIView commitAnimations];
    } else {
        // code for 3.5-inch screen
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        buttonSetAContainer.frame = CGRectMake(0, 151, 320, 88);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        buttonSetBContainer.frame = CGRectMake(0, 183, 320, 88);
        [UIView commitAnimations];
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        coverView.frame = CGRectMake(0, 139, 320, 55);
        [UIView commitAnimations];
    }
}
    
- (IBAction)nevermindButton:(id)sender{
    [passwordTextField setText:@""];
    [passwordTextField setPlaceholder:@"Password"];
    [passwordTextField setKeyboardType:UIKeyboardTypeDefault];
    [passwordTextField setSecureTextEntry:YES];
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        // code for 4-inch screen
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        buttonSetBContainer.frame = CGRectMake(0, 239, 320, 88);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        buttonSetAContainer.frame = CGRectMake(0, 271, 320, 88);
        [UIView commitAnimations];
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        coverView.frame = CGRectMake(0, 172, 320, 55);
        [UIView commitAnimations];
    } else {
        // code for 3.5-inch screen
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        buttonSetBContainer.frame = CGRectMake(0, 151, 320, 88);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        buttonSetAContainer.frame = CGRectMake(0, 183, 320, 88);
        [UIView commitAnimations];
        
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        coverView.frame = CGRectMake(0, 84, 320, 55);
        [UIView commitAnimations];
    }
}

- (IBAction)logInButton:(id)sender {
    [activityIndicator setAlpha:1];
    [self.view bringSubviewToFront:clearForLoading];
    
    [PFUser logInWithUsernameInBackground:[emailTextField text] password:[passwordTextField text] block:^(PFUser *user, NSError *error) {
        if (user) {
            // Do stuff after successful login.
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
            [self presentViewController:jobScreenViewController animated:YES completion:nil];
                
        } else {
            // The login failed. Check error to see why.
            [activityIndicator setAlpha:0];
            [self.view sendSubviewToBack:clearForLoading];
            
            [[[UIAlertView alloc] initWithTitle:@"Invalid Log In"
                                message:@"Username or password was incorrect!"
                                delegate:nil
                                cancelButtonTitle:@"ok"
                                otherButtonTitles:nil] show];
        }
    }];
}

- (IBAction)signUpButton:(id)sender {
    if(![passwordTextField isSecureTextEntry]){
        [passwordTextField setText:@""];
        [passwordTextField setPlaceholder:@"Password"];
        [passwordTextField setKeyboardType:UIKeyboardTypeDefault];
        [passwordTextField setSecureTextEntry:YES];
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            buttonSetBContainer.frame = CGRectMake(0, 239, 320, 88);
            [UIView commitAnimations];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelay:0.3];
            [UIView setAnimationDuration:0.3];
            buttonSetAContainer.frame = CGRectMake(0, 271, 320, 88);
            [UIView commitAnimations];
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            coverView.frame = CGRectMake(0, 172, 320, 55);
            [UIView commitAnimations];
        } else {
            // code for 3.5-inch screen
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            buttonSetBContainer.frame = CGRectMake(0, 151, 320, 88);
            [UIView commitAnimations];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelay:0.3];
            [UIView setAnimationDuration:0.3];
            buttonSetAContainer.frame = CGRectMake(0, 183, 320, 88);
            [UIView commitAnimations];
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            coverView.frame = CGRectMake(0, 84, 320, 55);
            [UIView commitAnimations];
        }
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    SignUpViewController *signUpViewController = [storyboard instantiateViewControllerWithIdentifier:@"SignUpViewController"];
    [self presentViewController:signUpViewController animated:YES completion:nil];
}

- (IBAction)facebookSignInButton:(id)sender {
    [activityIndicator setAlpha:1];
    [self.view bringSubviewToFront:clearForLoading];
    [clearForLoading setAlpha:0.1];
    /*
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        // code for 4-inch screen
        
/*
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0];
        clearForLoading.frame = CGRectMake(0, 0, 320, 548);
        [UIView commitAnimations];

        [self.view bringSubviewToFront:clearForLoading];
        
    } else {
        // code for 3.5-inch screen
        /*
        // User does not need to send password anymore
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0];
        clearForLoading.frame = CGRectMake(0, 0, 320, 460);        
        [UIView commitAnimations];
        [self.view bringSubviewToFront:clearForLoading];
    }*/

    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        [activityIndicator stopAnimating]; // Hide loading indicator
        
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            //////////
            // ...
            // Create request for user's Facebook data
            FBRequest *request = [FBRequest requestForMe];
            
            // Send request to Facebook
            [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                if (!error) {
                    // result is a dictionary with the user's Facebook data
                    NSDictionary *userData = (NSDictionary *)result;
                    NSString *facebookID = userData[@"id"];
                    NSString *name = userData[@"name"];
                    NSArray *nameArray = [name componentsSeparatedByString: @" "];
                    
                    NSString *firstName = [nameArray objectAtIndex:0];
                    NSMutableString *lastName = @"";
                    
                    for(int nameIndex = 0; nameIndex < [nameArray count]; nameIndex++){
                        [lastName appendString:@" "];
                        [lastName appendString:[nameArray objectAtIndex:nameIndex]];
                    }
                    //NSString *location = userData[@"location"][@"name"];
                    NSString *gender = userData[@"gender"];
                    NSString *birthday = userData[@"birthday"];
                    //NSString *relationship = userData[@"relationship_status"];
                    
                    NSURL *pictureURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/%@/picture?type=large&return_ssl_resources=1", facebookID]];
                    
                    // Now add the data to the UI elements
                    // ...
                    [user setValue:firstName forKey:@"firstName"];
                    [user setValue:lastName forKey:@"lastName"];
                    [user setValue:gender forKey:@"gender"];
                    //[user setValue:YES forKey:@"facebookUser"];
                    [user setValue:@"No Profession" forKey:@"profession"];

                    [user setValue:[pictureURL absoluteString] forKey:@"profilePictureLink"];
                    [user saveInBackground];

                }
            }];
            
            //////////
            [activityIndicator setAlpha:0];
                [self.view sendSubviewToBack:clearForLoading];
            /*
            if (screenBounds.size.height == 568) {
                // code for 4-inch screen
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0];
                clearForLoading.frame = CGRectMake(-320, 0, 320, 548);
                [UIView commitAnimations];
                
            } else {
                // code for 3.5-inch screen
                
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:0];
                clearForLoading.frame = CGRectMake(-320, 0, 320, 460);
                [UIView commitAnimations];
            }
*/
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
            [self presentViewController:jobScreenViewController animated:YES completion:nil];
            
        } else {
            NSLog(@"User with facebook logged in!");
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
            JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
            [self presentViewController:jobScreenViewController animated:YES completion:nil];
        }
    }];
}

    /*
    if(![passwordTextField isSecureTextEntry]){
        [passwordTextField setText:@""];
        [passwordTextField setPlaceholder:@"Password"];
        [passwordTextField setKeyboardType:UIKeyboardTypeDefault];
        [passwordTextField setSecureTextEntry:YES];
        
        CGRect screenBounds = [[UIScreen mainScreen] bounds];
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            buttonSetBContainer.frame = CGRectMake(0, 239, 320, 88);
            [UIView commitAnimations];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelay:0.3];
            [UIView setAnimationDuration:0.3];
            buttonSetAContainer.frame = CGRectMake(0, 271, 320, 88);
            [UIView commitAnimations];
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            coverView.frame = CGRectMake(0, 172, 320, 55);
            [UIView commitAnimations];
        } else {
            // code for 3.5-inch screen
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            buttonSetBContainer.frame = CGRectMake(0, 151, 320, 88);
            [UIView commitAnimations];
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDelay:0.3];
            [UIView setAnimationDuration:0.3];
            buttonSetAContainer.frame = CGRectMake(0, 183, 320, 88);
            [UIView commitAnimations];
            
            // User does not need to send password anymore
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            coverView.frame = CGRectMake(0, 84, 320, 55);
            [UIView commitAnimations];
        }
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    FacebookLoginViewController *facebookLoginViewController = [storyboard instantiateViewControllerWithIdentifier:@"FacebookLoginViewController"];
    [self presentViewController:facebookLoginViewController animated:YES completion:nil];
     */
//}
@end