//
//  QuizViewController.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/5/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "QuizViewController.h"

@interface QuizViewController ()

@end

@implementation QuizViewController

@synthesize boxLayer;
//- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
//{
//    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
//    if (self) {
//        self.title = @"Quiz";
//    }
//    return self;
//}

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        UITabBarItem *OneItem = [self tabBarItem];
        OneItem.title = @"Quiz";
        UIImage *OneImage = [UIImage imageNamed:@"quiz.png"];
        OneItem.image = OneImage;
        
        self.boxLayer = [[CALayer alloc]init];
        [self.boxLayer setBounds:CGRectMake(0.0, 0.0, 85.0, 85.0)];
        [self.boxLayer setPosition:CGPointMake(160.0, 100.0)];
        UIColor *reddish = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.5];
        CGColorRef cgReddish = [reddish CGColor];
        [self.boxLayer setBackgroundColor:cgReddish];
        [[self.view layer] addSublayer:self.boxLayer];
        [self.boxLayer autorelease];
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return self.init;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewDidAppear:(BOOL)animated
{
    NSLog(@"%f",self.view.bounds.size.height);
    NSLog(@"%f",self.view.bounds.size.width);
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    CGRect background;
    background.origin = CGPointZero;
    background.size.width = self.view.bounds.size.width*2.0;
    background.size.height = self.view.bounds.size.height*2.0;
    
    [scrollView setContentSize:background.size];
    
    CGPoint offset;
    offset.x = self.view.bounds.size.width*0.5;
    offset.y = self.view.bounds.size.height*0.5;
    [scrollView setContentOffset:offset];
    
    HypnosisView  *hypnosisView = [[HypnosisView alloc] initWithFrame:background];
    [hypnosisView setBackgroundColor:[UIColor clearColor]];
    [scrollView addSubview:hypnosisView];
    
    
    [scrollView setMaximumZoomScale:5];
    [scrollView setMinimumZoomScale:0.5];
    [scrollView setDelegate:self];
    
    self.view = scrollView;
    [hypnosisView release];
    [scrollView release];
    
    UIAccelerometer *acce = [UIAccelerometer sharedAccelerometer];
    [acce setUpdateInterval:0.1];
    [acce setDelegate:self];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:NO];
}

-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    NSLog(@"%@",@"Zooming...");
    return [scrollView.subviews objectAtIndex:0];
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    [self.boxLayer release];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
