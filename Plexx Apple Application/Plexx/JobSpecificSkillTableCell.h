//
//  JobSpecificSkillTableCell.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>
#import "SpecificJobViewController.h"

@interface JobSpecificSkillTableCell : PFTableViewCell

@property (strong, nonatomic) IBOutlet UILabel *skillName;
//@property (strong, nonatomic) IBOutlet UIImageView *skillImage;
//@property (strong, nonatomic) IBOutlet UIButton *buttonAAttributes;
//@property (strong, nonatomic) IBOutlet UIButton *buttonBAttributes;
@property (strong, nonatomic) IBOutlet UILabel *authorOfSkill;
@property (nonatomic) SpecificJobViewController *parentViewController;
@property (nonatomic) PFObject *objectBacking;


@property (nonatomic) NSString *link;

@property (strong, nonatomic) IBOutlet UIView *videoScreen;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@property (strong, nonatomic) IBOutlet UIButton *jobSkillButton;
- (IBAction)jobSkillButtonAction:(id)sender;

- (void)playVideo:(NSString *)urlString frame:(CGRect)frame;

//- (IBAction)buttonAAction:(id)sender;
//- (IBAction)buttonBAction:(id)sender;
/*
@property (strong, nonatomic) IBOutlet UILabel *skillNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *skillAuthorLabel;
@property (strong, nonatomic) IBOutlet UILabel *skillViewsLabel;


@property (strong, nonatomic) IBOutlet UIButton *buttonAAttributesButton;
- (IBAction)buttonAButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *buttonBAttributesButton;
- (IBAction)buttonBButton:(id)sender;

@property (strong, nonatomic) IBOutlet UIImageView *skillPreviewImage;

@property (nonatomic) BOOL *alreadyWatched;
*/
@end
