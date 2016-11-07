//
//  MenuFireBase.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/10/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Firebase.h"

@interface MenuFireBase : NSObject
@property (nonatomic, strong) NSDate *StartDate;
@property (nonatomic, strong) NSDate *EndDate;
@property (nonatomic, strong) NSString *Starters;
@property (nonatomic, strong) NSString *FirstCourse;
@property (nonatomic, strong) NSString *SecondCourse;
@property (nonatomic, strong) NSString *Dessert;
@property (nonatomic, strong) NSString *ImageChief;
@property (nonatomic, strong) NSString *Chief;

-(id)initWithSnapshoot:(FIRDataSnapshot *)snapshot andCollectionView:(UICollectionView *)controller;
@end
