//
//  TournamentFireBase.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 27/09/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

#import "TournamentFireBase.h"
#import "Firebase.h"
@interface TournamentFireBase () {
    FIRDatabaseHandle _refHandle;
}
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@end
@implementation TournamentFireBase
-(id)init{
    self = [super init];
    if (self) {
        self.dateFormatter = [NSDateFormatter new];
        self.dateFormatter.dateStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.timeStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.locale = [NSLocale currentLocale];
        [self.dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
        _storageRef = [[FIRStorage storage] referenceForURL:@"gs://cmv-gioco.appspot.com/Tournaments"];
        
    }
    return self;
}

-(NSDate *)StartDate {
    
    return [self.dateFormatter dateFromString:_StartDate];;
}
-(NSDate *)EndDate {
    
    return [self.dateFormatter dateFromString:_EndDate];;
}
-(UIImage *)ImageTournament {
    if ([_ImageTournament isKindOfClass:[NSString class]] ) {
        
        FIRStorageReference *starsRef = [self.storageRef child:_ImageTournament];
        // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
        [starsRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData* data, NSError* error){
            if (error != nil) {
                // Uh-oh, an error occurred!
            } else {
                // Data for "images/island.jpg" is returned
                
                _ImageTournament =  [UIImage imageWithData:data];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self.theTableView reloadData];
                });
            }
        }];
        return [UIImage imageNamed:@"640x408default.jpg"];
        
    } else {
        return _ImageTournament;
    }
    
}
-(NSArray *)TournamentEvent {
    if (!_TournamentEvent) {
        
        return [NSArray array];
    } else {
        return _TournamentEvent; //[NSJSONSerialization JSONObjectWithData:[_TournamentEvent dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    }
}
-(NSArray *)TournamentsRules {
    if (!_TournamentsRules) {
        
        return [NSArray array];
    } else {
        return _TournamentsRules; //[NSJSONSerialization JSONObjectWithData:[_TournamentsRules dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    }
}
@end
