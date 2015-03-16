//
//  SkillSpecificViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/29/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface SkillSpecificViewController : UIViewController
@property (nonatomic) PFObject *objectSupporting;
@property (nonatomic) NSInteger *currentScreen;
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *skillName;

@property (strong, nonatomic) IBOutlet UILabel *skillAuthor;

@property (strong, nonatomic) IBOutlet UIView *learnView;
@property (strong, nonatomic) IBOutlet UIView *trainView;
@property (strong, nonatomic) IBOutlet UIView *relatedView;
@property (strong, nonatomic) IBOutlet UIView *arrowMover;
@property (strong, nonatomic) IBOutlet UIButton *learnSkillAttributes;
@property (strong, nonatomic) IBOutlet UIButton *trainSkillAttributes;
@property (strong, nonatomic) IBOutlet UIButton *reportSkillAttributes;

//@property (strong, nonatomic) IBOutlet UIButton *removeSkillButtonAttributes;
//@property (strong, nonatomic) IBOutlet UIButton *addSkillButtonAttributes;
- (IBAction)signOutButton:(id)sender;

//- (IBAction)addSkillButton:(id)sender;
//- (IBAction)removeSkillButton:(id)sender;

- (IBAction)backButton:(id)sender;
//- (IBAction)profileButton:(id)sender;

- (IBAction)learnSkillsButton:(id)sender;
- (IBAction)trainSkillsButton:(id)sender;
- (IBAction)relatedSkillsButton:(id)sender;


@end
