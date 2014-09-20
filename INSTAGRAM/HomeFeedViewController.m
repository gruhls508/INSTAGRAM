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
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //  Temporary 'magic number' as placeholder while I get this set up correctly.

    return 4;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeCell"];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query orderByDescending:@"createdAt"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            self.posts = objects;
            NSLog(@"Retrieved %lu posts", (unsigned long)[self.posts count]);
            PFObject *post = [self.posts objectAtIndex:indexPath.row];
            
            NSString *caption = [post objectForKey:@"caption"];
            UILabel *cellLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 320, 320, 20)];
            [cell addSubview:cellLabel];
            cellLabel.text = caption.description;
            
            PFFile *imageFile = [post objectForKey:@"file"];
            NSURL *imageFileUrl = [[NSURL alloc] initWithString:imageFile.url];
            NSData *imageData = [NSData dataWithContentsOfURL:imageFileUrl];
            
            UIImageView *cellImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
            cellImageView.contentMode = UIViewContentModeScaleAspectFit;
            [cell addSubview:cellImageView];
            cellImageView.image = [UIImage imageWithData:imageData];
        }
    }];
    
    return cell;
}
- (IBAction)onLikePressed:(id)sender
{
}
- (IBAction)onCommentPressed:(id)sender
{
}

@end

