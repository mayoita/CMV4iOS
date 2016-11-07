//
//  CMVCheckWeekDay.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 18/08/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVCheckWeekDay.h"

@implementation CMVCheckWeekDay

+(NSMutableDictionary *)checkWeekDAy {
    NSMutableDictionary *dictionary=[[NSMutableDictionary alloc] init];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *comps = [gregorian components:NSWeekdayCalendarUnit fromDate:[NSDate date]];
    
    NSDate *currentDate = [NSDate date];
    NSCalendar* calendar = [NSCalendar currentCalendar];
    NSDateComponents* components = [calendar components:NSYearCalendarUnit|NSMonthCalendarUnit|NSDayCalendarUnit fromDate:currentDate]; // Get necessary date components

    int weekday = [comps weekday];
   
    [dictionary setObject:[NSNumber numberWithInteger:[components month]] forKey:@"month"];
    [dictionary setObject:[NSNumber numberWithInteger:[components day]] forKey:@"day"];
    [dictionary setObject:[NSNumber numberWithInteger:weekday] forKey:@"weekday"];
    
    return dictionary;

}
@end
