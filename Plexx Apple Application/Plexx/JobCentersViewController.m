//
//  JobCentersViewController.m
//  Plexx
//
//  Created by Sheldon Trotman on 6/1/13.
//  Copyright (c) 2013 Sheldon Trotman. All rights reserved.
//

#import "JobCentersViewController.h"
#import "MapAnnotation.h"

enum PinAnnotationTypeTag {
    PinAnnotationTypeTagGeoPoint = 0,
};

@interface JobCentersViewController ()
@property (nonatomic, strong) CLLocation *location;
@end



@implementation JobCentersViewController
- (BOOL)shouldAutorotate
{
    return NO;
}

@synthesize mapView;

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
    [mapView setDelegate:self];
	// Do any additional setup after loading the view.

   /// if (gestureRecognizer.state != UIGestureRecognizerStateBegan)
      //  return;
    
  //  CGPoint touchPoint = [gestureRecognizer locationInView:self.mapView];
    //self.mapView.region = MKCoordinateRegionMake(self.location.coordinate, MKCoordinateSpanMake(0.05f, 0.05f));
//    self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude), MKCoordinateSpanMake(0.01f, 0.01f));
    
    [self updateLocations];
    /*
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    MapAnnotation *annot = [[MapAnnotation alloc] init];
    annot.coordinate = touchMapCoordinate;
    [self.mapView addAnnotation:annot];
     */
}

//- (void)setInitialLocation:(CLLocation *)aLocation {
 //   self.location = aLocation;
//}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [PFGeoPoint geoPointForCurrentLocationInBackground:^(PFGeoPoint *geoPoint, NSError *error) {
        if (!error) {
            // do something with the new geoPoint
            self.mapView.region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(geoPoint.latitude, geoPoint.longitude), MKCoordinateSpanMake(0.05f, 0.05f));

        }
    }];
}

////////////////////////
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
    
    annotationView.tag = PinAnnotationTypeTagGeoPoint;
    annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorRed;
    annotationView.animatesDrop = YES;
    annotationView.draggable = NO;
    annotationView.rightCalloutAccessoryView = callButton;
    return annotationView;
}
- (void)button:(id)sender{
    NSLog(@"PRESSED");
}
*/
- (void)updateLocations {
    //CGFloat kilometers = self.radius/1000.0f;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Job_Centers"];
    [query setLimit:1000];
    
    /*
     // FINDING CLOSE TO USER
    [query whereKey:@"Location"
       nearGeoPoint:[PFGeoPoint geoPointWithLatitude:self.location.coordinate.latitude
                                           longitude:self.location.coordinate.longitude]
   withinKilometers:kilometers];
    */
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            for (PFObject *object in objects) {
                MapAnnotation *geoPointAnnotation = [[MapAnnotation alloc]
                                                          initWithObject:object];
//                static NSString *GeoPointAnnotationIdentifier = @"RedPinAnnotation";

                
//                MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[self.mapView
  //                                                                            dequeueReusableAnnotationViewWithIdentifier:GeoPointAnnotationIdentifier];
//                annotationView.pinColor = MKPinAnnotationColorGreen;

                [self.mapView addAnnotation:geoPointAnnotation];
            }
        }
    }];
}
/*
- (MKAnnotationView *)mapView:(MKMapView *)sender
            viewForAnnotation:(id <MKAnnotation>)annotation
    {
        static NSString *reuseId = @"StandardPin";
        
        MKPinAnnotationView *aView = (MKPinAnnotationView *)[sender
                                                             dequeueReusableAnnotationViewWithIdentifier:reuseId];
        if (aView == nil)
        {
            aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                     reuseIdentifier:reuseId];
            aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            aView.canShowCallout = YES;
        }
        
        aView.annotation = annotation;
        
        return aView;   
    }
*/

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    static NSString *GeoPointAnnotationIdentifier = @"RedPinAnnotation";
    
    //MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView
    //                                                              dequeueReusableAnnotationViewWithIdentifier:GeoPointAnnotationIdentifier];
    
    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc]
                      initWithAnnotation:annotation
                      reuseIdentifier:GeoPointAnnotationIdentifier];
    
    UIButton *callButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    //[[callButton titleLabel] setText:@"Call"];
    [callButton addTarget:self action:@selector(button:) forControlEvents:UIControlEventTouchUpInside];
    
    annotationView.tag = PinAnnotationTypeTagGeoPoint;
    annotationView.canShowCallout = YES;
    annotationView.pinColor = MKPinAnnotationColorRed;
    annotationView.animatesDrop = YES;
    annotationView.draggable = NO;
    annotationView.rightCalloutAccessoryView = callButton;
    return annotationView;
}

