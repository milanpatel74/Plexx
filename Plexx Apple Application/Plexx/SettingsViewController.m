//
//  SettingsViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 7/10/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "SettingsViewController.h"
#import "SettingsTableViewController.h"

#import "LogInViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize educationLevelViewContainer;
@synthesize dateOfBirthContainer;
@synthesize parentView;
@synthesize containerOfTable;

@synthesize maleSelected;
@synthesize screenStateForPickers;
@synthesize DateOfBirthPicker;
@synthesize datePickerAttributes;

@synthesize availibilityOfUserNameLabel;

@synthesize firstNameTextField;
@synthesize lastNameTextField;
@synthesize emailTextField;
@synthesize passwordTextField;
@synthesize confirmPasswordTextField;

@synthesize selectMaleButtonAttributes;
@synthesize selectFemaleButtonAttributes;
@synthesize educationLevelButtonAttributes;
@synthesize dateOfBirthButtonAttributes;
@synthesize signOutButtonAttributes;
@synthesize confirmButtonAttributes;

@synthesize backToLogInAttributes;
@synthesize plexxTitleAttributes;
@synthesize editAttributes;

//@synthesize educationToolBar;

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
    
    // Decides which screen is the major one
    // 1 is just main
    // 2 is date of birth picker is in control
    // 3 is education picker is in control
    PFUser *currUser = [PFUser currentUser];
    UIFont *UbuntuBig = [UIFont fontWithName:@"Ubuntu-Medium" size:30.f];
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    screenStateForPickers = 1;
    
    educationLevelPickerDataSource = [[NSMutableArray alloc] init];
    [educationLevelPickerDataSource addObject:@"Less than HS"];
    [educationLevelPickerDataSource addObject:@"HS / GED"];
    [educationLevelPickerDataSource addObject:@"Some College"];
    [educationLevelPickerDataSource addObject:@"Certificate"];
    [educationLevelPickerDataSource addObject:@"Associate"];
    [educationLevelPickerDataSource addObject:@"Bachelor"];
    [educationLevelPickerDataSource addObject:@"Master +"];
    
    [firstNameTextField setDelegate:(id)self];
    [firstNameTextField setFont:UbuntuSmall];
    NSString *firstNameString = [currUser valueForKey:@"firstName"];
  
//    if (![firstNameString isEqualToString:@""])

    if (!([firstNameString isEqualToString:@""] || firstNameString == NULL))
          [firstNameTextField setPlaceholder:firstNameString];

    
    [lastNameTextField setDelegate:(id)self];
    [lastNameTextField setFont:UbuntuSmall];
    NSString *lastNameString = [currUser valueForKey:@"lastName"];
//    if (![lastNameString isEqualToString:@""])
    if (!([lastNameString isEqualToString:@""] || lastNameString == NULL))
        [lastNameTextField setPlaceholder:lastNameString];
    
    [emailTextField setDelegate:(id)self];
    [emailTextField setFont:UbuntuSmall];
    NSString *emailString = [currUser valueForKey:@"email"];
//    if (![emailString isEqualToString:@""])
    if (!([emailString isEqualToString:@""] || emailString == NULL))        
        [emailTextField setPlaceholder:emailString];
    
    [passwordTextField setDelegate:(id)self];
    [passwordTextField setFont:UbuntuSmall];
    
    [confirmPasswordTextField setDelegate:(id)self];
    [confirmPasswordTextField setFont:UbuntuSmall];
    
    [[selectMaleButtonAttributes titleLabel] setFont:UbuntuSmall];
    [[selectFemaleButtonAttributes titleLabel] setFont:UbuntuSmall];
    
    NSString *genderString = [currUser valueForKey:@"gender"];
    
    if ([genderString isEqualToString:@"male"]){
        maleSelected = YES;
        UIColor *stockGray = [UIColor grayColor];
        
        [selectMaleButtonAttributes setBackgroundColor:stockGray];
        [selectMaleButtonAttributes setTitleColor:[UIColor whiteColor] forState:normal];
        
        [selectFemaleButtonAttributes setBackgroundColor:[UIColor clearColor]];
        [selectFemaleButtonAttributes setTitleColor:[UIColor lightGrayColor] forState:normal];

    }else if ([genderString isEqualToString:@"female"]){
        maleSelected = NO;
        UIColor *stockGray = [UIColor grayColor];
        
        [selectMaleButtonAttributes setBackgroundColor:[UIColor clearColor]];
        [selectMaleButtonAttributes setTitleColor:[UIColor lightGrayColor] forState:normal];
        
        [selectFemaleButtonAttributes setBackgroundColor:stockGray];
        [selectFemaleButtonAttributes setTitleColor:[UIColor whiteColor] forState:normal];

    }
    
    
    [[educationLevelButtonAttributes titleLabel] setFont:UbuntuSmall];
    NSString *educationLevelString = [currUser valueForKey:@"educationLevel"];
    if (!([educationLevelString isEqualToString:@""] || educationLevelString == NULL)){
        [educationLevelButtonAttributes setTitle:educationLevelString forState:normal];
    }
