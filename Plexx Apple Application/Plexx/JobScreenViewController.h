//
//  JobScreenViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
//#import "JobScreenTableViewController.h"

/*
 @interface JobScreenViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
 
 IBOutlet UIPickerView *EducationLevelPicker;
 
 
 NSMutableArray *educationLevelPickerDataSource;
 }
 @property (strong, nonatomic) IBOutlet UIDatePicker *datePickerAttributes;
 @property (nonatomic, retain) UIDatePicker *DateOfBirthPicker;
 @property (strong, nonatomic) IBOutlet UIView *containerOfTable;
 
 
 
*/
@interface JobScreenViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    
    IBOutlet UIPickerView *CategoryPicker;
    
    
    NSMutableArray *categoryPickerDataSource;
}
- (IBAction)signOutButton:(id)sender;
- (IBAction)hideCategoryPicker:(id)sender;
- (IBAction)menuButton:(id)sender;
- (IBAction)categorySpecifierButton:(id)sender;
- (IBAction)closeMenuButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *allJobsAttributes;

@property (strong, nonatomic) IBOutlet UIView *menuView;
@property (strong, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIView *disablingScreenView;
@property (strong, nonatomic) IBOutlet UIView *containerOfPicker;

@property (nonatomic) BOOL menuClose;

//@property (nonatomic) JobScreenTableViewController * childJobViewController;
//@property (nonatomic) NSString *categoryFilter;

@property (strong, nonatomic) IBOutlet UILabel *jobsTitleAttributes;

-(void) selectionMade:(PFObject *)choice;
-(void) menuChoice:(int *)indexInMenu;

@property (strong, nonatomic) IBOutlet UIView *ArtsViewContainer;
@property (strong, nonatomic) IBOutlet UIView *HumanViewContainer;
@property (strong, nonatomic) IBOutlet UIView *NaturalViewContainer;
@property (strong, nonatomic) IBOutlet UIView *HealthViewContainer;
@property (strong, nonatomic) IBOutlet UIView *EngineeringViewContainer;
@property (strong, nonatomic) IBOutlet UIView *BusinessViewContainer;

@end
