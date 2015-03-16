//
//  InfoSpecificJobViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/30/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "InfoSpecificJobViewController.h"

@interface InfoSpecificJobViewController ()

@end

@implementation InfoSpecificJobViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize parentViewController;
@synthesize descriptionOfJobTextField;
//@synthesize objectSupporting;

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
  //  NSString *descriptionString = [[parentViewController objectSupporting] valueForKey:@"snippet"];//[[parentViewController objectSupporting] valueForKey:@"description"];
      NSString *descriptionString = [[parentViewController objectSupporting] valueForKey:@"snippet"];
                                     
    
    NSString *location = [NSString stringWithFormat:@"Company: %@ \n \nLocation: %@, %@",  [[parentViewController objectSupporting] valueForKey:@"company"], [[parentViewController objectSupporting] valueForKey:@"city"], [[parentViewController objectSupporting] valueForKey:@"state"]];//, [[parentViewController objectSupporting] valueForKey:@"zipCode"]];
    
//    [[parentViewController objectSupporting] valueForKey:@"State"]
    
    //static NSDateFormatter *dateFormatter = nil;
    /*
    if (dateFormatter == nil) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.timeStyle = NSDateFormatterMediumStyle;
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
    }
    */
    NSDate *today = [[parentViewController objectSupporting] valueForKey:@"updatedAt"];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MM/dd/yyyy"];
    NSString *date = [dateFormat stringFromDate:today];
    
//    NSString *date = [[parentViewController objectSupporting] valueForKey:@"updatedAt"];
//    NSString *date = [dateFormatter dateFromString:[[parentViewController objectSupporting] valueForKey:@"updatedAt"]];
    
    NSString *togetherString = [NSString stringWithFormat: @"Description \n%@ \n \n Date Posted: %@ \n \n %@", location, date, descriptionString];
    
    UIFont *UbuntuSmall = [UIFont fontWithName:@"Ubuntu-Medium" size:15];
    
    [descriptionOfJobTextField setFont:UbuntuSmall];
    [descriptionOfJobTextField setText:togetherString];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
