//
//  QuizViewController.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/5/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HypnosisView.h"
#import <QuartzCore/QuartzCore.h>

@interface QuizViewController : UIViewController<UIScrollViewDelegate, UIAccelerometerDelegate>

@property (atomic,retain)CALayer *boxLayer;
@end
