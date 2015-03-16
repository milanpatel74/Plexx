//
//  SpecificJobViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "SpecificJobViewController.h"
#import "ProfileViewController.h"

#import "ApplySpecificJobViewController.h"
#import "TrainSpecificJobViewController.h"
#import "InfoSpecificJobViewController.h"

#import "LogInViewController.h"
#import "SkillSpecificViewController.h"

#import "SettingsViewController.h"

@interface SpecificJobViewController ()

@end

@implementation SpecificJobViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize objectSupporting;

@synthesize jobCategoryLabel;
@synthesize jobNameLabel;
@synthesize jobLocationLabel;
//@synthesize jobSalaryLabel;
@synthesize currentScreen;

@synthesize arrowMover;
@synthesize trainView;
@synthesize infoView;
@synthesize applyView;

@synthesize titleLabel;
//@synthesize addJobButtonAttributes;
//@synthesize removeJobButtonAttributes;

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
    UIFont *UbuntuMid = [UIFont fontWithName:@"Ubuntu-Medium" size:18.f];
    
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    [titleLabel setFont:UbuntuBig];
    [jobNameLabel setFont:UbuntuMid];
    [jobCategoryLabel setFont:UbuntuSmall];
    [jobLocationLabel setFont:UbuntuSmall];
    
    NSString *nameAndLocation = [NSString stringWithFormat:@"%@ - %@, %@", objectSupporting[@"company"], objectSupporting[@"city"], objectSupporting[@"state"]];
    
    //NSString *jobSalary = [NSString stringWithFormat:@"%@", objectSupporting[@"salary"]];
    //NSString *timeAndSalary = [NSString stringWithFormat:@"%@ - $%@", objectSupporting[@"employmentType"], jobSalary];
    
    [jobCategoryLabel setText:objectSupporting[@"category"]];
    [jobNameLabel setText:objectSupporting[@"title"]];
    [jobLocationLabel setText:nameAndLocation];
   // [jobSalaryLabel setText:timeAndSalary];
    
    currentScreen = 2;
}

-(void) pressedButtonOnCell:(PFObject *)objectChoice{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    SkillSpecificViewController *skillSpecificViewController = [storyboard instantiateViewControllerWithIdentifier:@"SkillSpecificViewController"];
    skillSpecificViewController.objectSupporting = objectChoice;
    [self presentViewController:skillSpecificViewController animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"connectionFromSpecificJobToApply"]) {
        ApplySpecificJobViewController * childViewController = (ApplySpecificJobViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
    }else if ([segueName isEqualToString: @"connectionFromSpecificJobToTrain"]) {
        TrainSpecificJobViewController * childViewController = (TrainSpecificJobViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
    }else if ([segueName isEqualToString: @"connectionFromSpecificJobToInfo"]) {
        InfoSpecificJobViewController * childViewController = (InfoSpecificJobViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
       // childViewController.objectSupporting = objectSupporting;
    }

}
/*
- (IBAction)addJobButton:(id)sender {
    NSLog(@"Still here");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    addJobButtonAttributes.frame = CGRectMake(216, 0, 84, 40);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.3];
    [UIView setAnimationDuration:0.3];
    removeJobButtonAttributes.frame = CGRectMake(180, 38, 120, 40);
    [UIView commitAnimations];
}

- (IBAction)removeJobButton:(id)sender {
    NSLog(@"here");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    removeJobButtonAttributes.frame = CGRectMake(180, 0, 120, 40);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.3];
    [UIView setAnimationDuration:0.3];
    addJobButtonAttributes.frame = CGRectMake(216, 38, 84, 40);
    [UIView commitAnimations];

}
*/
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

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
//    [self presentViewController:profileViewController animated:YES completion:nil];
}

/*
- (IBAction)profileButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    ProfileViewController *profileViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self presentViewController:profileViewController animated:YES completion:nil];
}
*/
- (IBAction)infoSkillsButton:(id)sender {
    if (currentScreen == 1) {
        // INFO MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        infoView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // TRAIN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        trainView.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        

        // APPLY MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        applyView.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        arrowMover.frame = CGRectMake(49, 173, 15, 9);
        [UIView commitAnimations];
        
    } else if (currentScreen == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        infoView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        trainView.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(49, 173, 15, 9);
        [UIView commitAnimations];
        
    }else{
        // Do nothing on the right screen
    }
    
    currentScreen = 3;
}

- (IBAction)trainSkillsButton:(id)sender {
    if (currentScreen == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        applyView.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        // TRAIN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        trainView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(153, 173, 15, 9);
        [UIView commitAnimations];
        
    } else if (currentScreen == 2) {
        // Do nothing on the right screen
    
    }else{
        // TRAIN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        trainView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // INFO MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        infoView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(153, 173, 15, 9);
        [UIView commitAnimations];
    }
    
    currentScreen = 2;
}

- (IBAction)applySkillsButton:(id)sender {
    if (currentScreen == 1) {
        // Do nothing on the right screen

    } else if (currentScreen == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        trainView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        applyView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(259, 173, 15, 9);
        [UIView commitAnimations];
    }else{
        // APPLY MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        applyView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // TRAIN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        trainView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        // INFO MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        infoView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        arrowMover.frame = CGRectMake(259, 173, 15, 9);
        [UIView commitAnimations];

    }
    currentScreen = 1;
}
@end
