//
//  JobCentersViewController.h
//  Plexx
//
//  Created by Sheldon Trotman on 6/1/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>


@interface JobCentersViewController : UIViewController <MKMapViewDelegate>
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
//- (void)setInitialLocation:(CLLocation *)aLocation;

@end
