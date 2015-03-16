//
//  SkillViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SkillViewController : UIViewController
- (IBAction)menuButton:(id)sender;
//- (IBAction)profileButton:(id)sender;
- (IBAction)specifierButton:(id)sender;
- (IBAction)disablingViewButton:(id)sender;
- (IBAction)signOutButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *specifierButtonAttributes;
//@property (strong, nonatomic) IBOutlet UIView *moverView;
@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIView *disablingScreenView;

@property (strong, nonatomic) IBOutlet UILabel *allSkillsAttributes;
@property (nonatomic) BOOL *menuClose;

-(void) pressedButtonOnCell:(NSObject *)objectChoice;
/*
/////////////
@property (strong, nonatomic) IBOutlet UILabel *skillNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *skillNameDescription;
@property (strong, nonatomic) IBOutlet UILabel *screenCategoryLabel;

- (IBAction)reportSkillsButton:(id)sender;
- (IBAction)summaryOfQuestionsButton:(id)sender;
- (IBAction)resourcesButton:(id)sender;

-(void) menuChoice:(int *)indexInMenu;

*/
@end
