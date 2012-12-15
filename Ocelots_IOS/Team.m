//
//  Team.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 12/11/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "Team.h"

@implementation Team
@synthesize name;
@synthesize memberCount;

+(id)createFromDictionary:(NSDictionary *)dic
{
    NSString *teamName = [dic objectForKey:@"name"];
    int teamMemberCount = [[dic objectForKey:@"members_count"] intValue];
    
    Team *team = [[Team alloc] init];
    [team setName:teamName];
    [team setMemberCount: teamMemberCount];
    [team autorelease];
    return team;
}
@end
