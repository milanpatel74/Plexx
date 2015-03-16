//
//  MapAnnotation.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/1/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "MapAnnotation.h"

@interface MapAnnotation()
@property (nonatomic, strong) PFObject *object;
@end

@implementation MapAnnotation
@synthesize coordinate;
@synthesize title;
@synthesize subtitle;

#pragma mark - Initialization
- (id)initWithObject:(PFObject *)aObject {
    self = [super init];
    if (self) {
        _object = aObject;
        
        PFGeoPoint *geoPoint = [self.object valueForKey:@"coordinates"];// = self.object[@"Location"];
        
        //NSString *addressString = [[NSString alloc] ];
        NSString *addressString = [NSString stringWithFormat:@"%@ %@ %@ %@",  self.object[@"streetAddress"],  self.object[@"City"],  self.object[@"State"],  self.object[@"zipCode"]];
        ////////
        NSLog(addressString);
        //[geoPoint setLongitude:[self.sobject valueForKey:<#(NSString *)#>] //.longitude];
        //[geoPoint setLatitude:placemark.region.center.latitude];
        /*
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        
        [geocoder geocodeAddressString:addressString completionHandler:^(NSArray *placemarks, NSError *error) {
            //Error checking
            
            CLPlacemark *placemark = [placemarks objectAtIndex:0];
            //MKCoordinateRegion region;
            //region.center.latitude = placemark.region.center.latitude;
            //region.center.longitude = placemark.region.center.longitude;
            [geoPoint setLongitude:placemark.region.center.longitude];
            [geoPoint setLatitude:placemark.region.center.latitude];
        }];*/
        //////////////
        [self setGeoPoint:geoPoint];
        //[PFGeoPoint ];
    }
    return self;
}
- (MKAnnotationView *)mapView:(MKMapView *)mv viewForAnnotation:(id <MKAnnotation>)annotation
{
    if([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    NSString *annotationIdentifier = @"PinViewAnnotation";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *) [mv dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
        if (!pinView) {
        pinView = [[MKPinAnnotationView alloc]
                    initWithAnnotation:annotation
                    reuseIdentifier:annotationIdentifier];
        [pinView setPinColor:MKPinAnnotationColorGreen];
        pinView.animatesDrop = YES;
        pinView.canShowCallout = YES;

        UIButton *callButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        pinView.leftCalloutAccessoryView = callButton;
    }
    else
    {
        pinView.annotation = annotation;
    }
    
    return pinView;
}

#pragma mark - ()

- (void)setGeoPoint:(PFGeoPoint *)geoPoint {
    self.coordinate = CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude);
    self.title = self.object[@"phoneNumber1"];
    self.subtitle = self.object[@"facilityName"];
}
/*
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *GeoPointAnnotationIdentifier = @"RedPinAnnotation";
    
    MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView
                                                                  dequeueReusableAnnotationViewWithIdentifier:GeoPointAnnotationIdentifier];
    
    annotationView = [[MKPinAnnotationView alloc]
                      initWithAnnotation:annotation
                      reuseIdentifier:GeoPointAnnotationIdentifier];
    
    UIButton *callButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //[[callButton titleLabel] setText:@"Call"];
    [callButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    annotationView.rightCalloutAccessoryView = callButton;

    //annotationView.tag = PinAnnotationTypeTagGeoPoint;
    annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorRed;
    annotationView.animatesDrop = YES;
    annotationView.draggable = NO;
    return annotationView;
}
*/
 - (void)button:(id)sender{
    NSLog(@"PRESSED");
}

//@synthesize annotationPopoverController;

//@synthesize title;
/*
 // in MyMKAnnotation.m
 - (id) initWithTitle:(NSString *)_title:(NSString *)_title localizacion:(CLLocationCoordinate2D)_localizacion
 {
 coordinate = _localizacion;
 title = _title;               //-----------> here is taking the warning
 
 return self;
 }
 
 */

/*
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    [mapView deselectAnnotation:view.annotation animated:YES];
    
    YourContentViewController *ycvc = [[YourContentViewController alloc] init];
    UIPopoverController *poc = [[UIPopoverController alloc] initWithContentViewController:ycvc];
    
    //hold ref to popover in an ivar
    self.annotationPopoverController = poc;
    
    //size as needed
    poc.popoverContentSize = CGSizeMake(320, 400);
    
    //show the popover next to the annotation view (pin)
    [poc presentPopoverFromRect:view.bounds inView:view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}
*/
#pragma mark - MKAnnotation
/*
// Called when the annotation is dragged and dropped. We update the geoPoint with the new coordinates.
- (void)setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    PFGeoPoint *geoPoint = [PFGeoPoint geoPointWithLatitude:newCoordinate.latitude longitude:newCoordinate.longitude];
    [self setGeoPoint:geoPoint];
    [self.object setObject:geoPoint forKey:@"Location"];
    [self.object saveEventually:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            // Send a notification when this geopoint has been updated. MasterViewController will be listening for this notification, and will reload its data when this notification is received.
            [[NSNotificationCenter defaultCenter] postNotificationName:@"geoPointAnnotiationUpdated" object:self.object];
        }
    }];
}
*/
@end

