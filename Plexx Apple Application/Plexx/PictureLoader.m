//
//  PictureLoader.m
//  Plexx
//
//  Created by Sheldon Trotman on 7/8/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "PictureLoader.h"
#import "WebImageOperations.h"

@implementation PictureLoader
//static int counter = 0;

- (id)init
{
    self = [super init];
    
    if (self)
    {
        
    }
    
    return self;
}

+(void) start{
    NSLog(@">>>>>>>>>>>>>>>>>>>Beginning");
    NSThread* myThreadArts = [[NSThread alloc] initWithTarget:self
                                                 selector:@selector(queryImagesArts:)
                                                   object:nil];

    NSThread* myThreadNatural = [[NSThread alloc] initWithTarget:self
                                                     selector:@selector(queryImagesNatural:)
                                                       object:nil];
    NSThread* myThreadHuman = [[NSThread alloc] initWithTarget:self
                                                     selector:@selector(queryImagesHuman:)
                                                       object:nil];
    NSThread* myThreadHealth = [[NSThread alloc] initWithTarget:self
                                                     selector:@selector(queryImagesHealth:)
                                                       object:nil];
    NSThread* myThreadEngineering = [[NSThread alloc] initWithTarget:self
                                                     selector:@selector(queryImagesEngineering:)
                                                       object:nil];
    NSThread* myThreadBusiness = [[NSThread alloc] initWithTarget:self
                                                     selector:@selector(queryImagesBusiness:)
                                                       object:nil];
    
    [myThreadArts start];  // Actually create the thread
    [myThreadNatural start];  // Actually create the thread
    [myThreadHuman start];  // Actually create the thread
    [myThreadHealth start];  // Actually create the thread
    [myThreadEngineering start];  // Actually create the thread
    [myThreadBusiness start];  // Actually create the thread
    
//    [self performSelectorInBackground:@selector(queryImagesArts:) withObject:nil];
//    [self performSelectorInBackground:@selector(queryImagesHuman:) withObject:nil];
//    [self performSelectorInBackground:@selector(queryImagesNatural:) withObject:nil];
//    [self performSelectorInBackground:@selector(queryImagesHealth:) withObject:nil];
//    [self performSelectorInBackground:@selector(queryImagesEngineering:) withObject:nil];
//    [self performSelectorInBackground:@selector(queryImagesBusiness:) withObject:nil];
}

/////////////////////////////////////////// Declare ///////////////////////////////////////////

static PictureLoader *instance = nil;

+ (PictureLoader *)getInstance
{
    
    @synchronized(self)
    {
        if (instance == nil)
        {
            instance = [[PictureLoader alloc] init];
        }
    }
    
    return instance;
}
//++++++++++++++++++++++ counter ++++++++++++++++++++++
static int counter = 0;

+ (int) counter
{
    @synchronized([PictureLoader class])
    {
        if (counter == 0)
        {
            counter = 0;
        }
    }
    return counter;
}

+ (void) setCounter:(int)newNumber
{
    @synchronized([PictureLoader class])
    {
        counter = newNumber;
    }
}

//++++++++++++++++++++++ pathPictureArray ++++++++++++++++++++++
static NSMutableArray* pathPictureArray = nil;

+ (NSMutableArray*) pathPictureArray
{
    @synchronized([PictureLoader class])
    {
        if (pathPictureArray == nil)
        {
            pathPictureArray = [[NSMutableArray alloc] init];
        }
    }
    return pathPictureArray;
}

+ (void) setPathPictureArray:(NSMutableArray *)newArray
{
    @synchronized([PictureLoader class])
    {
        pathPictureArray = [newArray mutableCopy];
    }
}

//++++++++++++++++++++++ pictureDictionary ++++++++++++++++++++++
static NSMutableDictionary* pictureDictionary = nil;

+ (NSMutableDictionary*) pictureDictionary
{
    @synchronized([PictureLoader class])
    {
        if (pictureDictionary == nil)
        {
            pictureDictionary = [[NSMutableDictionary alloc] init];
        }
    }
    return pictureDictionary;
}

