//
//  ProfileViewController.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/5/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import "MapPoint.h"

@interface MapViewController : UIViewController <CLLocationManagerDelegate,MKMapViewDelegate,UITextFieldDelegate>

@property (atomic,retain) IBOutlet UITextField *location;
@property (atomic,retain) CLLocationManager *locationManager;

@property (atomic,retain) IBOutlet MKMapView *mapView;
@property (atomic,retain) IBOutlet UIActivityIndicatorView *indicator;

-(void)findLocation;
-(void)foundLocation;

@end
