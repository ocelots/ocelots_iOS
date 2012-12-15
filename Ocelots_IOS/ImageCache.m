//
//  ImageCache.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/22/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "ImageCache.h"

static ImageCache *sharedImageCache;
@implementation ImageCache
@synthesize imageDic;


- (id)init
{
    self = [super init];
    if (self) {
        self.imageDic=[[NSMutableDictionary alloc]init];
    }
    return self;
}


-(void)setImage:(UIImage *)i forKey:(NSString *)s
{
    [self.imageDic setObject:i forKey:s];
}

-(void)deleteImageForKey:(NSString *)key
{
    [self.imageDic removeObjectForKey:key];
}

-(UIImage *)getImageForKey:(NSString *)key
{
    return [self.imageDic objectForKey:key];
}

+(ImageCache *)shareImageCache
{
    if (!sharedImageCache) {
        sharedImageCache = [[ImageCache alloc]init];
    }
    return sharedImageCache;
}

+(id)allocWithZone:(NSZone *)zone
{
    if (!sharedImageCache) {
        sharedImageCache = [super allocWithZone:zone];
        return sharedImageCache;
    }
    else{
        return nil;
    }
}

@end
