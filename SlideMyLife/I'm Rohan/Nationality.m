//
//  Nationality.m
//  Slide My Life
//
//  Created by Upi Kapur on 29/4/13.
//  Copyright (c) 2013 Rohan Kapur. All rights reserved.
//

#import "Nationality.h"

@implementation Nationality

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder: aDecoder]) {
        
        self.SlideID = [NSString stringWithFormat: @"%@", WHO_I_AM_SLIDE_NATIONALITY_SLIDE];
        self.isMasterSlide = NO;
        
        for (UIView *view in self.subviews) {
            
            if ([view isKindOfClass: [UILabel class]]) {
                
                ((UILabel *)view).font = [UIFont fontWithName:@"Gotham Bold" size: 15.0];
            }
            
            if ([view isKindOfClass: [MKMapView class]] || ([view isKindOfClass: [UIImageView class]] && view.tag != 1)) {
                
                view.layer.cornerRadius = 7.0f;
                view.layer.masksToBounds = YES;
            }
        }
        
        [self annotateMapView];
    }
    
    return self;
}

#pragma mark Map View Stuffs

- (void)annotateMapView {
    
    for (MKMapView *mapView in self.subviews) {
        
        if ([mapView isKindOfClass: [MKMapView class]]) {
            
            mapView.delegate = self;
            
            switch (mapView.tag) {
                    
                case 1:
                {
                    Annotation *annotation = [[Annotation alloc] init];
                    annotation.title = @"I was born here";
                    annotation.subtitle = @"Fitzroy Hospital, Melbourne";
                    annotation.coordinate = CLLocationCoordinate2DMake(-37.8078788, 144.9745133);
                    
                    [mapView addAnnotation: annotation];
                    
                    MKCoordinateRegion region = MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.035, 0.035));
                    [mapView setRegion:region animated:NO];
                    
                }
                    break;
                    
                case 2: {
                    
                    Annotation *mum = [[Annotation alloc] init];
                    mum.title = @"Mum from here";
                    mum.subtitle = @"Punjab, India";
                    mum.coordinate = CLLocationCoordinate2DMake(31.1471305, 75.3412179);
                    
                    Annotation *dad = [[Annotation alloc] init];
                    dad.title = @"Dad from here";
                    dad.subtitle = @"Kolkata, India";
                    dad.coordinate = CLLocationCoordinate2DMake(22.572646, 88.363895);
                    
                    [mapView addAnnotations: @[mum, dad]];
                    
                    CLLocationCoordinate2D topLeftCoord;
                    topLeftCoord.latitude = -90;
                    topLeftCoord.longitude = 180;
                    
                    CLLocationCoordinate2D bottomRightCoord;
                    bottomRightCoord.latitude = 90;
                    bottomRightCoord.longitude = -180;

                    for (Annotation *annotation in @[mum, dad])
                    {
                        topLeftCoord.longitude = fmin(topLeftCoord.longitude, annotation.coordinate.longitude);
                        topLeftCoord.latitude = fmax(topLeftCoord.latitude, annotation.coordinate.latitude);
                        
                        bottomRightCoord.longitude = fmax(bottomRightCoord.longitude, annotation.coordinate.longitude);
                        bottomRightCoord.latitude = fmin(bottomRightCoord.latitude, annotation.coordinate.latitude);
                    }
                    
                    MKCoordinateRegion region;
                    
                    region.center.latitude = topLeftCoord.latitude - (topLeftCoord.latitude - bottomRightCoord.latitude) * 0.5;
                    region.center.longitude = topLeftCoord.longitude + (bottomRightCoord.longitude - topLeftCoord.longitude) * 0.5;
                    region.span.latitudeDelta = fabs(topLeftCoord.latitude - bottomRightCoord.latitude) * 1.1; // Add a little extra space on the sides
                    region.span.longitudeDelta = fabs(bottomRightCoord.longitude - topLeftCoord.longitude) * 1.1; // Add a little extra space on the sides
                    
                    region = [mapView regionThatFits:region];
                    [mapView setRegion:region animated:YES];
                                        
                    CLLocationCoordinate2D coordinates[2];
                    coordinates[0] = mum.coordinate;
                    coordinates[1] = dad.coordinate;
                    
                    MKPolyline *polyLine = [MKPolyline polylineWithCoordinates:coordinates count: 2];
                    [mapView addOverlay: polyLine];
                    
                }
                    break;
                    
                case 3: {
                    
                    Annotation *annotation = [[Annotation alloc] init];
                    annotation.title = @"I live here";
                    annotation.subtitle = @"#18-21, One Chatsworth Road";
                    annotation.coordinate = CLLocationCoordinate2DMake(1.2996178, 103.8247663);
                    
                    [mapView addAnnotation: annotation];
                    
                    MKCoordinateRegion region = MKCoordinateRegionMake(annotation.coordinate, MKCoordinateSpanMake(0.02, 0.02));
                    [mapView setRegion:region animated:NO];
                }
            }
        }
    }
}

- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay {
    
    MKPolylineView *polylineView = [[MKPolylineView alloc] initWithPolyline:overlay];
    
    polylineView.strokeColor = [UIColor yellowColor];
    polylineView.lineWidth = 3.0;
    polylineView.alpha = 1.0;

    return polylineView;
}

//- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    
//    #define MKANNOTATION_REUSE_IDENTIFIER @"MKANNOTATION_REUSE_IDENTIFIER"
//    
//    MKPinAnnotationView *annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier: MKANNOTATION_REUSE_IDENTIFIER];
//    
//    annotationView.pinColor = MKPinAnnotationColorRed;
//    
//    if ([((Annotation *)annotation).title isEqualToString: @"Dad from here"]) {
//        
//        annotationView.pinColor = MKPinAnnotationColorGreen;
//    }
//    
//    return annotationView;
//}

@end
