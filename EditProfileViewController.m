//
//  EditProfileViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/19/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "EditProfileViewController.h"

@interface EditProfileViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *publicInfoTableView;
@property PFUser *currentUser;
@property NSMutableArray *userData;

@end

@implementation EditProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.currentUser = [PFUser currentUser];
    NSLog(@"%@", self.currentUser);
    self.userData = [NSMutableArray arrayWithObjects:@"name", self.currentUser.username, @"website", @"bio", nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID"];
    
    cell.textLabel.text = [self.userData objectAtIndex:indexPath.row];
    
    
    return cell;
}

- (IBAction)onDoneButtonPressed:(id)sender {
}
- (IBAction)onPrivacySwitchFlipped:(id)sender {
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end