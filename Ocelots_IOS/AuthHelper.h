//
//  AuthHelper.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 11/30/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"

@interface AuthHelper : NSObject
+(NSString *)getAuthTokenThroughGoogle:(NSString *)access_token;
@end
