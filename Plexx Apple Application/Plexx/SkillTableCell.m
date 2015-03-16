//
//  SkillTableCell.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "SkillTableCell.h"

@implementation SkillTableCell
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize videoScreen;
@synthesize moviePlayerController;
@synthesize link;
@synthesize parentViewController;
@synthesize objectBacking;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        

    }
    return self;
}

- (void)viewDidLoad
{
	// Do any additional setup after loading the view.
 
}

- (void)playVideo:(NSString *)urlString frame:(CGRect)frame
{
    NSString *embedHTML = @"\
    <html><head>\
    <style type=\"text/css\">\
    body {\
    background-color: transparent;\
    color: white;\
    }\
    </style>\
    </head><body style=\"margin:0\">\
    <embed id=\"yt\" src=\"%@\" type=\"application/x-shockwave-flash\" \
    width=\"%0.0f\" height=\"%0.0f\"></embed>\
    </body></html>";
    NSString *html = [NSString stringWithFormat:embedHTML, urlString, frame.size.width, frame.size.height];
    UIWebView *videoView = [[UIWebView alloc] initWithFrame:frame];
    
    // WORKING FOR FULL
    [videoView loadHTMLString:html baseURL:nil];
    [videoScreen addSubview:videoView];
    /*
     NSURL    *fileURL    =   [NSURL fileURLWithPath:html];
     
     moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(moviePlaybackComplete:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:moviePlayerController];
     //[self.view addSubview:moviePlayerController.view];
     //moviePlayerController.fullscreen = YES;
     //[moviePlayerController play];
     [moviePlayerController.view setFrame:frame];
     [self.view addSubview:moviePlayerController.view];
     //moviePlayerController.fullscreen = YES;
     [moviePlayerController play];
     */
    
    //player.view.frame = CGRectMake(184, 200, 400, 300);
    //[self.view addSubview:player.view];
    //[player play];
    
    //videoScreen.frame = CGRectMake(184, 200, 400, 300);
    //[self.view addSubview:videoScreen];
    //[videoScreen play];
    
    
    //[videoView release];
    //NSLog(@"%@",html);
}
/*
 NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"test" ofType:@"mov"];
 NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
 
 // Use this code to  make it go full screen
 //MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
 moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
 [[NSNotificationCenter defaultCenter] addObserver:self
 selector:@selector(moviePlaybackComplete:)
 name:MPMoviePlayerPlaybackDidFinishNotification
 object:moviePlayerController];
 //[self.view addSubview:moviePlayerController.view];
 //moviePlayerController.fullscreen = YES;
 //[moviePlayerController play];
 [moviePlayerController.view setFrame:CGRectMake(38, 100, 250, 163)];
 [self.view addSubview:moviePlayerController.view];
 //moviePlayerController.fullscreen = YES;
 [moviePlayerController play];
 */
- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    [moviePlayerController.view removeFromSuperview];
    //   [moviePlayerController release];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)buttonAAction:(id)sender {
    [parentViewController pressedButtonOnCell:objectBacking];
}

//- (IBAction)buttonBAction:(id)sender {
//}
@end