//    [educationLevelButtonAttributes setBackgroundColor:[UIColor yellowColor]];

    [[dateOfBirthButtonAttributes titleLabel] setFont:UbuntuSmall];
    NSString *dateOfBirthString = [currUser valueForKey:@"dateOfBirth"];
    if (!([dateOfBirthString isEqualToString:@""] || dateOfBirthString == NULL)){
        [dateOfBirthButtonAttributes setTitle:dateOfBirthString forState:normal];
    }
//    [dateOfBirthButtonAttributes setBackgroundColor:[UIColor yellowColor]];

    [[signOutButtonAttributes titleLabel] setFont:UbuntuBig];
    
    [[backToLogInAttributes titleLabel] setFont:UbuntuSmall];
    [editAttributes setFont:UbuntuSmall];
    [plexxTitleAttributes setFont:UbuntuBig];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:self.view.window];
    //   [EducationLevelPicker setDataSource:dataSource];
    
    [availibilityOfUserNameLabel setTextColor:[UIColor redColor]];
    [availibilityOfUserNameLabel setText:@"X"];
    [availibilityOfUserNameLabel setAlpha:0];
    // CGRect frameOfTable = CGRectMake(0, 0, 320, 320);
    
    //    [containerOfTable setFrame:frameOfTable];
    
    [DateOfBirthPicker addTarget:self action:@selector(dateDidChange:) forControlEvents:UIControlEventValueChanged];
}

-(void)dateDidChange:(id)sender{
    //////////////////////////////////////
    NSDate *date = DateOfBirthPicker.date;
    
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *dateString = [dateFormat stringFromDate:date];
    
    //NSLog(dateString);
    [dateOfBirthButtonAttributes setTitle:dateString forState:normal];
}

-(void)dismissKeyboard {
    //    NSLog(@"Hey");
    
    [firstNameTextField resignFirstResponder];
    [lastNameTextField resignFirstResponder];
    [emailTextField resignFirstResponder];
    [passwordTextField resignFirstResponder];
    [confirmPasswordTextField resignFirstResponder];
}
/*
 -(void)createToolbars
 {
 UIBarButtonItem *space = [[UIBarButtonItem alloc]
 initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
 target:nil action:nil];
 UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
 initWithTitle:@"Done" style:UIBarButtonItemStyleDone
 target:self action:@selector(hideEducationPicker)];
 NSArray *toolbarItems = [NSArray arrayWithObjects:
 space,doneButton, nil];
 UIToolbar *toolbar = [[UIToolbar alloc]initWithFrame:
 CGRectMake(0, -50, 320, 50)];
 
 [toolbar setBarStyle:UIBarStyleBlackTranslucent];
 [educationLevelViewContainer addSubview:toolbar];
 [toolbar setItems:toolbarItems];
 }
 */
- (void)keyboardWillShow:(NSNotification *)n {
    if (screenStateForPickers ==1){
        // do nothing everything is in place
    } else if(screenStateForPickers == 2){
        // date of birth is in control
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        dateOfBirthContainer.frame = CGRectMake(0, 548, 320, 260);
        [UIView commitAnimations];
        
    }else{
        // education level is in controll
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        educationLevelViewContainer.frame = CGRectMake(0, 548, 320, 260);
        [UIView commitAnimations];
    }
    screenStateForPickers = 1;
    
    [signOutButtonAttributes setUserInteractionEnabled:YES];
    [confirmButtonAttributes setUserInteractionEnabled:YES];
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
    
    return [educationLevelPickerDataSource count];
}


- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [educationLevelPickerDataSource objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    
    //NSLog(@"Selected Color: %@. Index of selected color: %i", [dataSource objectAtIndex:row], row);
    [educationLevelButtonAttributes setTitle:[educationLevelPickerDataSource objectAtIndex:row] forState:normal];
    
}

- (IBAction)backButton:(id)sender {
    if (screenStateForPickers == 1){
        // do nothing everything is in place
        
    } else if(screenStateForPickers == 2){
        // date of birth is in control
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        dateOfBirthContainer.frame = CGRectMake(0, 548, 320, 260);
        [UIView commitAnimations];
        
    }else{
        // education level is in controll
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        educationLevelViewContainer.frame = CGRectMake(0, 548, 320, 260);
        [UIView commitAnimations];
    }
    screenStateForPickers = 1;
    
    [signOutButtonAttributes setUserInteractionEnabled:YES];
    [confirmButtonAttributes setUserInteractionEnabled:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    //LogInViewController *logInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    //[self presentViewController:logInViewController animated:YES completion:nil];
    
}
/*
 - (void) tabBar:(UITabBar *) didSelectItem:(UITabBarItem *) item{
 NSLog([item title]);
 }
 */
/*
- (IBAction)signOutButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    LogInViewController *logInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
    [self presentViewController:logInViewController animated:YES completion:nil];
}
*/
- (IBAction)signOutButton:(id)sender {
//    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Save Changes" message:@"Save changes before you sign out?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: @"Yes", nil];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Continue Sign Out?" message:@"Changes will not save, continue?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: @"Yes", nil];
    
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
    }/*
    else{
        [PFUser logOut];
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
        
        LogInViewController *logInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
        [self presentViewController:logInViewController animated:YES completion:nil];
    }*/
}

- (IBAction)confirmSignUpButton:(id)sender {
    
    // Create the sign up infomation dictionary and store values
    PFUser *currUser = [PFUser currentUser];

    NSMutableDictionary *info = [NSMutableDictionary dictionary];
    
    NSString *firstNameString = [firstNameTextField text];
    if (!([firstNameString isEqualToString:@""] || firstNameString == NULL)){
        firstNameString = [currUser valueForKey:@"firstName"];

        [info setObject: firstNameString forKey: @"firstName"];
        
    }else{
        [info setObject: firstNameString forKey: @"firstName"];
    }
    
 //   NSString *lastNameString = [currUser valueForKey:@"lastName"];
    NSString *lastNameString = [lastNameTextField text];
    if (!([lastNameString isEqualToString:@""] || lastNameString == NULL)){
        lastNameString = [currUser valueForKey:@"lastName"];
        
        [info setObject: lastNameString forKey: @"lastName"];
        
    }else{
        [info setObject: lastNameString forKey: @"lastName"];
    }
    
//    [info setObject: [emailTextField text] forKey: @"email"];
    NSString *emailString = [emailTextField text];
    if (!([emailString isEqualToString:@""] || emailString == NULL)){
        emailString = [currUser valueForKey:@"email"];
        
        [info setObject: emailString forKey: @"email"];
        
    }else{
        [info setObject: emailString forKey: @"email"];
    }

    //[info setObject: [passwordTextField text] forKey: @"password"];
    NSString *passwordString = [passwordTextField text];
    if (!([passwordString isEqualToString:@""] || passwordString == NULL)){
        passwordString = [currUser valueForKey:@"password"];
        
        [info setObject: passwordString forKey: @"password"];
        
    }else{
        [info setObject: passwordString forKey: @"password"];
    }
    
    [info setObject: [[educationLevelButtonAttributes titleLabel] text] forKey:@"educationLevel"];
    
    if (maleSelected){
        [info setObject: @"male" forKey: @"gender"];
    }else{
        [info setObject: @"female" forKey: @"gender"];
    }
    
    
    
    if ([self checkSignUp:(id)self shouldBeginSignUp:info]) {
        
        /*
         [user setUsername:[info valueForKey:@"email"]];
         [user setPassword:[info valueForKey:@"password"]];
         [user setValue:[firstNameSignUpTextField text] forKey:@"FirstName"];
         [user setValue:[lastNameSignUpTextField text] forKey:@"LastName"];
         [user setValue:[hintSignUpTextField text] forKey:@"Hint"];
         [user setValue:[info valueForKey:@"Gendar"] forKey:@"Gendar"];
         */
        
        [currUser setUsername:[info valueForKey:@"email"]];
        [currUser setPassword:[info valueForKey:@"password"]];
        
        [currUser setValue: [info valueForKey:@"firstName"] forKey: @"firstName"];
        [currUser setValue: [info valueForKey:@"lastName"] forKey: @"lastName"];
        [currUser setValue: [info valueForKey:@"email"] forKey: @"email"];

        [currUser setValue: [info valueForKey:@"educationLevel"] forKey:@"educationLevel"];        
    
        [currUser setValue: [info valueForKey:@"gender"] forKey: @"gender"];
        
        [currUser saveInBackground];
        
        [self dismissViewControllerAnimated:YES completion:nil];
    }
    
}
/*
 - (void)hideEducationPicker {
 NSLog(@"Hello");
 [UIView beginAnimations:nil context:NULL];
 [UIView setAnimationDuration:0.3];
 educationLevelViewContainer.frame = CGRectMake(0, 548, 320, 260);
 [UIView commitAnimations];
 
 screenStateForPickers = 1;
 
 [termsOfServiceButtonAttributes setUserInteractionEnabled:YES];
 [confirmButtonAttributes setUserInteractionEnabled:YES];
 }
 */

