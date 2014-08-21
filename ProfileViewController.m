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
@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
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

}

-(void)viewWillAppear:(BOOL)animated
{
    self.usernameLabel.text = self.currentUser.username;
    self.nameLabel.text = [[PFUser currentUser] objectForKey:@"name"];
    self.websiteLabel.text = [[PFUser currentUser] objectForKey:@"website"];
    self.usernameLabel.text = self.currentUser.username;
    if ([[PFUser currentUser] objectForKey:@"profilePic"]) {
        PFFile *pffile = [[PFUser currentUser] objectForKey:@"profilePic"];
        [pffile getDataInBackgroundWithBlock:^(NSData *data, NSError *error) {
            self.profileImageView.image = [UIImage imageWithData:data];
        }];
    }
}
- (IBAction)onSearchButtonTapped:(id)sender
{
    
}


-(IBAction)unwindFromEditSegue:(UIStoryboardSegue *)sender
{
    
}

@end
