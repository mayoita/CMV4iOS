//
//  CMVDataClass.h
//  CMV
//
//  Created by Massimo Moro on 18/05/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMVDataClass : NSObject

@property(nonatomic)NSUInteger location;


+(CMVDataClass *)getInstance;

@end
