//
//  XZZPhotosCollectionViewController.m
//  Thousand Words
//
//  Created by Zac on 6/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import "XZZPhotosCollectionViewController.h"
#import "XZZPhotoCollectionViewCell.h"

@interface XZZPhotosCollectionViewController ()

@end

@implementation XZZPhotosCollectionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UICollectionViewDataSource
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XZZPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = [UIImage imageNamed:@"Astronaut.jpg"];
    return cell;
}

//- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
//{
//    
//}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 5;
}

@end
