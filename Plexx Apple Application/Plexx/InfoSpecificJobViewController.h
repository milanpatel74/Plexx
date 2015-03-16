//
//  InfoSpecificJobViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/30/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SpecificJobViewController.h"

@interface InfoSpecificJobViewController : UIViewController
@property (nonatomic) SpecificJobViewController *parentViewController;
@property (strong, nonatomic) IBOutlet UITextView *descriptionOfJobTextField;
//@property (nonatomic) PFObject *objectSupporting;

@end
