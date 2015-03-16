//
//  PictureLoader.h
//  Plexx
//
//  Created by Sheldon Trotman on 7/8/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface PictureLoader : NSObject
{
//    NSMutableArray *pathPictureArray;
//    NSMutableDictionary *pictureDictionary;
//    NSMutableDictionary *loadedPicturesDictionary;
//    NSMutableDictionary *categoryMatcherDictionary;
//    int counter;
}
//@property (nonatomic) int *counter;


+(void) start;
+ (PictureLoader *)getInstance;
//+ (UIImage *)requestJobPicture:(NSString *)category;
+ (UIImage *)requestJobPicture:(NSString *)category optionalIndex:(NSInteger) opIndex;

//@property (nonatomic, retain) NSMutableArray *pathPictureArray;
//@property (nonatomic, retain) NSMutableDictionary *pictureDictionary;
//@property (nonatomic, retain) NSMutableDictionary *loadedPicturesDictionary;
//@property (nonatomic, retain) NSMutableDictionary *categoryMatcherDictionary;
//+ (int)counter;


+ (NSMutableArray *)pathPictureArray;
+ (NSMutableDictionary *)pictureDictionary;
+ (NSMutableDictionary *)loadedPicturesDictionary;
+ (NSMutableDictionary *)categoryMatcherDictionary;

@end