//
//  OccupationTestViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "OccupationTestViewController.h"
#import "OccupationTestTableViewController.h"

#import "JobScreenViewController.h"

@interface OccupationTestViewController ()

@end

@implementation OccupationTestViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize plexxTitleLabel;
@synthesize dreamPromptText;

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
    [dreamPromptText setFont:UbuntuSmall];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (void)addItemViewController:(OccupationTestTableViewController *)controller didFinishEnteringItem:(NSString *)item
//{
  //  NSLog(@"This was returned from ViewControllerB %@",item);
//}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"connectionOccupation"]) {
        OccupationTestTableViewController * childViewController = (OccupationTestTableViewController *) [segue destinationViewController];
        //AlertView * alertView = childViewController.view;
        // do something here...
        
    }
}

- (IBAction)skipButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
    [self presentViewController:jobScreenViewController animated:YES completion:nil];
}

- (IBAction)continueWithSelectionsButton:(id)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    JobScreenViewController *jobScreenViewController = [storyboard instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
    [self presentViewController:jobScreenViewController animated:YES completion:nil];
}
@end
