//
//  TestDemo.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 11/30/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "TestDemo.h"

@implementation TestDemo

-(void)testStrings
{
    NSString *str1 = @"sting1";
    GHAssertNotNULL(str1, @"%@ is null",str1);
}
@end
