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
@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *websiteField;
@property PFRelation *infoRelation;

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
- (IBAction)onSaveButtonPressed:(id)sender
{
    [[PFUser currentUser] setObject:self.nameField.text forKey:@"name"];
    [[PFUser currentUser] setObject:self.websiteField.text forKey:@"website"];

    [self.currentUser addObject:self.nameField.text forKey:@"name"];
    [self.currentUser addObject:self.websiteField.text forKey:@"website"];
    

    [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"The information provided is not valid." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertview show];
        }
    }];

}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end