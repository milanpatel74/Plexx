//
//  TermsAndCondViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/6/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TermsAndCondViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *plexxTitleLabel;
@property (strong, nonatomic) IBOutlet UITextView *termsTextField;
@property (strong, nonatomic) IBOutlet UIButton *backButtonAttributes;
- (IBAction)backButton:(id)sender;

@end
