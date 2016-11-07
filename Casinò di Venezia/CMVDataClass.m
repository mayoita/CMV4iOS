//
//  CMVDataClass.m
//  CMV
//
//  Created by Massimo Moro on 18/05/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import "CMVDataClass.h"

@implementation CMVDataClass
@synthesize location;

+(CMVDataClass *)getInstance {
    static dispatch_once_t pred;
    static CMVDataClass *instance =nil;
    
    dispatch_once(&pred, ^{
        instance = [[CMVDataClass alloc] init];
    });
    return instance;
}

@end
