//
//  CommentsViewController.m
//  INSTAGRAM
//
//  Created by Patrick Hogan on 8/20/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "CommentsViewController.h"

@interface CommentsViewController ()

@end

@implementation CommentsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}
- (IBAction)onComment:(id)sender
{
    PFObject *comment = [PFObject objectWithClassName:@"Comment"];
}

@end
