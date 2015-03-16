//
//  LearnSkillViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/1/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "LearnSkillViewController.h"

@interface LearnSkillViewController ()

@end

@implementation LearnSkillViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize descriptionLabel;
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
    
    //[paren]
    //objectSupporting
    NSString *desciptionText = [[parentViewController objectSupporting] valueForKey:@"Description"];
    
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    [descriptionLabel setFont:UbuntuSmall];

    [descriptionLabel setText:[NSString stringWithFormat:@"Description\n%@", desciptionText]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
