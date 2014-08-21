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
    
//    Photo *photo = [Photo objectWithClassName:@"Photo"];
//    NSData *imageData = UIImagePNGRepresentation(self.imageView.image);
//    PFFile *photoFile = [PFFile fileWithData:imageData];
//    [photo setObject:[PFUser currentUser] forKey:@"user"];
//    [[PFUser currentUser] setObject:photoFile forKey:@"profilePic"];
//    [photo saveInBackground];


    [[PFUser currentUser] saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"The information provided is not valid." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertview show];
        }
    }];

    
//    [userInfo setObject:name forKey:@"name"];
//    [userInfo setObject:website forKey:@"website"];
    
//    PFRelation *relation1 = [self.currentUser relationForKey:@"name"];
//    [relation1 addObject:userInfo];
//    PFRelation *relation2 = [self.currentUser relationForKey:@"website"];
//    [relation2 addObject:userInfo];
//    [self.currentUser saveEventually];
}

-(BOOL)prefersStatusBarHidden
{
    return YES;
}

@end