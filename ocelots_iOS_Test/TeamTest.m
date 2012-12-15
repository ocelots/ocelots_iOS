//
//  TeamTest.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 12/11/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//
#import <GHUnitIOS/GHUnit.h>
#import "Team.h"

@interface TeamTest : GHTestCase

@end

@implementation TeamTest

-(void)testCreateTeam
{
    NSString *expect = @"team1";
    NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
    [dic setObject:expect forKey:@"name"];
    [dic setObject:@"1" forKey:@"members_count"];
    
    Team *t = [Team createFromDictionary:dic];
    GHAssertEquals(1, t.memberCount, @"%@ should be 1",t.memberCount);
    GHAssertEqualStrings(expect, t.name, @"%@ should be %@",t.name, expect);
}
@end
