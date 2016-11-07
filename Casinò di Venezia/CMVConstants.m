//
//  CMVConstants.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVConstants.h"

@implementation CMVConstants
const CLLocationCoordinate2D PALAZZO_LOREDAN_VENDRAMIN = {45.44284, 12.32988};
const CLLocationCoordinate2D CA_NOGHERA = {45.520532, 12.358032};

+(NSArray *)labelWidth {
    static NSArray *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = @[@30,
                @100,
                @50,
                @50,
                @30,
                @20,
                @20,
                @100
                ];
    });
    return inst;
}

+(NSArray *)labelText {
    static NSArray *inst = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        inst = @[@"ORA",
                 @"TORNEO",
                 @"BUY-IN",
                 @"STACK",
                 @"BLINDS",
                 @"LATE",
                 @"CAP",
                 @"NOTE"
                 ];
    });
    return inst;
}
@end
