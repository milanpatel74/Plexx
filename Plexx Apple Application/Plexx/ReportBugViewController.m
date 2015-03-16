//
//  ReportBugViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "ReportBugViewController.h"

@interface ReportBugViewController ()

@end

@implementation ReportBugViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize bugReportTextField;
@synthesize plexxTitleLabel;

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
    
    UIFont *UbuntuBig = [UIFont fontWithName:@"Ubuntu-Medium" size:30.f];
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    [plexxTitleLabel setFont:UbuntuBig];
    [bugReportTextField setFont:UbuntuSmall];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(dismissKeyboard)];
    [self.view addGestureRecognizer:tap];
}

-(void)dismissKeyboard {
    [bugReportTextField resignFirstResponder];    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)nevermindButton:(id)sender {

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sign Out" message:@"Are you sure you want to sign out?" delegate:self cancelButtonTitle:@"No" otherButtonTitles: @"Yes", nil];
 
    [self dismissViewControllerAnimated:YES completion:nil];
    //[alertView setAlertViewStyle:UIAlertViewStyleDefault];
    //[alertView show];

 }
 /*
 - (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
 {
     NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
     if([title isEqualToString:@"Yes"])
     {
         [self dismissViewControllerAnimated:YES completion:nil];
     }
 }
 */

- (IBAction)sendButton:(id)sender {
    PFUser *currUser = [PFUser currentUser];

    PFObject *bugReport = [PFObject objectWithClassName:@"ReportBug"];
    [bugReport setObject:[currUser valueForKey:@"objectId"] forKey:@"userID"];
    [bugReport setObject:[bugReportTextField text] forKey:@"report"];
    [bugReport saveInBackground];
    
    [[[UIAlertView alloc] initWithTitle:@"Bug Sent!" message:@"Thank you for your suggestion we will take a look at the issue" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil , nil] show];

    
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
