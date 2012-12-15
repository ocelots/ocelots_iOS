//
//  TeamMembersViewController.h
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/21/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamMembersViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (atomic,retain) IBOutlet UITableView *membersView;
@property (atomic,retain) NSMutableArray *members;


@end
