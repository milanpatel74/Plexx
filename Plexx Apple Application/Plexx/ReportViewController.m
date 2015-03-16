//
//  ReportViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/7/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "ReportViewController.h"

@interface ReportViewController ()

@end

@implementation ReportViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize reportPrompt;

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
    UIFont *UbuntuMid = [UIFont fontWithName:@"Ubuntu-Medium" size:20];

    [reportPrompt setFont:UbuntuMid];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
