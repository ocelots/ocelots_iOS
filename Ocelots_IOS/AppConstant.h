//
//  AppConstant.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 11/25/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppConstant : NSObject
#define AUTH_TOKEN_SAVED @"hasSaved";
#define AUTH_TOKEN @"authToken";
#define APP_NAME @"ocelots_iOS"
#define GOOGLE_CLIENT_ID @"573624922951.apps.googleusercontent.com";
#define GOOGLE_CLIENT_SECRET @"1PCqZ6JWdBOfaKj6tCnrwP1u";
#define GOOGLE_AUTH_SCOPE @"https://www.googleapis.com/auth/userinfo.email";
#define APP_TITLE @"Ocelots - Get to Know Your Colleagues";
extern NSString * const kKeyChainGoogleAuth;
extern NSString * const kKeyChainPersonaAuth;
@end
