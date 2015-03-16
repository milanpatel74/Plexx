//
//  ProfileViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "ProfileViewController.h"
#import "JobScreenViewController.h"
#import "JobScreenViewController.h"
#import "LogInViewController.h"
#import "SpecificJobViewController.h"
#import "SkillViewController.h"


#import "ProfilePathwaysViewController.h"
#import "ProfileSkillsViewController.h"
#import "ProfileJobsViewController.h"
#import "MenuOnProfileViewController.h"

#import "AboutViewController.h"
#import "TermsAndCondViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize profilePictureImageView;

@synthesize nameLabel;
@synthesize shownProfession;
@synthesize otherInformationLabel;

@synthesize jobAttributesButton;
@synthesize skillsAttributesButton;
@synthesize pathwaysAttributesButton;

@synthesize skillsViewContainer;
@synthesize jobsViewContainer;
@synthesize pathwaysViewContainer;
@synthesize arrowMover;

@synthesize currentScreen;

@synthesize menuView;
@synthesize mainView;
@synthesize disablingScreenView;

@synthesize menuClose;

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
    menuClose = YES;

    currentScreen = 2;
    PFUser *currUser = [PFUser currentUser];
    
//    NSString *pathPicture =  @"https://fbcdn-sphotos-g-a.akamaihd.net/hphotos-ak-ash4/248118_10151471862290852_1706393420_n.jpg";
   
    NSString *pathPicture = [currUser valueForKey:@"profilePictureLink"];
    //profilePictureImageView
    NSURL *url = [NSURL URLWithString:pathPicture];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [[UIImage alloc] initWithData:data];
    //CGSize size = image.size;
    [profilePictureImageView setImage:image];

    NSString *name = [NSString stringWithFormat: @"%@ %@", [currUser valueForKey:@"firstName"], [currUser valueForKey:@"lastName"]];
    [nameLabel setText:name];
    
    NSString *profession = [currUser valueForKey:@"profession"];
    [shownProfession setText:profession];

    NSString *skillsJobs = [NSString stringWithFormat: @"%i skills - %i pathways", [[currUser valueForKey:@"skillsArray"] count], [[currUser valueForKey:@"pathwaysArray"] count]];
    [otherInformationLabel setText:skillsJobs];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) selectionMade:(PFObject *)choice{
    NSLog([choice valueForKey:@"title"]);
    NSLog(@"hello");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    SpecificJobViewController *specificJobViewController = [storyboard instantiateViewControllerWithIdentifier:@"SpecificJobViewController"];
    [self presentViewController:specificJobViewController animated:YES completion:nil];
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
    if (indexInMenu == 0) {
        // Do nothing this is the correct screen
        
    } else if (indexInMenu == 1) {
        JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
        [self presentViewController:jobScreenViewController animated:YES completion:nil];
        
    } else if (indexInMenu == 2) {
        SkillViewController *skillViewController = [storyboard instantiateViewControllerWithIdentifier:@"SkillViewController"];
        [self presentViewController:skillViewController animated:YES completion:nil];
        
    } else if (indexInMenu == 3) {
        // About Plexx
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        AboutViewController *aboutViewController = [storyboard instantiateViewControllerWithIdentifier:@"AboutViewController"];
        [self presentViewController:aboutViewController animated:YES completion:nil];
        
    }else if (indexInMenu == 4) {
        // Privacy Policy
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        TermsAndCondViewController *termsAndCondViewController = [storyboard instantiateViewControllerWithIdentifier:@"TermsAndCondViewController"];
        [self presentViewController:termsAndCondViewController animated:YES completion:nil];
    }else if (indexInMenu == 5) {
        // Report bug
    }
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"connectionFromProfileToJob"]) {
        /////// CHANGE

        ProfileJobsViewController * childViewController = (ProfileJobsViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
    }else if ([segueName isEqualToString: @"connectionFromProfileToSkills"]) {
        ProfileSkillsViewController * childViewController = (ProfileSkillsViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
        
    }else if ([segueName isEqualToString: @"connectionFromProfileToPathways"]) {
        ProfilePathwaysViewController * childViewController = (ProfilePathwaysViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
    } else if ([segueName isEqualToString: @"connectionFromProfileToMenu"]) {
        MenuOnProfileViewController * childViewController = (MenuOnProfileViewController *) [segue destinationViewController];
        childViewController.parentViewController = self;
    }
    
}

- (IBAction)jobButton:(id)sender {
    if (currentScreen == 1) {
        // JOBS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        jobsViewContainer.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // SKILLS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        skillsViewContainer.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        
        // PATHWAYS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        pathwaysViewContainer.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        arrowMover.frame = CGRectMake(49, 173, 15, 9);
        [UIView commitAnimations];
        
    } else if (currentScreen == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        jobsViewContainer.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        skillsViewContainer.frame = CGRectMake(-320, 181, 320, 367);
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

- (IBAction)skillsButton:(id)sender {
    if (currentScreen == 1) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        pathwaysViewContainer.frame = CGRectMake(-320, 181, 320, 367);
        [UIView commitAnimations];
        
        // SKILLS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        skillsViewContainer.frame = CGRectMake(0, 181, 320, 367);
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
        skillsViewContainer.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // SKILLS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        jobsViewContainer.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(153, 173, 15, 9);
        [UIView commitAnimations];
    }
    
    
    currentScreen = 2;
    
}

- (IBAction)pathwaysButton:(id)sender {
    if (currentScreen == 1) {
        // Do nothing on the right screen
        
    } else if (currentScreen == 2) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        skillsViewContainer.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        pathwaysViewContainer.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        arrowMover.frame = CGRectMake(259, 173, 15, 9);
        [UIView commitAnimations];
        
    }else{
        // PATHWAYS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDelay:0.3];
        [UIView setAnimationDuration:0.3];
        pathwaysViewContainer.frame = CGRectMake(0, 181, 320, 367);
        [UIView commitAnimations];
        
        // SKILLS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        skillsViewContainer.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        // JOBS MOVEMENTS
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        jobsViewContainer.frame = CGRectMake(320, 181, 320, 367);
        [UIView commitAnimations];
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.6];
        arrowMover.frame = CGRectMake(259, 173, 15, 9);
        [UIView commitAnimations];
        
        
    }
    
    currentScreen = 1;
    
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

- (IBAction)closeMenuButton:(id)sender {
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

- (IBAction)signOutButton:(id)sender{
    [PFUser logOut];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    LogInViewController *logInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    [self presentViewController:logInViewController animated:YES completion:nil];
}
@end
