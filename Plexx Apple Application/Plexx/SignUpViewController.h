//
//  SignUpViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUpViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UIPickerView *EducationLevelPicker;

    IBOutlet UIDatePicker *DateOfBirthPicker;
    
    NSMutableArray *educationLevelPickerDataSource;
//    IBOutlet UIToolbar *educationToolBar;
}
@property (strong, nonatomic) IBOutlet UIDatePicker *datePickerAttributes;
@property (nonatomic, retain) UIDatePicker *DateOfBirthPicker;
@property (strong, nonatomic) IBOutlet UIView *containerOfTable;

//@property (strong, nonatomic) IBOutlet UIToolbar *educationToolBar;
@property (strong, nonatomic) IBOutlet UIButton *backToLogInAttributes;
@property (strong, nonatomic) IBOutlet UILabel *plexxTitleAttributes;
@property (strong, nonatomic) IBOutlet UILabel *joinUsAttributes;

@property (nonatomic) BOOL *maleSelected;
@property (nonatomic) NSInteger *screenStateForPickers;

@property (strong, nonatomic) IBOutlet UILabel *availibilityOfUserNameLabel;

- (IBAction)backButton:(id)sender;
- (IBAction)termsOfServiceButton:(id)sender;
- (IBAction)confirmSignUpButton:(id)sender;

//- (IBAction)hideEducationPicker:(id)sender;
- (IBAction)hideDatePicker:(id)sender;
- (IBAction)hideEducationPicker:(id)sender;


- (IBAction)educationLevelButton:(id)sender;
- (IBAction)dateOfBirthButton:(id)sender;
- (IBAction)selectMaleButton:(id)sender;
- (IBAction)selectFemaleButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIView *parentView;

@property (strong, nonatomic) IBOutlet UIView *educationLevelViewContainer;
@property (strong, nonatomic) IBOutlet UIView *dateOfBirthContainer;

@property (strong, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *confirmPasswordTextField;

@property (strong, nonatomic) IBOutlet UIButton *selectMaleButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *selectFemaleButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *educationLevelButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *dateOfBirthButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *termsOfServiceButtonAttributes;
@property (strong, nonatomic) IBOutlet UIButton *confirmButtonAttributes;

@end
