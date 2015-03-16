//
//  FacebookLoginViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/29/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "FacebookLoginViewController.h"

@interface FacebookLoginViewController ()

@end

@implementation FacebookLoginViewController
@synthesize facebookWebPage;

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
    NSString *website = @"http://www.facebook.com";
    NSURL *url = [NSURL URLWithString: website];
    NSURLRequest *request = [NSURLRequest requestWithURL: url];
    
    [facebookWebPage loadRequest:request];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backToPlex:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
