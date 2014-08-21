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
    NSString *name = self.nameField.text;
    NSString *website = self.websiteField.text;

    PFObject *userInfo = [PFObject objectWithClassName:@"UserInfo"];
    
    [userInfo setObject:name forKey:@"name"];
    [userInfo setObject:website forKey:@"website"];
    
    PFRelation *relation1 = [self.currentUser relationForKey:@"name"];
    [relation1 addObject:userInfo];
    PFRelation *relation2 = [self.currentUser relationForKey:@"website"];
    [relation2 addObject:userInfo];
    [self.currentUser saveEventually];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end