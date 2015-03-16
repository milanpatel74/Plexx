//
//  SkillSpecificViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/29/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "SkillSpecificViewController.h"
#import "ProfileViewController.h"

#import "LearnSkillViewController.h"
#import "TrainSkillViewController.h"

#import "LogInViewController.h"

#import "SettingsViewController.h"

@interface SkillSpecificViewController ()

@end

@implementation SkillSpecificViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize titleLabel;
@synthesize skillName;
@synthesize skillAuthor;

@synthesize currentScreen;

@synthesize arrowMover;
@synthesize trainView;
@synthesize learnView;
@synthesize relatedView;

@synthesize learnSkillAttributes;
@synthesize trainSkillAttributes;
@synthesize reportSkillAttributes;

//@synthesize addSkillButtonAttributes;
//@synthesize removeSkillButtonAttributes;

@synthesize objectSupporting;

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
    [skillName setFont:UbuntuMid];
    [skillAuthor setFont:UbuntuSmall];
    
    [[learnSkillAttributes titleLabel] setFont:UbuntuSmall];
    [[trainSkillAttributes titleLabel] setFont:UbuntuSmall];
    [[reportSkillAttributes titleLabel] setFont:UbuntuSmall];

    [skillName setText:[objectSupporting valueForKey:@"Name"]];
    [skillAuthor setText:[objectSupporting valueForKey:@"Creator"]];
    /*
     [skillAuthor setText:[objectSupporting valueForKey:@"Description"]];
     
     [skillAuthor setText:[objectSupporting valueForKey:@"Creator"]];
     
     NSMutableString *linkPrior = [NSMutableString stringWithFormat:@"%@", object[@"Link"]];
     */
    currentScreen = 2;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 NSString *togetherString = [NSString stringWithFormat: @"Description \n Location:%@ \n Date Posted:%@ \n %@", location, date, descriptionString];
 */
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"connectionFromSpecificSkillToLearn"]) {
        LearnSkillViewController * childViewController = (LearnSkillViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
    }else if ([segueName isEqualToString: @"connectionFromSpecificSkillTrain"]) {
        TrainSkillViewController * childViewController = (TrainSkillViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
    }
    
}

/*
- (IBAction)addSkillButton:(id)sender {
    //NSLog(@"Still here");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    addSkillButtonAttributes.frame = CGRectMake(216, 0, 84, 40);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.3];
    [UIView setAnimationDuration:0.3];
    removeSkillButtonAttributes.frame = CGRectMake(180, 38, 120, 40);
    [UIView commitAnimations];
}

- (IBAction)removeSkillButton:(id)sender {
    //NSLog(@"here");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    removeSkillButtonAttributes.frame = CGRectMake(180, 0, 120, 40);
    [UIView commitAnimations];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDelay:0.3];
    [UIView setAnimationDuration:0.3];
    addSkillButtonAttributes.frame = CGRectMake(216, 38, 84, 40);
    [UIView commitAnimations];
    
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
- (IBAction)learnSkillsButton:(id)sender {
    if (currentScreen == 1) {
        // LEARN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        learnView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // TRAIN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        trainView.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        
        // RELATED MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        relatedView.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        arrowMover.frame = CGRectMake(49, 173, 15, 9);
        [UIView commitAnimations];
        
    } else if (currentScreen == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        learnView.frame = CGRectMake(0, 181, 320, 367);
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
        relatedView.frame = CGRectMake(-320, 181, 320, 367);
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
        
        // LEARN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        learnView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(153, 173, 15, 9);
        [UIView commitAnimations];
    }
    
    currentScreen = 2;
}

- (IBAction)relatedSkillsButton:(id)sender {
    if (currentScreen == 1) {
        // Do nothing on the right screen
        
    } else if (currentScreen == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        trainView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        relatedView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(259, 173, 15, 9);
        [UIView commitAnimations];
    }else{
        // RELATED MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        relatedView.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // TRAIN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        trainView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        // LEARN MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        learnView.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        arrowMover.frame = CGRectMake(259, 173, 15, 9);
        [UIView commitAnimations];
        
    }
    currentScreen = 1;
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
