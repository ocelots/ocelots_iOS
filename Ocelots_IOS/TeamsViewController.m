//
//  TeamsViewController.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 9/9/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "TeamsViewController.h"
#import "ASIHTTPRequest.h"
#import "SBJsonParser.h"
#import "Team.h"

@interface TeamsViewController ()

@end

@implementation TeamsViewController

@synthesize teams = _teams;
@synthesize teamsData;

- (id)init
{
    self = [super initWithNibName:nil bundle:nil];
    if (self)
    {
        UITabBarItem *OneItem = [self tabBarItem];
        UIImage *OneImage = [UIImage imageNamed:@"teams.png"];
        OneItem.image = OneImage;
        OneItem.title = @"Teams";
        [self.navigationItem setLeftBarButtonItem:self.editButtonItem];
        [self.navigationItem setTitle:@"Teams"];
        teamsData = [[NSMutableDictionary alloc] init];
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    return self.init;
}

- (void)viewDidLoad
{
    [self loadAllTeamsData];
    [super viewDidLoad];
    
}

-(void)loadAllTeamsData
{
    NSURL *allTeamsURL = [NSURL URLWithString:@"http://localhost:8080/api/all_teams"];
    ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:allTeamsURL];
    [request setDelegate:self];
    [request setTimeOutSeconds:10.0f];
    [request startSynchronous];
    NSError *error = [request error];
    if (error == nil) {
        NSLog(@"get response");
        [self parseAllTeamsData:[request responseString]];
    }else{
        NSLog(@"%@",error);
    }
}

-(void)parseAllTeamsData:(NSString *)dataString
{
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    NSDictionary *receivedObject = [parser objectWithString:dataString];
    NSLog(@"%@",receivedObject);
    NSString *joinedTeamsKey = @"Joined Teams";
    
    NSArray *joinedTeamsData = [receivedObject objectForKey:joinedTeamsKey];
    NSLog(@"a:%@",joinedTeamsData);
    NSMutableArray *joinedTeams = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in joinedTeamsData) {
        NSLog(@"j: %@",dic);
        [joinedTeams addObject:[Team createFromDictionary:dic]];
    }
    [self.teamsData setObject:joinedTeams forKey:joinedTeamsKey];
    [joinedTeams release];
    
    NSString *viewableTeamsKey = @"Viewable Teams";
    NSArray *viewableTeamsData = [receivedObject objectForKey:viewableTeamsKey];
    NSMutableArray *viewableTeams = [[NSMutableArray alloc] init];
    for (NSDictionary *dic in viewableTeamsData) {
        [viewableTeams addObject:[Team createFromDictionary:dic]];
    }
    [self.teamsData setObject:viewableTeams forKey:viewableTeamsKey];
    [viewableTeams release];
    [parser release];
    NSLog(@"teams count:%d",[[self teamsData] count]);
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)viewDidUnload
{
    [_teams release];
    self.teamsData = nil;
    [super viewDidUnload];
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation == UIInterfaceOrientationPortrait);
//}

#pragma mark Table View Data Source methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.teamsData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *allKeys = [self.teamsData allKeys];
    NSString *key = [allKeys objectAtIndex:section];
    return [[self.teamsData objectForKey:key] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSArray *allKeys = [self.teamsData allKeys];
    NSString *key = [allKeys objectAtIndex:[indexPath section]];
    NSMutableArray *teams = [self.teamsData objectForKey:key];
    Team *team = [teams objectAtIndex:[indexPath row]];
    
    static NSString *tableSampleIdentifier = @"Table Identifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableSampleIdentifier];
    if (cell == nil){
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:tableSampleIdentifier] autorelease];
    }
    cell.textLabel.text = [team name];
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSArray *allKeys = [self.teamsData allKeys];
    return [allKeys objectAtIndex:section];
}

//-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.teamsData removeObjectAtIndex:[indexPath row]];
//        [self.teams deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//    else if (editingStyle == UITableViewCellEditingStyleInsert)
//    {
//        [self.teamsData addObject:@"Direct Super"];
//        [self.teams insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//    }
//}
//
//-(void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
//{
//        NSString *item = [self.teamsData objectAtIndex:[sourceIndexPath row]];
//        [item retain];
//        [self.teamsData removeObjectAtIndex:[sourceIndexPath row]];
//        [self.teamsData insertObject:item atIndex:[destinationIndexPath row]];
//        [item release];
//}
//
//-(NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
//{
//    if ([proposedDestinationIndexPath  row] < [self.teamsData count])
//    {
//        return proposedDestinationIndexPath;
//    }
//    NSIndexPath *betterIndex = [NSIndexPath indexPathForRow:[self.teamsData count]-1 inSection:0];
//    return betterIndex;
//}
//
//-(UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([self isEditing] && [indexPath row] == [self.teamsData count]) {
//        return UITableViewCellEditingStyleInsert;
//    }
//    return UITableViewCellEditingStyleDelete;
//}
//
//-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([indexPath row] == [self.teamsData count]) {
//        return NO;
//    }
//    return YES;
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    TeamMembersViewController *membersView = [[TeamMembersViewController alloc] init];
//    [self.navigationController pushViewController:membersView animated:YES];
//}
//
//-(void)setEditing:(BOOL)editing animated:(BOOL)animated
//{
//    NSLog(@"%@",@"setEditing");
//    [super setEditing:editing animated:animated];
//    if (editing) {
//        [self.teams setEditing:YES animated:YES];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.teamsData count] inSection:0];
//        [self.teams insertRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationLeft];
//    }
//    else
//    {
//        [self.teams setEditing:NO animated:YES];
//        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[self.teamsData count] inSection:0];
//        [self.teams deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
//}
@end
