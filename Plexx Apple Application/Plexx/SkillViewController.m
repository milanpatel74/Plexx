//
//  SkillViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "SkillViewController.h"
#import "SkillSpecificViewController.h"
#import "SkillTableViewController.h"

#import "ProfileViewController.h"
#import "JobScreenViewController.h"
#import "MenuOnSkillsViewController.h"

#import "AboutViewController.h"
#import "TermsAndCondViewController.h"
#import "ReportBugViewController.h"

#import "LogInViewController.h"

#import "SettingsViewController.h"

@interface SkillViewController ()

@end

@implementation SkillViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize specifierButtonAttributes;
//@synthesize moverView;
@synthesize mainView;
@synthesize menuView;
@synthesize disablingScreenView;
@synthesize menuClose;
@synthesize allSkillsAttributes;

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
    UIFont *UbuntuBig = [UIFont fontWithName:@"Ubuntu-Medium" size:26.f];
    
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    [allSkillsAttributes setFont:UbuntuBig];
    [[specifierButtonAttributes titleLabel] setFont:UbuntuSmall];
    menuClose = YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"connectionSkillsToTable"]) {        
        SkillTableViewController * childViewController = (SkillTableViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    } else if ([segueName isEqualToString: @"connectionFromSkillsToMenu"]) {
        MenuOnSkillsViewController * childViewController = (MenuOnSkillsViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
    }
    
}

-(void) pressedButtonOnCell:(NSObject *)objectChoice{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    SkillSpecificViewController *skillSpecificViewController = [storyboard instantiateViewControllerWithIdentifier:@"SkillSpecificViewController"];
    skillSpecificViewController.objectSupporting = objectChoice;
    [self presentViewController:skillSpecificViewController animated:YES completion:nil];
}

-(void) menuChoice:(int *)indexInMenu{
    // Moving Main Left
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    mainView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    
    // Moving Menu Out
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    menuView.frame = CGRectMake(-236, 0, 236, 460);
    [UIView commitAnimations];
    
    // Undisable Main
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.0];
    disablingScreenView.frame = CGRectMake(-320, 0, 320, 548);
    [UIView commitAnimations];
    
    menuClose = YES;
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    /*
    if (indexInMenu == 0) {
        ProfileViewController *profileViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
        [self presentViewController:profileViewController animated:YES completion:nil];
        
    } else
        */
    if (indexInMenu == 0) {
        JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
        [self presentViewController:jobScreenViewController animated:YES completion:nil];
        
    } else if (indexInMenu == 1) {
        // Do nothing this is the correct screen
        
    } else if (indexInMenu == 2) {
        // About Plexx
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        AboutViewController *aboutViewController = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
        [self presentViewController:aboutViewController animated:YES completion:nil];
        
    }else if (indexInMenu == 3) {
        // Privacy Policy
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        TermsAndCondViewController *termsAndCondViewController = [storyboard instantiateViewControllerWithIdentifier:@"TermsAndCondViewController"];
        [self presentViewController:termsAndCondViewController animated:YES completion:nil];
    }else if (indexInMenu == 4) {
        // Report bug
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        ReportBugViewController *reportBugViewController = [storyboard instantiateViewControllerWithIdentifier:@"ReportBugViewController"];
        [self presentViewController:reportBugViewController animated:YES completion:nil];
    }
}

- (IBAction)menuButton:(id)sender {
    if(menuClose){
        // Moving Main Right
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        mainView.frame = CGRectMake(236, 0, 320, 460);
        [UIView commitAnimations];
        
        // Moving Menu In
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        menuView.frame = CGRectMake(0, 0, 236, 460);
        [UIView commitAnimations];
        
        // Disable Main
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.0];
        disablingScreenView.frame = CGRectMake(0, 0, 320, 548);
        [UIView commitAnimations];
        
        menuClose = NO;
        
    }else{
        // Moving Main Left
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        mainView.frame = CGRectMake(0, 0, 320, 460);
        [UIView commitAnimations];
        
        // Moving Menu Out
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        menuView.frame = CGRectMake(-236, 0, 236, 460);
        [UIView commitAnimations];
        
        // Undisable Main
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.0];
        disablingScreenView.frame = CGRectMake(-320, 0, 320, 548);
        [UIView commitAnimations];
        
        menuClose = YES;
        
    }
}
/*
- (IBAction)profileButton:(id)sender {
    if(!menuClose){
        // Moving Main Left
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        mainView.frame = CGRectMake(0, 0, 320, 460);
        [UIView commitAnimations];
        
        // Moving Menu Out
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        menuView.frame = CGRectMake(-236, 0, 236, 460);
        [UIView commitAnimations];
        
        // Undisable Main
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.0];
        disablingScreenView.frame = CGRectMake(-320, 0, 320, 548);
        [UIView commitAnimations];
        
        menuClose = YES;
        
    }
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ProfileViewController *profileViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self presentViewController:profileViewController animated:YES completion:nil];
}
*/
- (IBAction)specifierButton:(id)sender {

}
/*
-(void) selectionMade:(PFObject *)choice{
    //NSLog(@"%@", [choice valueForKey:@"title"]);
    //NSLog(@"hello");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    SkillSpecificViewController *skillSpecificViewController = [storyboard instantiateViewControllerWithIdentifier:@"SkillSpecificViewController"];
    
    skillSpecificViewController.objectSupporting = choice;
    
    [self presentViewController:skillSpecificViewController animated:YES completion:nil];
}
*/

- (IBAction)disablingViewButton:(id)sender {
    // Moving Main Left
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    mainView.frame = CGRectMake(0, 0, 320, 460);
    [UIView commitAnimations];
    
    // Moving Menu Out
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    menuView.frame = CGRectMake(-236, 0, 236, 460);
    [UIView commitAnimations];
    
    // Undisable Main
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.0];
    disablingScreenView.frame = CGRectMake(-320, 0, 320, 548);
    [UIView commitAnimations];
    
    menuClose = YES;

}

- (IBAction)signOutButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    SettingsViewController *settingsViewController = [storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    [self presentViewController:settingsViewController animated:YES completion:nil];
    
}

/*
- (IBAction)signOutButton:(id)sender {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sign Out" message:@"Are you sure you want to sign out?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: @"Yes", nil];
    
    [alertView setAlertViewStyle:UIAlertViewStyleDefault];
    [alertView show];
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Yes"])
    {
        
        [PFUser logOut];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        
        LogInViewController *logInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
        [self presentViewController:logInViewController animated:YES completion:nil];
    }
}
*/
@end
