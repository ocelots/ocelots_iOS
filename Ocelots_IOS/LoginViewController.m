//
//  LoginViewController.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 9/9/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "LoginViewController.h"
#import "AppDelegate.h"
#import "AppConstant.h"
#import "GTMOAuth2ViewControllerTouch.h"
#import "AuthHelper.h"
#import "MainViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize mainViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = APP_TITLE;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}


-(IBAction)loginWithGoogle:(id)sender{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:APP_NAME]) {
        [self goToMainPage];
    }else{
        [self authThroughGoogle];
    }
   }

-(void)authThroughGoogle
{
    NSString *clientId = GOOGLE_CLIENT_ID;
    NSString *clientSecret = GOOGLE_CLIENT_SECRET;
    NSString *scope = GOOGLE_AUTH_SCOPE;
    GTMOAuth2ViewControllerTouch *authViewController = [[[GTMOAuth2ViewControllerTouch alloc] initWithScope:scope clientID:clientId clientSecret:clientSecret keychainItemName:kKeyChainGoogleAuth delegate:self finishedSelector:@selector(viewController:finishedWithAuth:error:)]autorelease];
    NSString *html = @"<html><body bgcolor=white><div align=center>正在进入google登录页面...</div></body></html>";
    authViewController.initialHTMLString = html;
    [self.navigationController pushViewController:authViewController animated:YES];
}

-(void)viewController:(GTMOAuth2ViewControllerTouch *)viewController finishedWithAuth:(GTMOAuth2Authentication *)auth error:(NSError *)error{
    if (error!=nil) {
        NSLog(@"Auth failed!");
        [self showAlertView:[error localizedDescription]];
    }else{
        NSLog(@"Auth successed!: %@", [auth accessToken]);
        NSString  *token = [AuthHelper getAuthTokenThroughGoogle:[auth accessToken]];
        if(token != nil){
            [[NSUserDefaults standardUserDefaults] setObject:token forKey:APP_NAME];
            [self goToMainPage];
        }else{
            [self showAlertView:@"Get get the authorize token"];
        }
    }
}

-(void)goToMainPage
{
    MainViewController  *temp = [[MainViewController alloc] init];
    self.mainViewController = temp;
    [temp release];
    [self presentModalViewController:self.mainViewController animated:YES];
}

-(void)showAlertView:(NSString *)warnningMessage
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil message:warnningMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
    [alertView release];
}

-(IBAction)LoginWithPersona:(id)sender{
    NSLog(@"%@",@"Login With Persona");
    NSURL *baiduUrl = [NSURL URLWithString:@"http://www.baidu.com"];
    if(![[UIApplication sharedApplication] openURL:baiduUrl]){
        NSLog(@"%@%@",@"Failed to open ",[baiduUrl description]);
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *) textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
