//
//  LearnSkillViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/1/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SkillSpecificViewController.h"

@interface LearnSkillViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITextView *descriptionLabel;

@property (nonatomic) SkillSpecificViewController *parentViewController;
@end
