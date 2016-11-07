//
//  PokerFireBase.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/09/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

#import "PokerFireBase.h"
#import "Firebase.h"
@interface PokerFireBase () {
    FIRDatabaseHandle _refHandle;
}
@property (nonatomic, strong) NSDateFormatter *dateFormatter;

@end

@implementation PokerFireBase
-(id)init{
    self = [super init];
    if (self) {
        self.dateFormatter = [NSDateFormatter new];
        self.dateFormatter.dateStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.timeStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.locale = [NSLocale currentLocale];
        [self.dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
        
        
    }
    return self;
}
-(NSDate *)StartDate {
    
    return [self.dateFormatter dateFromString:_StartDate];;
}
-(NSDate *)EndDate {
    
    return [self.dateFormatter dateFromString:_EndDate];;
}
-(NSArray *)PokerData {
    if (!_PokerData) {
        
        return [NSArray array];
    } else {
        return _PokerData;
    }
}
-(NSArray *)TournamentEvent {
    if (!_TournamentEvent) {
        
        return [NSArray array];
    } else {
        return _TournamentEvent;
    }
}
-(NSArray *)TournamentsRules {
    if (!_TournamentRules) {
        
        return [NSArray array];
    } else {
        return _TournamentRules;
    }
}
@end
