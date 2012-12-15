//
//  AppDelegate.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 9/9/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (atomic, retain) LoginViewController *loginViewController;
@property(nonatomic, retain) NSMutableDictionary *userState;

@property (atomic, retain) UITabBarController *tabBar;

-(void)saveUserState;
@end