- (void)button:(id)sender{
//    NSLog(@"PRESSED");
    MapAnnotation *ann = [[mapView selectedAnnotations] objectAtIndex:0];
    NSLog(@"Phone Number = %@", ann.title);
    NSString *centerString = ann.subtitle;
    NSString *phoneString = [NSString stringWithFormat:@"Call %@", ann.title];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Contact" message:centerString delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles: phoneString, @"Email", nil];
    
    [alertView setAlertViewStyle:UIAlertViewStyleDefault];
    [alertView show];
    
}


- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    MapAnnotation *ann = [[mapView selectedAnnotations] objectAtIndex:0];
    NSLog(@"Phone Number = %@", ann.title);
    
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    NSString *phoneString = [NSString stringWithFormat:@"Call %@", ann.title];

    if([title isEqualToString:phoneString])
    {
        UIDevice *device = [UIDevice currentDevice];
        if ([[device model] isEqualToString:@"iPhone"] ) {
            NSString *phoneNumber = [NSString stringWithFormat:@"tel:%@", ann.title];
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        } else {
            UIAlertView *Notpermitted=[[UIAlertView alloc] initWithTitle:@"Alert" message:@"Your device doesn't support this feature." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [Notpermitted show];
        }

    }else if ([title isEqualToString:@"Email"]){
        
    }
}

/*
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id<MKOverlay>)overlay {
    static NSString *CircleOverlayIdentifier = @"Circle";
    
    if ([overlay isKindOfClass:[CircleOverlay class]]) {
        CircleOverlay *circleOverlay = (CircleOverlay *)overlay;
        
        MKCircleView *annotationView =
        (MKCircleView *)[mapView dequeueReusableAnnotationViewWithIdentifier:CircleOverlayIdentifier];
        
        if (!annotationView) {
            MKCircle *circle = [MKCircle
                                circleWithCenterCoordinate:circleOverlay.coordinate
                                radius:circleOverlay.radius];
            annotationView = [[MKCircleView alloc] initWithCircle:circle];
        }
        
        if (overlay == self.targetOverlay) {
            annotationView.fillColor = [UIColor colorWithRed:1.0f green:0.0f blue:0.0f alpha:0.3f];
            annotationView.strokeColor = [UIColor redColor];
            annotationView.lineWidth = 1.0f;
        } else {
            annotationView.fillColor = [UIColor colorWithWhite:0.3f alpha:0.3f];
            annotationView.strokeColor = [UIColor purpleColor];
            annotationView.lineWidth = 2.0f;
        }
        
        return annotationView;
    }
    
    return nil;
}
*/
/*
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState fromOldState:(MKAnnotationViewDragState)oldState {
   // if (![view isKindOfClass:[MKPinAnnotationView class]] || view.tag != PinAnnotationTypeTagGeoQuery) {
     //   return;
    //}
    
    if (MKAnnotationViewDragStateStarting == newState) {
        [self.mapView removeOverlays:self.mapView.overlays];
    } else if (MKAnnotationViewDragStateNone == newState && MKAnnotationViewDragStateEnding == oldState) {
        MKPinAnnotationView *pinAnnotationView = (MKPinAnnotationView *)view;
        GeoQueryAnnotation *geoQueryAnnotation = (GeoQueryAnnotation *)pinAnnotationView.annotation;
        self.location = [[CLLocation alloc] initWithLatitude:geoQueryAnnotation.coordinate.latitude longitude:geoQueryAnnotation.coordinate.longitude];
        [self configureOverlay];
    }
}
*/
@end
