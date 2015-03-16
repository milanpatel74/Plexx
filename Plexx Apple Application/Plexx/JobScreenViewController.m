//
//  JobScreenViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "JobScreenViewController.h"

#import "ProfileViewController.h"
#import "SpecificJobViewController.h"
#import "MenuOnJobsViewController.h"

#import "SkillViewController.h"

#import "ArtsTableViewController.h"
#import "HumanViewController.h"
#import "EngineeringViewController.h"
#import "BusinessTableViewController.h"
#import "HealthTableViewController.h"

#import "TermsAndCondViewController.h"
#import "AboutViewController.h"
#import "ReportBugViewController.h"

#import "LogInViewController.h"
#import "SettingsViewController.h"


@interface JobScreenViewController ()

@end

@implementation JobScreenViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize menuView;
@synthesize mainView;
@synthesize disablingScreenView;

@synthesize menuClose;
@synthesize allJobsAttributes;
//@synthesize categoryPickerDataSource;
@synthesize containerOfPicker;
//@synthesize childJobViewController;
//@synthesize categoryFilter;
//JobScreenTableViewController *childJobViewController;
@synthesize ArtsViewContainer;
@synthesize HumanViewContainer;
@synthesize NaturalViewContainer;
@synthesize HealthViewContainer;
@synthesize EngineeringViewContainer;
@synthesize BusinessViewContainer;

