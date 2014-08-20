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

@end

@implementation ProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)onSearchButtonTapped:(id)sender {
}


-(IBAction)unwindFromEditSegue:(UIStoryboardSegue *)sender
{
    
}

@end
