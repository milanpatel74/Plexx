//
//  VideoViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/19/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "VideoViewController.h"

@interface VideoViewController ()

@end

@implementation VideoViewController
@synthesize moviePlayerController;
//@synthesize videoView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
 MPMoviePlayerController *player = [[MPMoviePlayerController alloc] initWithContentURL:[NSURL fileURLWithPath:url]];
 player.view.frame = CGRectMake(184, 200, 400, 300);
 [self.view addSubview:player.view];
 [player play];
 */

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}/*
- (void)embedYouTube:(NSString*)url frame:(CGRect)frame {
    NSString* embedHTML = @"\
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
    NSString* html = [NSString stringWithFormat:embedHTML, url, frame.size.width, frame.size.height];
    if(videoView == nil) {
        videoView = [[UIWebView alloc] initWithFrame:frame];
        [self.view addSubview:videoView];
    }
  //  [videoView loadHTMLString:html baseURL:nil];
}
*/
-(IBAction)playMovie:(id)sender
{
    //NSString *website = @"http://www.youtube.com/watch?feature=player_detailpage&v=YcNOapwgw6I";
   // NSURL *fileURL = [NSURL URLWithString: website];
    
    // Use this to make the 
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
    
    /*
     MPMoviePlayerController *moviePlayerController = [[MPMoviePlayerController alloc] initWithContentURL:fileURL];
     [[NSNotificationCenter defaultCenter] addObserver:self
     selector:@selector(moviePlaybackComplete:)
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:moviePlayerController];
     [self.view addSubview:moviePlayerController.view];
     moviePlayerController.fullscreen = YES;
     [moviePlayerController play];
     */
    //player.view.frame = CGRectMake(184, 200, 400, 300);
   // [self.view addSubview:player.view];
  //  [moviePlayerController play];
}

- (void)moviePlaybackComplete:(NSNotification *)notification
{
    MPMoviePlayerController *moviePlayerController = [notification object];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:MPMoviePlayerPlaybackDidFinishNotification
                                                  object:moviePlayerController];
    [moviePlayerController.view removeFromSuperview];
 //   [moviePlayerController release];
}
@end
///////////////////////////////////////////////////
/*
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
 [videoView loadHTMLString:html baseURL:nil];
 [self.view addSubview:videoView];
 //[videoView release];
 NSLog(@"%@",html);
 }
 
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 // Do any additional setup after loading the view.
 [self playVideo:@"http://www.youtube.com/v/WL2l_Q1AR_Q" frame:CGRectMake(20, 70, 280, 250)];
 
 //    [self embedYouTube:@"http://www.youtube.com/watch?v=x4dxy46Ju7Q" frame:CGRectMake(20, 20, 100, 100)];
 
 }
 @end
 */
