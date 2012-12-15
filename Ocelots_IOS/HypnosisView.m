//
//  Hypnosis.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/15/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGRect bound = [self bounds];
    CGPoint center;
    center.x = bound.origin.x+bound.size.width/2.0;
    center.y = bound.origin.y+bound.size.height/2.0;
    
    float maxRadius = hypot(bound.size.width, bound.size.height)/2.0;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10);
    [[UIColor lightGrayColor] setStroke];
    
    for (float currentRadius = maxRadius; currentRadius >0; currentRadius -= 20) {
        CGContextAddArc(context, center.x, center.y, currentRadius, 0.0, M_PI*2.0, YES);
        CGContextStrokePath(context);
    }
    
    NSString *string = @"You're get sleeping!";
    UIFont *font = [UIFont boldSystemFontOfSize:28];
    CGRect textRect;
    textRect.size = [string sizeWithFont:font];
    textRect.origin.x = center.x - textRect.size.width/2.0;
    textRect.origin.y = center.y - textRect.size.height/2.0;
    
    [[UIColor blackColor] setFill];
    CGSize offset = CGSizeMake(4, -3);
    CGColorRef  color = [[UIColor darkGrayColor] CGColor];
    CGContextSetShadowWithColor(context, offset, 2.0, color);
    
    [string drawInRect:textRect withFont:font];
}

@end
