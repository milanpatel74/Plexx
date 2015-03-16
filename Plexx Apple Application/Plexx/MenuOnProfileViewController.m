//
//  MenuOnProfileViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/31/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "MenuOnProfileViewController.h"

@interface MenuOnProfileViewController ()

@end

@implementation MenuOnProfileViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize parentViewController;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 8;
}


#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Disabled Selection of table
}

- (IBAction)profileButton:(id)sender {
    
    [parentViewController menuChoice:0];
}

- (IBAction)jobsButton:(id)sender {
    [parentViewController menuChoice:1];
}

- (IBAction)skillsButton:(id)sender {
    [parentViewController menuChoice:2];
}

- (IBAction)aboutPlexxButton:(id)sender {
    [parentViewController menuChoice:3];
}

- (IBAction)privacyPolicyButton:(id)sender {
    [parentViewController menuChoice:4];
}

- (IBAction)reportBugButton:(id)sender {
    [parentViewController menuChoice:5];
}
@end