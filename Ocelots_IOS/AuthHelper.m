//
//  AuthHelper.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 11/30/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "AuthHelper.h"
#import "ASIFormDataRequest.h"

@implementation AuthHelper
+(NSString *)getAuthTokenThroughGoogle:(NSString *)accessToken
{
    NSURL *url = [NSURL URLWithString:@"http://localhost:8080/auth"];
    ASIFormDataRequest  *request = [ASIFormDataRequest requestWithURL:url];
    [request setPostValue:accessToken forKey:@"access_token"];
    [request setDelegate:self];
    [request setTimeOutSeconds:10];
    [request startSynchronous];
    if ([request error] == nil) {
        return [request responseString];
    }else{
        return nil;
    }
}

@end