+ (void) setPictureDictionary:(NSMutableDictionary *)newDic
{
    @synchronized([PictureLoader class])
    {
        pictureDictionary = [newDic mutableCopy];
    }
}
//++++++++++++++++++++++ loadedPicturesDictionary ++++++++++++++++++++++
static NSMutableDictionary* loadedPicturesDictionary = nil;

+ (NSMutableDictionary*) loadedPicturesDictionary
{
    @synchronized([PictureLoader class])
    {
        if (loadedPicturesDictionary == nil)
        {
            loadedPicturesDictionary = [[NSMutableDictionary alloc] init];
        }
    }
    return loadedPicturesDictionary;
}

+ (void) setLoadedPicturesDictionary:(NSMutableDictionary *)newDic
{
    @synchronized([PictureLoader class])
    {
        loadedPicturesDictionary = [newDic mutableCopy];
    }
}
//++++++++++++++++++++++ categoryMatcherDictionary ++++++++++++++++++++++
static NSMutableDictionary* categoryMatcherDictionary = nil;

+ (NSMutableDictionary*) categoryMatcherDictionary
{
    @synchronized([PictureLoader class])
    {
        if (categoryMatcherDictionary == nil)
        {
            categoryMatcherDictionary = [[NSMutableDictionary alloc] init];
        }
    }
    return categoryMatcherDictionary;
}

+ (void) setCategoryMatcherDictionary:(NSMutableDictionary *)newDic
{
    @synchronized([PictureLoader class])
    {
        categoryMatcherDictionary = [newDic mutableCopy];
    }
}

/////////////////////////////////////////// Methods ///////////////////////////////////////////
+(void)loadImages:(id)object
{
    NSLog(@"I'm running on a separate thread!");
    
    //pathPictureArray = [[NSMutableArray alloc] init];
    
    NSLog(@"length of picture %i", [[PictureLoader pathPictureArray] count]);
    
    for (int i = 0; i < [[PictureLoader pathPictureArray] count]; i++) {
        PFObject *specificObject = [[PictureLoader pathPictureArray] objectAtIndex:i];
        NSString *category = [specificObject valueForKey:@"Category"];
        if ([[PictureLoader pictureDictionary] valueForKey:category] != nil) {
            NSLog(@"***************** %i ) %@", i, category);
            // If the array already exists
            
            NSMutableArray *existingArrayOfImageLinks = [[NSMutableArray alloc] initWithArray:[[PictureLoader pictureDictionary] valueForKey:category]];
            
            NSString *stringURL = [NSString stringWithFormat:@"%@", [specificObject valueForKey:@"Image"]];
            
            //NSURL *url = [NSURL URLWithString:stringURL];//[pathPictureArray objectAtIndex:0]];//indexPath.row]];
            //NSData *data = [NSData dataWithContentsOfURL:url];
            //UIImage *tempImage = [[UIImage alloc] initWithData:data];
            
            //[newArrayOfImageLinks addObject:tempImage];
            
            [existingArrayOfImageLinks addObject:stringURL];
            
            [[PictureLoader pictureDictionary] setValue:existingArrayOfImageLinks forKey:category];
            
            
        } else{
            NSLog(@"uuuuuuuuuuuuuuuuuu %i ) %@", i, category);
            
            NSString *stringURL = [NSString stringWithFormat:@"%@", [specificObject valueForKey:@"Image"]];
            
            //NSURL *url = [NSURL URLWithString:stringURL];//[pathPictureArray objectAtIndex:0]];//indexPath.row]];
            //NSData *data = [NSData dataWithContentsOfURL:url];
            //UIImage *tempImage = [[UIImage alloc] initWithData:data];
            
            //[newArrayOfImageLinks addObject:tempImage];
            //NSArray *newArrayOfImageLinks = [[NSArray alloc] initWithObjects:tempImage, nil];
            
            NSArray *newArrayOfImageLinks = [[NSArray alloc] initWithObjects:stringURL, nil];
            
            [[PictureLoader pictureDictionary] setValue:newArrayOfImageLinks forKey:category];
            
            /////////////
            /*
             NSArray *newArrayOfImageLinks = [[NSArray alloc] initWithObjects:[specificObject valueForKey:@"Image"], nil];
             [pictureDictionary setValue:newArrayOfImageLinks forKey:category];
             */
        }
        
    }
    //okToUse = YES;
    //    NSLog(@"-------OK TO USE");
}

