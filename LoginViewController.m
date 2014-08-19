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
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;

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
    NSString *email = [self.emailTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if ([username length] ==0 || [password length] == 0)
    {
        UIAlertView *alertview = [[UIAlertView alloc] initWithTitle:@"Oops!" message:@"Make sure you enter a username, password and email" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [alertview show];
    }
    else {
        
        //  This will need to be changed in order to accept email as an argument in determining whether login was successful.
        
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
- (IBAction)onUsernameInput:(id)sender {
}
- (IBAction)onPasswordInput:(id)sender {
}

- (IBAction)onEmailInput:(id)sender {
}




@end
