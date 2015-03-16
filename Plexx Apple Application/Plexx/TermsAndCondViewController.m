//
//  TermsAndCondViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "TermsAndCondViewController.h"

@interface TermsAndCondViewController ()

@end

@implementation TermsAndCondViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize plexxTitleLabel;
@synthesize termsTextField;
@synthesize backButtonAttributes;


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
    [[backButtonAttributes titleLabel] setFont:UbuntuSmall];
    
    [termsTextField setEditable:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
