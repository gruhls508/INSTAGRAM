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
@property PFObject *post;


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
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            self.posts = objects;
            [super viewDidLoad];
            NSLog(@"Retrieved %lu posts", (unsigned long)[self.posts count]);
        }
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    PFObject *post = [self.posts objectAtIndex:indexPath.row];
    
//    PFFile *imageFile = [self.post objectForKey:@"file"];
//    NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
//    NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
//    
//    UIImageView *cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
//    cellImageView.image = [UIImage imageWithData:imageData];

    NSString *caption = [self.post objectForKey:@"caption"];
    UILabel *cellLabel = [UILabel new];
    cellLabel.text = caption;
    return cell;
}

@end
