//
//  WebImageOperations.h
//  Plexx
//
//  Created by Sheldon Trotman on 7/9/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WebImageOperations : NSObject {
}

// This takes in a string and imagedata object and returns imagedata processed on a background thread
+ (void)processImageDataWithURLString:(NSString *)urlString andBlock:(void (^)(NSData *imageData))processImage;
@end