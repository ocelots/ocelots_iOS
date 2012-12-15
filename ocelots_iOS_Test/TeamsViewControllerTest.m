//
//  TeamsViewControllerTest.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 12/11/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <GHUnitIOS/GHUnit.h>
#import "TeamsViewController.h"

@interface TeamsViewControllerTest : GHTestCase

@end

@implementation TeamsViewControllerTest

-(void)testAddTeamsData
{
    NSString *key = @"Key";
    TeamsViewController *controller = [[TeamsViewController alloc] init];
    NSMutableArray *a = [NSMutableArray arrayWithObjects:@"a",@"b", nil];
    [[controller teamsData] setObject:a forKey:key];
    NSMutableArray *result = [controller.teamsData objectForKey:key];
    GHAssertEquals(a, result, @"%@ should equal to %@",result,a);
    [controller release];
}
@end
