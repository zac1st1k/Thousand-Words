//
//  XZZPictureDataTransformer.m
//  Thousand Words
//
//  Created by Zac on 7/01/2015.
//  Copyright (c) 2015 1st1k. All rights reserved.
//

#import "XZZPictureDataTransformer.h"

@implementation XZZPictureDataTransformer

+ (Class)transformedValueClass
{
    return [NSData class];
}

+ (BOOL)allowsReverseTransformation
{
    return YES;
}

- (id)transformedValue:(id)value
{
    return UIImagePNGRepresentation(value);
}

- (id)reverseTransformedValue:(id)value
{
    UIImage *image = [UIImage imageWithData:value];
    return image;
}

@end
