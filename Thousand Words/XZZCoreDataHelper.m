//
//  XZZCoreDataHelper.m
//  Thousand Words
//
//  Created by Zac on 5/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import "XZZCoreDataHelper.h"

@implementation XZZCoreDataHelper

+ (NSManagedObjectContext *)managedObjectContext;
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

@end
