//
//  CMVSharedClass.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 18/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSharedClass.h"

#import "CMVAppDelegate.h"

@implementation CMVSharedClass




-(NSMutableArray *)retrieveSlotsEvents:(NSString *)className eventType:(int)eventChar carousel:(iCarousel *) myCaraousel{
    NSMutableArray *allObjects = [NSMutableArray array];
    NSArray *eventStrings = [CMVSharedClass eventTypeStrings];
    NSString *eventType = eventStrings[eventChar];
    
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"isSlotEvents == true"];
    allObjects=[appDelegate.storage filteredArrayUsingPredicate:pred].mutableCopy;
    [myCaraousel reloadData];
    
    
    return allObjects;
}

+ (NSArray *)eventTypeStrings
{
    return @[@"E",@"A",@"T"];
}

+ (NSArray *)officeTypeString
{
    return @[@"VE",@"CN"];
}
@end
