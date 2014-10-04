//
//  SignUpViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/18/14.
//  Copyright (c) 2014 Intradine. All rights reserved.
//

#import "SignUpViewController.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UITextField *emailField;

@end

@implementation SignUpViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)signup:(id)sender {
    
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] ==0 || [password length] == 0 || [email length] == 0)
    {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username, password, and email address" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertview show];
    }
    
    else
    {
        PFUser *newUser = [PFUser user];
        newUser.username = username;
        newUser.password = password;
        newUser.email = email;
        NSLog(@"%@ %@ %@", newUser.username, newUser.password, newUser.email);
        
        [newUser signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
                NSLog(@"did it?");
            }
        }];
    }
}
- (IBAction)onSignUp:(id)sender
{
    
}

- (IBAction)onUsernameInput:(id)sender
{
}

- (IBAction)onPasswordInput:(id)sender
{
}

- (IBAction)onEmailInput:(id)sender
{
}


@end