+(UIImage *)requestJobPicture:(NSString *)category optionalIndex:(NSInteger) opIndex{
    NSLog(@"<<<<<<< Request Picture");
    NSLog(@"length of picture %i", [[self pathPictureArray] count]);
    
    NSString *abstractedCategory = @"";
    //NSString *asd = [categoryMatcherDictionary valueForKey:@"Worker"];
    //NSLog(@"xxxxxxxxx %@", asd);
    
    if ([[PictureLoader categoryMatcherDictionary] valueForKey:category] != nil) {
        NSLog(@"There's an object set for key @\"b\"!");
        abstractedCategory = [[PictureLoader categoryMatcherDictionary] valueForKey:category];
    } else {
        abstractedCategory = category;
    }
    
    if ([[PictureLoader loadedPicturesDictionary] valueForKey:abstractedCategory] != nil && [[[PictureLoader loadedPicturesDictionary] valueForKey:abstractedCategory] count] > 0) {
        // Send Back a picture
        NSLog(@",,,,,,,,,,,,,,,,Actual Picture");
        
//        if ([[[PictureLoader loadedPicturesDictionary] valueForKey:abstractedCategory] count] > opIndex){
            
 //       }
      //  +(NSInteger) someRandomNumberWithBound: (int) bound location:(int)rawLoc{

//        int randomIndex = [PictureLoader someRandomNumber:[[[PictureLoader loadedPicturesDictionary] valueForKey:abstractedCategory] count]];
        int randomIndex = [PictureLoader someRandomNumberWithBound:[[[PictureLoader loadedPicturesDictionary] valueForKey:abstractedCategory] count] location:opIndex];
            
        return [[[PictureLoader loadedPicturesDictionary] valueForKey:abstractedCategory] objectAtIndex:randomIndex];
    }
    NSLog(@"..............Sent Basic Picture for: %@", abstractedCategory);
    NSString *filepath   =   [[NSBundle mainBundle] pathForResource:@"0.4_emptyPicture@2x" ofType:@"png"];
    NSURL    *fileURL    =   [NSURL fileURLWithPath:filepath];
    NSData *data = [NSData dataWithContentsOfURL:fileURL];
    UIImage *tempImage = [[UIImage alloc] initWithData:data];
    
    [self performSelectorInBackground:@selector(beginLoadPictureLoad:) withObject:category];
    
    return tempImage;
}

+(void) beginLoadPictureLoad:(NSString *) category{
    NSMutableArray *imageLinks = [[NSMutableArray alloc] initWithArray:[[PictureLoader pictureDictionary] valueForKey:category]];
    NSMutableArray *newArrayOfImageLinks = [[NSMutableArray alloc] init];
    NSLog(@"<><><><> Length of Image Links ( %i ) <><><><><> %@ ", [imageLinks count] ,category);
    for (int indexOfPicture = 0; indexOfPicture < [imageLinks count]; indexOfPicture++) {
        
        NSString *filepath   =   [imageLinks objectAtIndex:indexOfPicture];        
 //       NSURL *fileURL = [NSURL fileURLWithPath:filepath];
 //       NSData *data = [NSData dataWithContentsOfURL:fileURL];
 //       NSLog(@"....DATA ....%@", data);
        
        // Pass along the URL to the image (or change it if you are loading there locally)
        [WebImageOperations processImageDataWithURLString:filepath andBlock:^(NSData *imageData) {
          //  if (self.view.window) {
                //UIImage *image = [UIImage imageWithData:imageData];
                
                UIImage *tempImage = [[UIImage alloc] initWithData:imageData];
            if (imageData != NULL && tempImage != nil) {
                NSLog(@"..... %@  >> %@", category, filepath);
                [newArrayOfImageLinks addObject:tempImage];
                
            }
            
//                cell.photo.image = image;
            //}
            
        }];
        /*
        if (data != NULL) {
            NSLog(@".....");
            UIImage *tempImage = [[UIImage alloc] initWithData:data];
            [newArrayOfImageLinks addObject:tempImage];
            
        }
        */
    }
    [[self loadedPicturesDictionary] setObject:newArrayOfImageLinks forKey:category];
    
}

