//
//  MenuFireBase.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/10/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

#import "MenuFireBase.h"
#import "Firebase.h"


@interface MenuFireBase (){
    FIRDatabaseHandle _refHandle;
}
@property (nonatomic, strong) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) FIRStorageReference *storageRef;

@end
@implementation MenuFireBase

-(id)init:(FIRDataSnapshot *)snapshot {
    self = [super init];

    return self;
}

-(id)initWithSnapshoot:(FIRDataSnapshot *)snapshot andCollectionView:(UICollectionView *)controller{
    self = [super init];
    if (self) {
        _storageRef = [[FIRStorage storage] referenceForURL:@"gs://cmv-gioco.appspot.com/Chief"];
        self.dateFormatter = [NSDateFormatter new];
        self.dateFormatter.dateStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.timeStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.locale = [NSLocale currentLocale];
        [self.dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
      
        
        if (snapshot.value[@"StartDate"]) {
            self.StartDate= snapshot.value[@"StartDate"];
        } else {
            self.StartDate= nil;
        }
        if (snapshot.value[@"EndDate"]) {
            self.EndDate= snapshot.value[@"EndDate"];
        } else {
            self.EndDate= nil;
        }
        if (snapshot.value[@"Starters"]) {
            self.Starters= snapshot.value[@"Starters"];
        } else {
            self.Starters= nil;
        }
        if (snapshot.value[@"FirstCourse"]) {
            self.FirstCourse= snapshot.value[@"FirstCourse"];
        } else {
            self.FirstCourse= nil;
        }
        if (snapshot.value[@"SecondCourse"]) {
            self.SecondCourse= snapshot.value[@"SecondCourse"];
        } else {
            self.SecondCourse= nil;
        }
        if (snapshot.value[@"Dessert"]) {
            self.Dessert= snapshot.value[@"Dessert"];
        } else {
            self.Dessert= nil;
        }
        if (snapshot.value[@"Chief"]) {
            self.Chief= snapshot.value[@"Chief"];
        } else {
            self.Chief= nil;
        }
        if (snapshot.value[@"ImageChief"]) {
            self.ImageChief= snapshot.value[@"ImageChief"];
        } else {
            self.ImageChief= nil;
        }
        [controller reloadData];
        
    }
    return self;
}

-(NSDate *)StartDate {
    
    return [self.dateFormatter dateFromString:_StartDate];;
}
-(NSDate *)EndDate {
    
    return [self.dateFormatter dateFromString:_EndDate];;
}
-(NSArray *)Starters {
    if (!_Starters) {
        
        return [NSArray array];
    } else {
        return _Starters; //[NSJSONSerialization JSONObjectWithData:[_TournamentEvent dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    }
}
-(NSArray *)FirstCourse {
    if (!_FirstCourse) {
        
        return [NSArray array];
    } else {
        return _FirstCourse; //[NSJSONSerialization JSONObjectWithData:[_TournamentEvent dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    }
}
-(NSArray *)SecondCourse {
    if (!_SecondCourse) {
        
        return [NSArray array];
    } else {
        return _SecondCourse; //[NSJSONSerialization JSONObjectWithData:[_TournamentEvent dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    }
}
-(NSArray *)Dessert {
    if (!_Dessert) {
        
        return [NSArray array];
    } else {
        return _Dessert; //[NSJSONSerialization JSONObjectWithData:[_TournamentEvent dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
    }
}


    

@end
