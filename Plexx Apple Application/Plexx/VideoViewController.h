//
//  VideoViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 5/19/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface VideoViewController : UIViewController

-(IBAction)playMovie:(id)sender;
//@property (strong, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayerController;
@end
