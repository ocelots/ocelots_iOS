//
//  ImageCache.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/22/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCache : NSObject

@property (atomic,retain) NSMutableDictionary *imageDic;

+(ImageCache *)shareImageCache;
-(void)setImage:(UIImage *)i forKey:(NSString *)s;
-(void)deleteImageForKey:(NSString *)key;
-(UIImage *)getImageForKey:(NSString *)key;

@end
