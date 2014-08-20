//
//  ProfileViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/19/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *profileImage;
@property (weak, nonatomic) IBOutlet UILabel *postCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followerCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *followingCountLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *websiteLabel;
@property (weak, nonatomic) IBOutlet UICollectionView *userPhotosCollectionView;
@property PFUser *currentUser;

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentUser = [PFUser currentUser];
    
    self.usernameLabel.text = self.currentUser.username;
    
    PFQuery *query = [PFQuery queryWithClassName:@"Post"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (error) {
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
        else {
            NSUInteger numberOfPosts = objects.count;
            self.postCountLabel.text = [NSString stringWithFormat:@"%lu", (unsigned long)numberOfPosts];
            self.nameLabel.text = [self.currentUser objectForKey:@"name"];
            self.websiteLabel.text = [self.currentUser objectForKey:@"website"];
        }
    }];
}
- (IBAction)onSearchButtonTapped:(id)sender
{
    
}


-(IBAction)unwindFromEditSegue:(UIStoryboardSegue *)sender
{
    
}

@end
