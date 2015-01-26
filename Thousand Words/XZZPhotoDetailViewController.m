//
//  XZZPhotoDetailViewController.m
//  Thousand Words
//
//  Created by Zac on 7/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import "XZZPhotoDetailViewController.h"
#import "Photo.h"
#import "XZZFiltersConllectionViewController.h"

@interface XZZPhotoDetailViewController ()

@end

@implementation XZZPhotoDetailViewController

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    self.imageView.image = self.photo.image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"Filters Segue"]) {
        if ([segue.destinationViewController isKindOfClass:[XZZFiltersConllectionViewController class]]) {
            XZZFiltersConllectionViewController *targetViewController = segue.destinationViewController;
            targetViewController.photo = self.photo;
        }
    }
}

- (IBAction)addFilterButtonPressed:(UIButton *)sender {
}

- (IBAction)deleteButtonPressed:(UIButton *)sender {
    [[self.photo managedObjectContext] deleteObject:self.photo];
    NSLog(@"%@ %@", self.photo, [self.photo managedObjectContext]);
    NSError *error = nil;
    
    // debug for simulator
    [[self.photo managedObjectContext] save:&error];
    if (error) {
        NSLog(@"error");
    }
    
    [self.navigationController popViewControllerAnimated:YES];

}
@end
