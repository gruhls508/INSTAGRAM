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
    [self.currentUser addObject:self.nameField.text forKey:@"name"];
    [self.currentUser addObject:self.websiteField.text forKey:@"website"];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end