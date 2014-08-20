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

@end

@implementation EditProfileViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    PFUser *currentUser = [PFUser currentUser];
    NSLog(@"%@", currentUser);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //  Want to test a method that will display the different req'd text labels in cells via a conditional that uses their indexes to determine which cell gets what. Going to try it with just the cell at index 0 and go from there.
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCellID"];
    
    
//    cell.textLabel.text = [self.placeHolderArray objectAtIndex:indexPath.row];
    
    return cell;
}



- (IBAction)onCancelButtonPressed:(id)sender {
}
- (IBAction)onDoneButtonPressed:(id)sender {
}
- (IBAction)onPrivacySwitchFlipped:(id)sender {
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

@end
