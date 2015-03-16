//
//  TrainSkillViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/29/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "TrainSkillViewController.h"
#import "QuestionDisplayViewController.h"

@interface TrainSkillViewController ()

@end

@implementation TrainSkillViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize videoScreen;
@synthesize moviePlayerController;
@synthesize parentViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[paren]
    //objectSupporting
    NSMutableString *linkPrior = [NSMutableString stringWithFormat:@"%@",[[parentViewController objectSupporting] valueForKey:@"Link"]];
    /*
    NSMutableString *linkPrior = [NSMutableString stringWithFormat:@"%@", object[@"Link"]];
    */
    NSString* newString = [linkPrior stringByReplacingOccurrencesOfString:@"watch?"
                                                               withString:@""];
    
    NSMutableString *mute = [NSMutableString stringWithFormat:@"%@", newString];
    
    NSString* finalLink = [mute stringByReplacingOccurrencesOfString:@"="
                                                          withString:@"/"];
    
    //[self playVideo:@"http://www.youtube.com/v/WL2l_Q1AR_Q" frame:CGRectMake(0, 0, 320, 180)];
    
    [self playVideo:finalLink frame:CGRectMake(0, 0, 320, 150)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// connectionToQuestions
- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString * segueName = segue.identifier;
    if ([segueName isEqualToString: @"connectionToQuestions"]) {
        QuestionDisplayViewController * childViewController = (QuestionDisplayViewController *) [segue destinationViewController];
        
        childViewController.questionsArray = [[parentViewController objectSupporting] valueForKey:@"questions"];
        childViewController.answersArray = [[parentViewController objectSupporting] valueForKey:@"answers"];
    }
    
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
@end
