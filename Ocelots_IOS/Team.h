//
//  Team.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 12/11/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Team : NSObject
@property (nonatomic,retain) NSString *name;
@property (nonatomic) int memberCount;

+(id)createFromDictionary:(NSDictionary *)dic;
@end