+(NSInteger) someRandomNumberWithBound: (int) bound location:(int)rawLoc{
    
    //   return

//    counter++;
    int photoPlaceIndex = rawLoc % bound;
    //    int randomNum = rand() % bound;
    return photoPlaceIndex;

//    return 0;
}

/////////////////////////////////////////// Query Begins ///////////////////////////////////////////
// First set up a callback.
+ (void)queryToLoad:(NSArray *)results error:(NSError *)error {
    if (!error) {
        // The find succeeded.
        NSLog(@"=========Successfully retrieved %d scores.===========", results.count);
        NSLog(@"iiiiiiiiiiiiiiiii %i", [[PictureLoader pathPictureArray] count]);
        //PictureLoader.pathPictureArray = [results mutableCopy];
        
        for (int num = 0; num < [results count]; num++) {
            [[PictureLoader pathPictureArray] addObject:[results objectAtIndex:num]];
            NSLog(@"mmmmmmmmmmmmmm %i", [[PictureLoader pathPictureArray] count]);
            
        }
        NSLog(@"ppppppppppppppppp %i", [[PictureLoader pathPictureArray] count]);
        if ([[PictureLoader pathPictureArray] count] == 72) {
            NSLog(@"wwwwwwwwwwwww GET STARTED");
            [self performSelectorInBackground:@selector(loadImages:) withObject:nil];
            
        }
         
        
    } else {
        // Log details of the failure
        NSLog(@"Error: %@ %@", error, [error userInfo]);
    }
}

+ (void)queryImagesArts:(id)object{
    //////////////////// Arts & Humanities
    NSLog(@">>>>>>>>>>>>>Arts & Humanities");
    PFQuery *pictureQueryArts = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryArts whereKey:@"Category" equalTo:@"Arts & Humanities"];
    [pictureQueryArts findObjectsInBackgroundWithTarget:self
                                               selector:@selector(queryToLoad:error:)];
}

+ (void)queryImagesHuman:(id)object{
    //////////////////// Human & Public Services
    NSLog(@">>>>>>>>>>>>>Human & Public Services");
    PFQuery *pictureQueryHuman = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryHuman whereKey:@"Category" equalTo:@"Human & Public Services"];
    [pictureQueryHuman findObjectsInBackgroundWithTarget:self
                                                selector:@selector(queryToLoad:error:)];
}

+ (void)queryImagesNatural:(id)object{
    //////////////////// Natural & Agricultural Services
    NSLog(@">>>>>>>>>>>>>Natural & Agricultural Services");
    PFQuery *pictureQueryNatural = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryNatural whereKey:@"Category" equalTo:@"Natural & Agricultural Services"];
    [pictureQueryNatural findObjectsInBackgroundWithTarget:self
                                                  selector:@selector(queryToLoad:error:)];
}

+ (void)queryImagesHealth:(id)object{
    //////////////////// Health Services
    NSLog(@">>>>>>>>>>>>>Health Services");
    PFQuery *pictureQueryHealth = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryHealth whereKey:@"Category" equalTo:@"Health Services"];
    [pictureQueryHealth findObjectsInBackgroundWithTarget:self
                                                 selector:@selector(queryToLoad:error:)];
}

+ (void)queryImagesEngineering:(id)object{
    //////////////////// Engineering & Technology
    NSLog(@">>>>>>>>>>>>>Engineering & Technology");
    PFQuery *pictureQueryEngineering = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryEngineering whereKey:@"Category" equalTo:@"Engineering & Technology"];
    [pictureQueryEngineering findObjectsInBackgroundWithTarget:self
                                                      selector:@selector(queryToLoad:error:)];
}

+ (void)queryImagesBusiness:(id)object{
    //////////////////// Business & Information Systems
    NSLog(@">>>>>>>>>>>>>Business & Information Systems");
    PFQuery *pictureQueryBusiness = [PFQuery queryWithClassName:@"cat_image"];
    [pictureQueryBusiness whereKey:@"Category" equalTo:@"Business & Information Systems"];
    [pictureQueryBusiness findObjectsInBackgroundWithTarget:self
                                                   selector:@selector(queryToLoad:error:)];
}

@end