//
//  XZZPhotosCollectionViewController.h
//  Thousand Words
//
//  Created by Zac on 6/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Album.h"

@interface XZZPhotosCollectionViewController : UICollectionViewController

@property (strong, nonatomic) Album *album;

- (IBAction)cameraBarButtonPressed:(UIBarButtonItem *)sender;

@end
