//
//  ProfileViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ProfileViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *profilePictureImageView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *shownProfession;
@property (strong, nonatomic) IBOutlet UILabel *otherInformationLabel;

@property (strong, nonatomic) IBOutlet UIButton *jobAttributesButton;
- (IBAction)jobButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *skillsAttributesButton;
- (IBAction)skillsButton:(id)sender;


@property (strong, nonatomic) IBOutlet UIButton *pathwaysAttributesButton;
- (IBAction)pathwaysButton:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *skillsViewContainer;
@property (strong, nonatomic) IBOutlet UIView *jobsViewContainer;
@property (strong, nonatomic) IBOutlet UIView *pathwaysViewContainer;
@property (strong, nonatomic) IBOutlet UIView *arrowMover;

@property (nonatomic) int currentScreen;

- (IBAction)closeMenuButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIView *disablingScreenView;

@property (nonatomic) BOOL *menuClose;
- (IBAction)menuButton:(id)sender;

- (IBAction)signOutButton:(id)sender;
- (void) selectionMade:(NSString *)choice;
-(void) menuChoice:(int *)indexInMenu;
@end
