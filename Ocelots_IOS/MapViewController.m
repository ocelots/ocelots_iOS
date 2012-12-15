//
//  ProfileViewController.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/5/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "MapViewController.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize location = _location;
@synthesize locationManager = _locationManager;
@synthesize mapView = _mapView;
@synthesize indicator = _indicator;

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        UITabBarItem *OneItem = [self tabBarItem];
        //        UIImage *OneImage = [UIImage imageNamed:@"profile.png"];
        //        OneItem.image = OneImage;
        OneItem.title = @"Map";
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return self.init;
}


-(void)viewDidAppear:(BOOL)animated
{
    self.locationManager = [[CLLocationManager alloc] init];
    [self.locationManager setDelegate:self];
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    //    [self.locationManager startUpdatingLocation];
    
    [self.mapView setDelegate:self];
    [self.mapView setShowsUserLocation:YES];
    [self.location setDelegate:self];
}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:newLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        CLPlacemark *placeMark = [placemarks objectAtIndex:0];
        NSString *loc = [[placeMark.addressDictionary valueForKey:@"FormattedAddressLines"] componentsJoinedByString:@", "];
        NSLog(@"%@",loc);
    }];
    
    NSTimeInterval timeInterval = [[newLocation timestamp] timeIntervalSinceNow];
    if (timeInterval < -180) {
        return;
    }
    
    NSDate *date = [NSDate date];
    NSLog(@"%@",date);
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSLog(@"%@",[dateFormatter stringFromDate:date]);
    
    
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:[newLocation coordinate] title:self.location.text];
    [self.mapView addAnnotation:mp];
    [mp release];
    [self foundLocation];
}
//
//-(MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
//{
//    if ([annotation isKindOfClass:[MapPoint class]]==YES) {
//        MKAnnotationView *annotationView = [mapView dequeueReusableAnnotationViewWithIdentifier:annotation.title];
//        if(annotationView == nil)
//        {
//            annotationView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotation.title];
//        }
//        else
//        {
//            annotationView.annotation = annotation;
//        }
//        return annotationView;
//    }
//    return nil;
//}

-(void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKAnnotationView *annotationView = [views objectAtIndex:0];
    id<MKAnnotation> annotations = [annotationView annotation];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance([annotations coordinate], 250, 250);
    [mapView setRegion:region animated:YES];
}

-(void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSString *errorMessage = nil;
    if([error code] == kCLErrorDenied){
        
        errorMessage = @"The Access is denied";
    }
    if([error code] == kCLErrorLocationUnknown){
        errorMessage = @"Get Location Failed!";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Location" message:@"Fail to update location" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(BOOL)textFieldShouldReturn:(UITextField *)tf
{
    [self findLocation];
    [tf resignFirstResponder];
    return TRUE;
}

-(void)findLocation
{
    [self.locationManager startUpdatingLocation];
    [self.indicator startAnimating];
    [self.location setHidden:YES];
}

-(void)foundLocation
{
    [self.location setText:@""];
    [self.indicator stopAnimating];
    [self.location setHidden:NO];
    [self.locationManager stopUpdatingLocation];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [_location release];
    [_locationManager release];
    [_mapView release];
    [_indicator release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
