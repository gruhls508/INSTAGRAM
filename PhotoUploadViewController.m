//
//  PhotoUploadViewController.m
//  INSTAGRAM
//
//  Created by Glen Ruhl on 8/19/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "PhotoUploadViewController.h"

@interface PhotoUploadViewController () <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property UIImagePickerController *imagePicker;



//  THE FOLLOWING PROPERTY NEEDS TO BE HOOKED UP TO THE IMAGE CONTAINER THAT WILL DISPLAY IN THE VIEW

@property (weak, nonatomic) IBOutlet UIImageView *displayAddedImageView;


@end

@implementation PhotoUploadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.imagePicker = [UIImagePickerController new];
    
    
    self.imagePicker.delegate = self;
    self.imagePicker.navigationController.delegate = self;
}


+(BOOL)isSourceTypeAvailable:(UIImagePickerControllerSourceType)
UIImagePickerControllerSourceTypePhotoLibrary
{
    return YES;
}

- (IBAction)onAddImage:(id)sender
{
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}


@end