@synthesize jobsTitleAttributes;


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
    //UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
      //                                                                    action:@selector(dismissMenu)];
    
   // [self.view addGestureRecognizer:tap];
    //childJobViewController.categoryFilter = @"";
    UIFont *UbuntuBig = [UIFont fontWithName:@"Ubuntu-Medium" size:26.f];
    
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    [jobsTitleAttributes setFont:UbuntuBig];
    [[allJobsAttributes titleLabel] setFont:UbuntuSmall];
    
    categoryPickerDataSource = [[NSMutableArray alloc] init];
    [categoryPickerDataSource addObject:@"Arts & Humanities"];
    [categoryPickerDataSource addObject:@"Human & Public Services"];
    [categoryPickerDataSource addObject:@"Natural & Agricultural Services"];
    [categoryPickerDataSource addObject:@"Health Services"];
    [categoryPickerDataSource addObject:@"Engineering & Technology"];
    [categoryPickerDataSource addObject:@"Business & Information Systems"];

}
/*
- (void)dismissMenu
{
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
*/
/*
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [categoryPickerDataSource count];
}


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [categoryPickerDataSource objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //NSLog(@"Selected Color: %@. Index of selected color: %i", [dataSource objectAtIndex:row], row);
    [allJobsAttributes setTitle:[categoryPickerDataSource objectAtIndex:row] forState:normal];
    
}
*/

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [categoryPickerDataSource count];
}


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [categoryPickerDataSource objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //NSLog(@"Selected Color: %@. Index of selected color: %i", [dataSource objectAtIndex:row], row);
    [allJobsAttributes setTitle:[categoryPickerDataSource objectAtIndex:row] forState:normal];
    
    
//    [mainView bringSubviewToFront:containerOfPicker];

    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        // code for 4-inch screen
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0];
        containerOfPicker.frame = CGRectMake(0, 298, 320, 260);
        [UIView commitAnimations];
        
    } else {
        // code for 3.5-inch screen
        
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0];
        containerOfPicker.frame = CGRectMake(0, 200, 320, 260);
        [UIView commitAnimations];
    }
    /*
     @synthesize ArtsViewContainer;
     @synthesize HumanViewContainer;
     @synthesize NaturalViewContainer;
     @synthesize HealthViewContainer;
     @synthesize EngineeringViewContainer;
     @synthesize BusinessViewContainer;
     
    @"All Jobs"
    @"Arts & Humanities"
    @"Human & Public Services"
    @"Natural & Agricultural Services"
    @"Health Services"
    @"Engineering & Technology"
    @"Business & Information Systems"
    */
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    //if ([segueName isEqualToString: @"connectionJobScreenTableViewController"]) {
      //  JobScreenTableViewController *childViewController = (JobScreenTableViewController *) [segue destinationViewController];
    //   childViewController.parentViewController = (id)self;
        
    
    if ([segueName isEqualToString: @"connectionJobsMenu"]) {
        
        MenuOnJobsViewController * childViewController = (MenuOnJobsViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }else if([segueName isEqualToString:@"connectionToArtsJobs"]){

        ArtsTableViewController * childViewController = (ArtsTableViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }else if([segueName isEqualToString:@"connectionToNaturalJobs"]){
        ///////////////// FIX
        ArtsTableViewController * childViewController = (ArtsTableViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }else if([segueName isEqualToString:@"connectionToHealthJobs"]){
        HealthTableViewController * childViewController = (HealthTableViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }else if([segueName isEqualToString:@"connectionToEngineeringJobs"]){
        EngineeringViewController * childViewController = (EngineeringViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }else if([segueName isEqualToString:@"connectionToHumanJobs"]){
        HumanViewController * childViewController = (HumanViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }else if([segueName isEqualToString:@"connectionToBusinessJobs"]){
        BusinessTableViewController * childViewController = (BusinessTableViewController *) [segue destinationViewController];
        childViewController.parentViewController = (id)self;
        
    }
}

-(void) selectionMade:(PFObject *)choice{
    //NSLog(@"%@", [choice valueForKey:@"title"]);
    //NSLog(@"hello");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    SpecificJobViewController *specificJobViewController = [storyboard instantiateViewControllerWithIdentifier:@"SpecificJobViewController"];
    
    specificJobViewController.objectSupporting = choice;
    
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
    /*
    if (indexInMenu == 0) {
        ProfileViewController *profileViewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
        [self presentViewController:profileViewController animated:YES completion:nil];
        
    } else
    */
    if (indexInMenu == 0) {
        // Do nothing this is the correct screen
        
    } else if (indexInMenu == 1) {
        SkillViewController *skillViewController = [storyboard instantiateViewControllerWithIdentifier:@"SkillViewController"];
        [self presentViewController:skillViewController animated:YES completion:nil];
        
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
- (IBAction)categorySpecifierButton:(id)sender {
    //[mainView bringSubviewToFront:containerOfPicker];
    
    //childJobViewController.className = @"Occupation";
    //childJobViewController.parseClassName = @"Occupation";
  //  [self dismissKeyboard];
    //[termsOfServiceButtonAttributes setUserInteractionEnabled:NO];
    //[confirmButtonAttributes setUserInteractionEnabled:NO];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    if (screenBounds.size.height == 568) {
        // code for 4-inch screen
            
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
            containerOfPicker.frame = CGRectMake(0, 298, 320, 260);
        [UIView commitAnimations];
            
    } else {
            // code for 3.5-inch screen
            
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
            containerOfPicker.frame = CGRectMake(0, 200, 320, 260);
        [UIView commitAnimations];
    }
}

    /*
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Zip Code" message:@"Please enter a zipcode." delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: @"Go!", nil];
    
    [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [alertView show];
    
}
*/
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
/*
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    if([title isEqualToString:@"Go!"])
    {
        UITextField *inputForNewTitle = [alertView textFieldAtIndex:0];
        //[dataLabel setTitle:[inputForNewTitle text] forState:UIControlStateNormal];
        NSLog([inputForNewTitle text]);
    }
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
- (IBAction)hideCategoryPicker:(id)sender {
    // NSLog(@"Hello");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0];
    containerOfPicker.frame = CGRectMake(0, 548, 320, 260);
    [UIView commitAnimations];
    
    [mainView bringSubviewToFront:containerOfPicker];
    /*
     @"All Jobs"
     @"Arts & Humanities"
     @"Human & Public Services"
     @"Natural & Agricultural Services"
     @"Health Services"
     @"Engineering & Technology"
     @"Business & Information Systems"

     */
    NSString *jobsButtonName =[[allJobsAttributes titleLabel] text];
    
    //[mainView bringSubviewToFront:containerOfPicker];
    
    //if ([jobsButtonName isEqualToString:@"All Jobs"]) {
        //  @"All Jobs"
    
    //} else

    if ([jobsButtonName isEqualToString:@"Arts & Humanities"]) {
        // @"Arts & Humanities"
        [mainView bringSubviewToFront:ArtsViewContainer];
        
    } else if ([jobsButtonName isEqualToString:@"Human & Public Services"]) {
        // @"Human & Public Services"
        [mainView bringSubviewToFront:HumanViewContainer];
        
    } else if ([jobsButtonName isEqualToString:@"Natural & Agricultural Services"]) {
        //  @"Natural & Agricultural Services"
        [mainView bringSubviewToFront:NaturalViewContainer];
        
    } else if ([jobsButtonName isEqualToString:@"Health Services"]) {
        // @"Health Services"
        [mainView bringSubviewToFront:HealthViewContainer];
        
    } else if ([jobsButtonName isEqualToString:@"Engineering & Technology"]) {
        //@"Engineering & Technology"
        [mainView bringSubviewToFront:EngineeringViewContainer];
        
    } else if ([jobsButtonName isEqualToString:@"Business & Information Systems"]) {
        // @"Business & Information Systems"
        [mainView bringSubviewToFront:BusinessViewContainer];
    }
    [mainView bringSubviewToFront:containerOfPicker];
//    categoryFilter
//    childJobViewController.categoryFilter = [[allJobsAttributes titleLabel] text];

//    childJobViewController.categoryFilter = ;

  //  [childJobViewController queryForTable];
    //= //[[JobScreenTableViewController alloc] init];

    //categoryFilter
    
    
    //screenStateForPickers = 1;
    
    // [termsOfServiceButtonAttributes setUserInteractionEnabled:YES];
    //    [confirmButtonAttributes setUserInteractionEnabled:YES];
}

//- (IBAction)educationLevelButton:(id)sender {
//////////////////////////////////////////////////////////////////////////////
/*
-(void)queryImagesArts:(id)object{
    //////////////////// Arts & Humanities
    NSLog(@">>>>>>>>>>>>>Arts & Humanities");
    PFQuery *pictureQueryArts = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryArts whereKey:@"Category" equalTo:@"Arts & Humanities"];
    [pictureQueryArts findObjectsInBackgroundWithTarget:self
                                               selector:@selector(queryToLoad:error:)];
}

-(void)queryImagesHuman:(id)object{
    //////////////////// Human & Public Services
    NSLog(@">>>>>>>>>>>>>Human & Public Services");
    PFQuery *pictureQueryHuman = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryHuman whereKey:@"Category" equalTo:@"Human & Public Services"];
    [pictureQueryHuman findObjectsInBackgroundWithTarget:self
                                                selector:@selector(queryToLoad:error:)];
}

-(void)queryImagesNatural:(id)object{
    //////////////////// Natural & Agricultural Services
    NSLog(@">>>>>>>>>>>>>Natural & Agricultural Services");
    PFQuery *pictureQueryNatural = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryNatural whereKey:@"Category" equalTo:@"Natural & Agricultural Services"];
    [pictureQueryNatural findObjectsInBackgroundWithTarget:self
                                                  selector:@selector(queryToLoad:error:)];
}

-(void)queryImagesHealth:(id)object{
    //////////////////// Health Services
    NSLog(@">>>>>>>>>>>>>Health Services");
    PFQuery *pictureQueryHealth = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryHealth whereKey:@"Category" equalTo:@"Health Services"];
    [pictureQueryHealth findObjectsInBackgroundWithTarget:self
                                                 selector:@selector(queryToLoad:error:)];
}

-(void)queryImagesEngineering:(id)object{
    //////////////////// Engineering & Technology
    NSLog(@">>>>>>>>>>>>>Engineering & Technology");
    PFQuery *pictureQueryEngineering = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryEngineering whereKey:@"Category" equalTo:@"Engineering & Technology"];
    [pictureQueryEngineering findObjectsInBackgroundWithTarget:self
                                                      selector:@selector(queryToLoad:error:)];
}

-(void)queryImagesBusiness:(id)object{
    //////////////////// Business & Information Systems
    NSLog(@">>>>>>>>>>>>>Business & Information Systems");
    PFQuery *pictureQueryBusiness = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryBusiness whereKey:@"Category" equalTo:@"Business & Information Systems"];
    [pictureQueryBusiness findObjectsInBackgroundWithTarget:self
                                                   selector:@selector(queryToLoad:error:)];
}
*/
@end
