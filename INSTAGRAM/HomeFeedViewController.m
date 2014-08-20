//
//  HomeFeedViewController.m
//  INSTAGRAM
//
//  Created by Patrick Hogan on 8/19/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "HomeFeedViewController.h"

@interface HomeFeedViewController () <UITableViewDataSource, UITableViewDelegate>
@property NSArray *posts;

@end

@implementation HomeFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.posts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    return cell;
}

@end
