//
//  CMVSharedClass.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 18/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iCarousel.h"

@interface CMVSharedClass : NSObject

-(NSMutableArray *)retrieveSlotsEvents:(NSString *)className eventType:(int)eventChar carousel:(iCarousel *) myCaraousel;

+ (NSArray *)eventTypeStrings;
+ (NSArray *)officeTypeString;
@end
