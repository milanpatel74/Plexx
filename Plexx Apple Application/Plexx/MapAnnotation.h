//
//  MapAnnotation.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/1/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>
#import <Parse/Parse.h>


@interface MapAnnotation : NSObject <MKAnnotation>
{
    CLLocationCoordinate2D coordinate;
    NSString *title;
    NSString *subtitle;
}

- (id)initWithObject:(PFObject *)aObject;

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;


//@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
//@property (nonatomic, retain) NSString *title;
//@property (nonatomic, readonly, copy) NSString *subtitle;
//@property (nonatomic) UIPopoverController *annotationPopoverController;

@end