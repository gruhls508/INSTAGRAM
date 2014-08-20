//
//  EditProfileViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/19/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()
@property PFUser *currentUser;

@end

@implementation EditProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentUser = [PFUser currentUser];
    NSLog(@"%@", self.currentUser);

}

- (IBAction)onDoneButtonPressed:(id)sender
{

}
- (IBAction)onPrivacySwitchFlipped:(id)sender
{
    
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end