- (IBAction)hideDatePicker:(id)sender {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    dateOfBirthContainer.frame = CGRectMake(0, 548, 320, 260);
    [UIView commitAnimations];
    
    screenStateForPickers = 1;
    
    //[termsOfServiceButtonAttributes setUserInteractionEnabled:YES];
    //[confirmButtonAttributes setUserInteractionEnabled:YES];
}

- (IBAction)hideEducationPicker:(id)sender {
    // NSLog(@"Hello");
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    educationLevelViewContainer.frame = CGRectMake(0, 548, 320, 260);
    [UIView commitAnimations];
    
    screenStateForPickers = 1;
    
    // [termsOfServiceButtonAttributes setUserInteractionEnabled:YES];
    //    [confirmButtonAttributes setUserInteractionEnabled:YES];
}

- (IBAction)educationLevelButton:(id)sender {
    [self dismissKeyboard];
    //[termsOfServiceButtonAttributes setUserInteractionEnabled:NO];
    //[confirmButtonAttributes setUserInteractionEnabled:NO];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    if (screenStateForPickers == 1){
        // main is in control
        
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            educationLevelViewContainer.frame = CGRectMake(0, 298, 320, 260);
            [UIView commitAnimations];
            
        } else {
            // code for 3.5-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            educationLevelViewContainer.frame = CGRectMake(0, 200, 320, 260);
            [UIView commitAnimations];
        }
        
    } else if(screenStateForPickers == 2){
        // date of birth is in control
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        dateOfBirthContainer.frame = CGRectMake(0, 548, 320, 260);
        [UIView commitAnimations];
        
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            //[UIView setAnimationDelay:0.3];
            educationLevelViewContainer.frame = CGRectMake(0, 298, 320, 260);
            [UIView commitAnimations];
            
        } else {
            // code for 3.5-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationDelay:0.3];
            educationLevelViewContainer.frame = CGRectMake(0, 200, 320, 260);
            [UIView commitAnimations];
        }
    }else{
        // education level is in control
        
    }
    
    screenStateForPickers = 3;
}

