//
//  LoginViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/18/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation LoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.emailTextField.placeholder = @"Email";
    self.emailTextField.textAlignment = NSTextAlignmentCenter;
    
    self.passwordTextField.placeholder = @"Password";
    self.passwordTextField.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)onEmailEntered:(id)sender {
}

- (IBAction)onPasswordEntered:(id)sender {
}



@end
