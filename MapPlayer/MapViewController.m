//
//  ViewController.m
//  MapPlayer
//
//  Created by Saulo Arruda Coelho on 7/28/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController () 
{
    CLLocationManager* _locationManager;
}
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@interface MapPoint : NSObject<MKAnnotation>

- (id)initWithTitle:(NSString*)title coordinates:(CLLocationCoordinate2D)coordinates;

@end

@implementation MapViewController
@synthesize mapView;

- (void)viewDidLoad
{
    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    _locationManager.distanceFilter = 5;
    [_locationManager startUpdatingLocation];
}



- (void)viewDidUnload {
    [self setMapView:nil];
    [super viewDidUnload];
}

#pragma mark - MKMapViewDelegate methods

- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> anotation = [annotationView annotation];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([anotation coordinate], 250, 500);
    
    [self.mapView setRegion:region animated:YES];
}


- (void)mapView:(MKMapView *)mv didUpdateUserLocation:(MKUserLocation *)userLocation
{
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude + 0.0005, userLocation.coordinate.longitude + 0.0005);
    MapPoint* point = [[MapPoint alloc] initWithTitle:@"Lere" coordinates:coordinate];
    [mv addAnnotation:point];
    
}

@end

@implementation MapPoint

@synthesize title = _title;
@synthesize coordinate = _coordinate;

- (id)initWithTitle:(NSString*)title coordinates:(CLLocationCoordinate2D)coordinate
{
    self = [super init];
    if (self) {
        _title = title;
        _coordinate = coordinate;
    }
    return self;
}

@end
