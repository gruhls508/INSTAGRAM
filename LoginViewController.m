//
//  LoginViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/18/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.usernameTextField.placeholder = @"Email";
    self.usernameTextField.textAlignment = NSTextAlignmentCenter;
    
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)onLoginPressed:(id)sender
{
    NSString *username = [self.usernameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    NSString *password = [self.passwordTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] ==0 || [password length] == 0)
    {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username, password" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertview show];
    }
    else {
        [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
            if (error) {
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Sorry" message:[error.userInfo objectForKey:@"error"] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alertView show];
            }
            else {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
        }];
    }

}




@end
