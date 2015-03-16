//
//  ApplySpecificJobViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/30/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "ApplySpecificJobViewController.h"

@interface ApplySpecificJobViewController ()

@end

@implementation ApplySpecificJobViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize parentViewController;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)callButton:(id)sender {
    NSString *phoneNumber = [[parentViewController objectSupporting] valueForKey:@"phoneNumber"];

    NSString *cleanedString = [[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
    NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", cleanedString]];
}

- (IBAction)visitButton:(id)sender {
}

- (IBAction)emailButton:(id)sender {
}
@end
