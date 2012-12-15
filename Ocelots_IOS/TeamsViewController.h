//
//  TeamsViewController.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 9/9/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeamMembersViewController.h"

@interface TeamsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (atomic,retain) IBOutlet UITableView *teams;
@property (atomic,retain) NSMutableDictionary *teamsData;

-(void)loadAllTeamsData;

@end
