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
    NSString *name = self.nameField.text;
    NSString *website = self.websiteField.text;

    PFObject *userInfo = [PFObject objectWithClassName:@"User"];
    [userInfo saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            NSLog(@"%@", [error userInfo]);
        } else {
            [userInfo setObject:name forKey:@"name"];
            [userInfo setObject:website forKey:@"website"];

        }
    }];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end