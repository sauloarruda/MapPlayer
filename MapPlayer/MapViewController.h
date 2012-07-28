//
//  ViewController.h
//  MapPlayer
//
//  Created by Saulo Arruda Coelho on 7/28/12.
//  Copyright (c) 2012 Jera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface MapViewController : UIViewController<CLLocationManagerDelegate, MKMapViewDelegate>

@end
