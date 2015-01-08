//
//  XZZFiltersConllectionViewController.m
//  Thousand Words
//
//  Created by Zac on 8/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import "XZZFiltersConllectionViewController.h"
#import "XZZPhotoCollectionViewCell.h"
#import "Photo.h"

@interface XZZFiltersConllectionViewController ()

@property (strong, nonatomic) NSMutableArray *filters;

@end

@implementation XZZFiltersConllectionViewController

- (NSMutableArray *)filters
{
    if (!_filters) {
        _filters = [[NSMutableArray alloc] init];
    }
    return _filters;
}

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
    self.filters = [[[self class] photoFilters] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

+ (NSArray *)photoFilters
{
    CIFilter *sepia = [CIFilter filterWithName:@"CSISepiaTone" keysAndValues:nil];
    CIFilter *blur = [CIFilter filterWithName:@"CIGussianBlur" keysAndValues:nil];
    CIFilter *colorClamp = [CIFilter filterWithName:@"CIColorClamp" keysAndValues:@"inputMaxComponents", [CIVector vectorWithX:0.9 Y:0.9 Z:0.9 W:0.9], @"inputMinComponents", [CIVector vectorWithX:0.2 Y:0.2 Z:0.2 W:0.2], nil];
    CIFilter *instant = [CIFilter filterWithName:@"CIPhotoEffectInstant" keysAndValues:nil];
    CIFilter *noir = [CIFilter filterWithName:@"CIPhotoNoir" keysAndValues:nil];
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignetteEffect" keysAndValues:nil];
    CIFilter *colorControls = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputSaturationKey, @0.5, nil];
    CIFilter *transfer = [CIFilter filterWithName:@"CIPhotoEffectTransfer" keysAndValues:nil];
    CIFilter *unsharpen = [CIFilter filterWithName:@"CIUnsharpMask" keysAndValues:nil];
    CIFilter *monochrome = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:nil];
    NSArray *allFIlters = @[sepia, blur, colorClamp, instant, noir, vignette, colorControls, transfer, unsharpen, monochrome];
    return allFIlters;
}

#pragma mark - UICollectionVIew Datasource

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender
{
    XZZPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = self.photo.image;
    
    return cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  [self.filters count];
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

@end
