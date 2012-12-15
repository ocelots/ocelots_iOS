//
//  LoginViewController.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 9/9/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Security/Security.h>
#import "MainViewController.h"

@interface LoginViewController : UIViewController<UITextFieldDelegate>
@property  (atomic, retain) MainViewController *mainViewController;
-(IBAction)loginWithGoogle:(id)sender;
-(IBAction)LoginWithPersona:(id)sender;

@end
