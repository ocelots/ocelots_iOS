//
//  TeamMembersViewController.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/21/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "TeamMembersViewController.h"

@interface TeamMembersViewController ()

@end

@implementation TeamMembersViewController
@synthesize members;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.members = [NSMutableArray arrayWithObjects:@"Lindsay",@"Antti",@"Richard", nil];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSLog(@"number of row");
    int rowCount = self.members.count;
    if ([self isEditing]) {
        rowCount++;
    }
    return rowCount;
    
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *tableSampleIdentifier = @"Table Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableSampleIdentifier];
    if (cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableSampleIdentifier] autorelease];
    }
    if ([indexPath row] < [self.members count]) {
        cell.textLabel.text = [self.members objectAtIndex: indexPath.row];
        cell.imageView.image = [UIImage imageNamed:@"suncorp.jpeg"];
    }
    else
    {
        cell.textLabel.text = @"Add a new Team...";
    }
    return cell;
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
