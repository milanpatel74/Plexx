//
//  SpecificJobViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SpecificJobViewController : UIViewController

@property (nonatomic) PFObject *objectSupporting;
@property (nonatomic) NSInteger *currentScreen;

@property (strong, nonatomic) IBOutlet UILabel *jobCategoryLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *jobLocationLabel;
//@property (strong, nonatomic) IBOutlet UILabel *jobSalaryLabel;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UIView *trainView;
@property (strong, nonatomic) IBOutlet UIView *infoView;
@property (strong, nonatomic) IBOutlet UIView *applyView;
@property (strong, nonatomic) IBOutlet UIView *arrowMover;
//@property (strong, nonatomic) IBOutlet UIButton *removeJobButtonAttributes;
//@property (strong, nonatomic) IBOutlet UIButton *addJobButtonAttributes;

//- (IBAction)addJobButton:(id)sender;
//- (IBAction)removeJobButton:(id)sender;
- (IBAction)signOutButton:(id)sender;

- (IBAction)backButton:(id)sender;
//- (IBAction)profileButton:(id)sender;

- (IBAction)infoSkillsButton:(id)sender;
- (IBAction)trainSkillsButton:(id)sender;
- (IBAction)applySkillsButton:(id)sender;

-(void) pressedButtonOnCell:(PFObject *)objectChoice;

@end