- (IBAction)dateOfBirthButton:(id)sender {
    [self dismissKeyboard];
    //[termsOfServiceButtonAttributes setUserInteractionEnabled:NO];
    //[confirmButtonAttributes setUserInteractionEnabled:NO];
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    if (screenStateForPickers == 1){
        // main is in control
        
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            dateOfBirthContainer.frame = CGRectMake(0, 298, 320, 260);
            [UIView commitAnimations];
            
        } else {
            // code for 3.5-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            dateOfBirthContainer.frame = CGRectMake(0, 200, 320, 260);
            [UIView commitAnimations];
        }
        
    } else if(screenStateForPickers == 2){
        // date of birth is in control
        
    }else{
        // education level is in control
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.3];
        educationLevelViewContainer.frame = CGRectMake(0, 548, 320, 260);
        [UIView commitAnimations];
        
        if (screenBounds.size.height == 568) {
            // code for 4-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            //[UIView setAnimationDelay:0.3];
            dateOfBirthContainer.frame = CGRectMake(0, 298, 320, 260);
            [UIView commitAnimations];
            
        } else {
            // code for 3.5-inch screen
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:0.3];
            [UIView setAnimationDelay:0.3];
            dateOfBirthContainer.frame = CGRectMake(0, 200, 320, 260);
            [UIView commitAnimations];
        }
    }
    
    screenStateForPickers = 2;
}

/*
 - (IBAction)dateOfBirthButton:(id)sender {
 [self dismissKeyboard];
 
 [UIView beginAnimations:nil context:NULL];
 [UIView setAnimationDuration:0.3];
 dateOfBirthViewContainer.frame = CGRectMake(0, 298, 320, 200);
 [UIView commitAnimations];
 }
 */

- (IBAction)selectMaleButton:(id)sender {
    maleSelected = YES;
    //  UIColor *plexxGray = [UIColor colorWithRed:223 green:223 blue:223 alpha:1];
    // UIColor *plexxGraydd = [UIColor colorWithRed:147 green:147 blue:147 alpha:1];
    UIColor *stockGray = [UIColor grayColor];
    
    [selectMaleButtonAttributes setBackgroundColor:stockGray];
    [selectMaleButtonAttributes setTitleColor:[UIColor whiteColor] forState:normal];

    [selectFemaleButtonAttributes setBackgroundColor:[UIColor clearColor]];
    [selectFemaleButtonAttributes setTitleColor:[UIColor lightGrayColor] forState:normal];
}

- (IBAction)selectFemaleButton:(id)sender {
    maleSelected = NO;
    //  UIColor *plexxGray = [UIColor colorWithRed:223 green:223 blue:223 alpha:1];
    
    //    UIColor *plexxGraydd = [UIColor colorWithRed:147 green:147 blue:147 alpha:1];
    
    UIColor *stockGray = [UIColor grayColor];
    
    [selectMaleButtonAttributes setBackgroundColor:[UIColor clearColor]];
    [selectMaleButtonAttributes setTitleColor:[UIColor lightGrayColor] forState:normal];

    [selectFemaleButtonAttributes setBackgroundColor:stockGray];
    [selectFemaleButtonAttributes setTitleColor:[UIColor whiteColor] forState:normal];
    
}

-(BOOL) checkSignUp:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    if (![[info valueForKey:@"password"]  isEqualToString:[info valueForKey:@"confirmPassword"]]){
        [[[UIAlertView alloc] initWithTitle:@"Check Passwords"
                                    message:@"Make sure the passwords match."
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
        
        return NO;
    }
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if ((!field || [field length] == 0)) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    BOOL userNameAvailable = YES;//[self checkUserNameField];
    if (!informationComplete) {
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information."
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    } else if(!userNameAvailable){
        [[[UIAlertView alloc] initWithTitle:@"Username Already Exists"
                                    message:@"Please choose a different username."
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
    }
    BOOL finalCheck = informationComplete && userNameAvailable;
    return finalCheck;
}

-(BOOL) checkUserNameField{
    
    PFQuery *query = [PFUser query];
    [query whereKey:@"username" equalTo:[emailTextField text]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"%i", [objects count]);
            if([objects count] == 1){
                [availibilityOfUserNameLabel setAlpha:1];
            }
            else{
                // No existing Users with this username
                [availibilityOfUserNameLabel setAlpha:0];
            }
        } else {
            
        }
    }];
    if ([availibilityOfUserNameLabel alpha] > 0.5) {
        return YES;
    }
    return NO;
}
@end