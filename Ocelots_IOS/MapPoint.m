//
//  MapPoint.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/11/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize coordinate,title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t
{
    [super init];
    coordinate = c;
    self.title = t;
    return self;
}

-(void)dealloc
{
    [title release];
    [super dealloc];
}
@end
