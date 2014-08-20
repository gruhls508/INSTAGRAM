//
//  EditProfileViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/19/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController ()
@property (weak, nonatomic) IBOutlet UITableView *publicInfoTableView;
@property (weak, nonatomic) IBOutlet UITableView *privateInfoTableView;

@end

@implementation EditProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

- (IBAction)onCancelButtonPressed:(id)sender {
}
- (IBAction)onDoneButtonPressed:(id)sender {
}
- (IBAction)onPrivacySwitchFlipped:(id)sender {
}

@end
