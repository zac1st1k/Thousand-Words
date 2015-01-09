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
@property (strong, nonatomic) CIContext *context;

@end

@implementation XZZFiltersConllectionViewController

- (NSMutableArray *)filters
{
    if (!_filters) {
        _filters = [[NSMutableArray alloc] init];
    }
    return _filters;
}

- (CIContext *)context
{
    if (!_context) {
        _context = [CIContext contextWithOptions:nil];
    }
    return _context;
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
//    for (CIFilter *filter in [[self class] photoFilters]) {
//        [self.filters addObject:filter];
//    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Helpers

+ (NSArray *)photoFilters
{
    CIFilter *sepia = [CIFilter filterWithName:@"CISepiaTone" keysAndValues:nil];
    CIFilter *blur = [CIFilter filterWithName:@"CIGaussianBlur" keysAndValues:kCIInputRadiusKey, @1, nil];
    CIFilter *colorClamp = [CIFilter filterWithName:@"CIColorClamp" keysAndValues:@"inputMaxComponents", [CIVector vectorWithX:0.9 Y:0.9 Z:0.9 W:0.9], @"inputMinComponents", [CIVector vectorWithX:0.2 Y:0.2 Z:0.2 W:0.2], nil];
    CIFilter *instant = [CIFilter filterWithName:@"CIPhotoEffectInstant" keysAndValues:nil];
    CIFilter *noir = [CIFilter filterWithName:@"CIPhotoEffectNoir" keysAndValues:nil];
    CIFilter *vignette = [CIFilter filterWithName:@"CIVignetteEffect" keysAndValues:nil];
    CIFilter *colorControls = [CIFilter filterWithName:@"CIColorControls" keysAndValues:kCIInputSaturationKey, @0.5, nil];
    CIFilter *transfer = [CIFilter filterWithName:@"CIPhotoEffectTransfer" keysAndValues:nil];
    CIFilter *unsharpen = [CIFilter filterWithName:@"CIUnsharpMask" keysAndValues:nil];
    CIFilter *monochrome = [CIFilter filterWithName:@"CIColorMonochrome" keysAndValues:nil];
    NSArray *allFilters = @[sepia, blur, colorClamp, instant, noir, vignette, colorControls, transfer, unsharpen, monochrome];
    return allFilters;
    
}

- (UIImage *)filteredImageFromImage:(UIImage *)image andFilter:(CIFilter *)filter
{
    CIImage *unfilteredImage = [[CIImage alloc] initWithCGImage:image.CGImage];
    [filter setValue:unfilteredImage forKey:kCIInputImageKey];
    CIImage *filteredImage = [filter outputImage];
    CGRect extent = [filteredImage extent];
    CGImageRef cgImage = [self.context createCGImage:filteredImage fromRect:extent];
    UIImage *finalImage = [UIImage imageWithCGImage:cgImage];
    return finalImage;
}

#pragma mark - UICollectionVIew Datasource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XZZPhotoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Photo Cell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    cell.imageView.image = [self filteredImageFromImage:self.photo.image andFilter:self.filters[indexPath.row]];
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

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    XZZPhotoCollectionViewCell *selectedCell = (XZZPhotoCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.photo.image = selectedCell.imageView.image;
    NSError *error = nil;
    if (![[self.photo managedObjectContext] save:&error]) {
        NSLog(@"%@", error);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
