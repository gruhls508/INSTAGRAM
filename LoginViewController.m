//
//  LoginViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/18/14.
//  Copyright (c) 2014 Intradine. All rights reserved.
//

#import "LoginViewController.h"
#import "SearchViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onLoginPressed:(id)sender
{
    NSString *username = [self.usernameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] ==0 || [password length] == 0)
    {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username, password and email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertview show];
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                SearchViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"searchVC"];
            }
        }];
    }
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if ([identifier isEqualToString:@"Login"]) {
        if ([PFUser currentUser]) {
            return YES;
        } else if (![PFUser currentUser]){
            return NO;
        }
    }
    return NO;
}

- (IBAction)onUsernameInput:(id)sender {
}
- (IBAction)onPasswordInput:(id)sender {
}





@end
