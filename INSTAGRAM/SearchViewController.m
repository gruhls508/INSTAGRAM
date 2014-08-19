//
//  SearchViewController.m
//  INSTAGRAM
//
//  Created by Patrick Hogan on 8/18/14.
//  Copyright (c) 2014 MM. All rights reserved.
//

#import "SearchViewController.h"
#import "ImageCell.h"

@interface SearchViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property UICollectionViewFlowLayout *flowLayout;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSArray *images;
@end

@implementation SearchViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.flowLayout = (UICollectionViewFlowLayout *)[self.collectionView collectionViewLayout];
    self.flowLayout = [[UICollectionViewFlowLayout alloc] init];
    self.collectionView.backgroundColor = [UIColor clearColor];
    self.flowLayout.minimumInteritemSpacing = 1.0f;
    self.flowLayout.minimumLineSpacing = 1.0f;
    [self.collectionView setCollectionViewLayout:self.flowLayout];
    self.collectionView.bounces = YES;
    [self.collectionView setShowsHorizontalScrollIndicator:NO];
    [self.collectionView setShowsVerticalScrollIndicator:NO];
    
    [self.flowLayout setItemSize:CGSizeMake(105, 105)];
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [self.collectionView reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.images.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.imageView.image = [self.images objectAtIndex:indexPath.row];
    
    return cell;
}

@end
