//
//  MainViewController.m
//  Ocelots_IOS
//
//  Created by lincoln.liu on 10/4/12.
//  Copyright (c) 2012 lincoln.liu. All rights reserved.
//

#import "MainViewController.h"
#import "TeamsViewController.h"
#import "ProfileViewController.h"
#import "QuizViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        TeamsViewController *tempTeams = [[TeamsViewController alloc] init];
        ProfileViewController *tempProfile = [[ProfileViewController alloc] init];
        QuizViewController *tempQuiz = [[QuizViewController alloc] init];
    
        NSMutableArray *tempViews = [[NSMutableArray alloc] initWithObjects:tempTeams,tempProfile,tempQuiz, nil];
        [self setViewControllers:tempViews];
        [tempTeams release];
        [tempProfile release];
        [tempQuiz release];
        [tempViews release];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidAppear:(BOOL)animated
{    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
}

@end
