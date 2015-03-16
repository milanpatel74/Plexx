//
//  LogInTableViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)emailChangeListener:(id)sender;
- (IBAction)passwordChangeListener:(id)sender;

@property (strong, nonatomic) NSString *emailTextValue;
@property (strong, nonatomic) NSString *passwordTextValue;

@end
