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

@property (weak, nonatomic) IBOutlet UIImageView *displayAddedImageView;
@property (weak, nonatomic) IBOutlet UITextField *captionField;

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


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    [self dismissViewControllerAnimated:YES completion:^{
        self.displayAddedImageView.image = (UIImage *) [info valueForKey:UIImagePickerControllerOriginalImage];
    }];
}

-(IBAction)onPostPhoto:(id)sender
{
    NSData *fileData = UIImagePNGRepresentation(self.displayAddedImageView.image);
    NSString *fileName = @"image.png";
    NSString *fileType = @"image";
    NSString *description = self.captionField.text;
    
    PFFile *file = [PFFile fileWithName:fileName data:fileData];
    [file saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (error) {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An error occurred"
                                                                message:@"Please try again"
                                                               delegate:self
                                                      cancelButtonTitle:@"OK"
                                                      otherButtonTitles: nil];
            [alertView show];
        }
        else {
            PFObject *post = [PFObject objectWithClassName:@"Post"];
            [post setObject:file forKey:@"file"];
            [post setObject:fileType forKey:@"fileType"];
            [post setObject:description forKey:@"description"];
            
            [post saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
                if (error) {
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"An error occurred"
                                                                        message:@"Please try again"
                                                                       delegate:self
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles: nil];
                    [alertView show];
                }
            }];
        }
    }];
}
- (IBAction)onCommentPressed:(id)sender
{
    
}

@end