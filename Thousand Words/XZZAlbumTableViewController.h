//
//  XZZAlbumTableViewController.h
//  Thousand Words
//
//  Created by Zac on 4/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XZZAlbumTableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *albums;

- (IBAction)addAlbumBarButtom:(UIBarButtonItem *)sender;

@end
