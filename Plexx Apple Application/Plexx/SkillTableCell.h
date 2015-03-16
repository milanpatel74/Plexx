//
//  SkillTableCell.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

#import "SkillViewController.h"

@interface SkillTableCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *skillName;
@property (strong, nonatomic) IBOutlet UIButton *buttonAAttributes;
//@property (strong, nonatomic) IBOutlet UIButton *buttonBAttributes;
@property (strong, nonatomic) IBOutlet UILabel *authorOfSkill;
//@property (strong, nonatomic) IBOutlet UILabel *numberOfViews;
@property (strong, nonatomic) IBOutlet UIView *videoScreen;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@property (nonatomic) SkillViewController *parentViewController;
@property (nonatomic) NSString *link;
@property (nonatomic) PFObject *objectBacking;


- (void)playVideo:(NSString *)urlString frame:(CGRect)frame;
    
- (IBAction)buttonAAction:(id)sender;
//- (IBAction)buttonBAction:(id)sender;
@end
