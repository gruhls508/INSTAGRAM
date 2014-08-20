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
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation HomeFeedViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    PFUser *currentUser = [PFUser currentUser];
    NSLog(@"Current user: %@", currentUser.username);
}

-(void)viewWillAppear:(BOOL)animated
{
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query whereKey:@"recipientIds" equalTo:[[PFUser currentUser] objectId]];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            self.posts = objects;
            [self.tableView reloadData];
            NSLog(@"Retrieved %lu posts", (unsigned long)[self.posts count]);
        }
    }];
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
