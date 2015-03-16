//
//  ViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 5/18/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "ViewController.h"
#import "LogInViewController.h"
#import "ProfileViewController.h"
#import "JobScreenViewController.h"
#import "PictureLoader.h"

@interface ViewController ()

@end

//static NSMutableArray *pathPictureArray;
//static NSMutableDictionary *loadedPicturesDictionary;
//static NSMutableDictionary *pictureDictionary;
//static NSMutableDictionary *categoryMatcherDictionary;

//static int counter;

@implementation ViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

static ViewController *instance =nil;
+(ViewController *)getInstance
{
    @synchronized(self)
    {
        if(instance==nil)
        {
            
            instance= [ViewController new];
        }
    }
    return instance;
}

/*
+ (void)initialize // this method is called *once* for every class, before it is used for the first time (not necessarily when the app is first launched)
{
    [super initialize];
    
    pathPictureArray = [[NSMutableArray alloc] init];
    pictureDictionary = [[NSMutableDictionary alloc] init];
    loadedPicturesDictionary = [[NSMutableDictionary alloc] init];
    categoryMatcherDictionary = [[NSMutableDictionary alloc] init];
}

+ (NSMutableArray *)pathPictureArray
{
    return pathPictureArray;
}

+ (NSMutableDictionary *)pictureDictionary
{
    return pictureDictionary;
}

+ (NSMutableDictionary *)loadedPicturesDictionary
{
    return loadedPicturesDictionary;
}

+ (NSMutableDictionary *)categoryMatcherDictionary
{
    return categoryMatcherDictionary;
}
*/
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    //[categoryMatcherDictionary setValue:@"Worker" forKey:@"ARTS"];
    NSLog(@"000000000000000000000");
    
//    [[self categoryMatcherDictionary] setValue:@"ARTS" forKey:@"Worker"];

}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:(BOOL)animated];
    [PictureLoader start];
    // after the view appears
    
//    counter = 0;

    NSLog(@"dfdfdsfdsf");
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone" bundle:nil];
    
    
    if ([PFUser currentUser]) {        // Current user
        NSLog(@"Logged In!");
        //Go straight to the users profile
        JobScreenViewController *jobScreenViewController = [storyboard     instantiateViewControllerWithIdentifier:@"JobScreenViewController"];
            [self presentViewController:jobScreenViewController animated:NO completion:nil];
            
    } else {
        NSLog(@"There is no user logged in.");
        LogInViewController *logInViewController = [storyboard instantiateViewControllerWithIdentifier:@"LogInViewController"];
        [self presentViewController:logInViewController animated:NO completion:nil];
        
    }
}


/*
// First set up a callback.
- (void)queryToLoadA:(NSArray *)results error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"=========Successfully retrieved %d scores.===========", results.count);
        NSLog(@"iiiiiiiiiiiiiiiii %i", [pathPictureArray count]);
        for (int num = 0; num < [results count]; num++) {
            [pathPictureArray addObject:[results objectAtIndex:num]];
            NSLog(@"mmmmmmmmmmmmmm %i", [pathPictureArray count]);

        }
        NSLog(@"ppppppppppppppppp %i", [pathPictureArray count]);

    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
}

////////////////////////////////////////////////////////////////////

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
 */
////////////////////////////////////////////////////////////////////
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
