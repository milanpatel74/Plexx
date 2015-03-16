//
//  TrainSkillViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/29/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

#import "SkillSpecificViewController.h"

@interface TrainSkillViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIView *videoScreen;

@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;

@property (nonatomic) SkillSpecificViewController *parentViewController;
@end
