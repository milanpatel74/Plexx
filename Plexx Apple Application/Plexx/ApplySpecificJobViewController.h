//
//  ApplySpecificJobViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/30/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecificJobViewController.h"

@interface ApplySpecificJobViewController : UIViewController
@property (nonatomic) SpecificJobViewController *parentViewController;


- (IBAction)callButton:(id)sender;
- (IBAction)visitButton:(id)sender;
- (IBAction)emailButton:(id)sender;

@end
