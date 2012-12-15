//
//  MapPoint.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/11/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
@interface MapPoint : NSObject<MKAnnotation>

@property (atomic,readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic,copy) NSString *title;

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

@end
