//
//  EventsFireBase.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 23/09/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

#import "EventsFireBase.h"
#import "Firebase.h"
@interface EventsFireBase () {
     FIRDatabaseHandle _refHandle;
}
 @property (nonatomic, strong) NSDateFormatter *dateFormatter;

@property (strong, nonatomic) FIRStorageReference *storageRef;
@end
@implementation EventsFireBase


-(id)initWithSnapshot: (FIRDataSnapshot *)item {
    self = [super init];
    if (self) {
        self.dateFormatter = [NSDateFormatter new];
        self.dateFormatter.dateStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.timeStyle = kCFDateFormatterShortStyle;
        self.dateFormatter.locale = [NSLocale currentLocale];
        [self.dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
        [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
        
        _storageRef = [[FIRStorage storage] referenceForURL:@"gs://cmv-gioco.appspot.com/Events"];
        
    if (item.value[@"Name"]) {
        self.Name= item.value[@"Name"];
    } else {
        self.Name= nil;
    }if (item.value[@"NameIT"]) {
        self.NameIT= item.value[@"NameIT"];
    } else {
        self.NameIT= nil;
    }
    if (item.value[@"NameES"]) {
        self.NameES= item.value[@"NameES"];
    } else {
        self.NameES= nil;
    }
    if (item.value[@"NameFR"]) {
        self.NameFR= item.value[@"NameFR"];
    } else {
        self.NameFR= nil;
    }
    if (item.value[@"NameDE"]) {
        self.NameDE= item.value[@"NameDE"];
    } else {
        self.NameDE= nil;
    }
    if (item.value[@"NameRU"]) {
        self.NameRU= item.value[@"NameRU"];
    } else {
        self.NameRU= nil;
    }
    if (item.value[@"NameZH"]) {
        self.NameZH= item.value[@"NameZH"];
    } else {
        self.NameZH= nil;
    }
    if (item.value[@"Description"]) {
        self.Description= item.value[@"Description"];
    } else {
        self.Description= nil;
    }
    if (item.value[@"DescriptionIT"]) {
        self.DescriptionIT= item.value[@"DescriptionIT"];
    } else {
        self.DescriptionIT= nil;
    }
    
    if (item.value[@"DescriptionDE"]) {
        self.DescriptionDE= item.value[@"DescriptionDE"];
    } else {
        self.DescriptionDE= nil;
    }
    
    if (item.value[@"DescriptionFR"]) {
        self.DescriptionFR= item.value[@"DescriptionFR"];
    } else {
        self.DescriptionFR= nil;
    }
    if (item.value[@"DescriptionES"]) {
        self.DescriptionES= item.value[@"DescriptionES"];
    } else {
        self.DescriptionES= nil;
    }
    if (item.value[@"DescriptionRU"]) {
        self.DescriptionRU= item.value[@"DescriptionRU"];
    } else {
        self.DescriptionRU= nil;
    }
    if (item.value[@"DescriptionZH"]) {
        self.DescriptionZH= item.value[@"DescriptionZH"];
    } else {
        self.DescriptionZH= nil;
    }
    if (item.value[@"StartDate"]) {
        self.StartDate= item.value[@"StartDate"];
    } else {
        self.StartDate= nil;
    }
    if (item.value[@"EndDate"]) {
        self.EndDate= item.value[@"EndDate"];
    } else {
        self.EndDate= nil;
    }
    if (item.value[@"memo"]) {
        self.memo= item.value[@"memo"];
    } else {
        self.memo= nil;
    }
    if (item.value[@"memoIT"]) {
        self.memoIT= item.value[@"memoIT"];
    } else {
        self.memoIT= nil;
    }
    if (item.value[@"memoES"]) {
        self.memoES= item.value[@"memoES"];
    } else {
        self.memoES= nil;
    }
    if (item.value[@"memoFR"]) {
        self.memoFR= item.value[@"memoFR"];
    } else {
        self.memoFR= nil;
    }
    if (item.value[@"memoDE"]) {
        self.memoDE= item.value[@"memoDE"];
    } else {
        self.memoDE= nil;
    }
    if (item.value[@"memoRU"]) {
        self.memoRU= item.value[@"memoRU"];
    } else {
        self.memoRU= nil;
    }
    if (item.value[@"memoZH"]) {
        self.memoZH= item.value[@"memoZH"];
    } else {
        self.memoZH= nil;
    }
    if (item.value[@"ImageName"]) {
        self.ImageName= item.value[@"ImageName"];
    } else {
        self.ImageName= nil;
    }
    if (item.value[@"ImageEvent1"]) {
        self.ImageEvent1= item.value[@"ImageEvent1"];
    } else {
        self.ImageEvent1= nil;
    }
    if (item.value[@"ImageEvent2"]) {
        self.ImageEvent2= item.value[@"ImageEvent2"];
    } else {
        self.ImageEvent2= nil;
    }
    if (item.value[@"ImageEvent3"]) {
        self.ImageEvent3= item.value[@"ImageEvent3"];
    } else {
        self.ImageEvent3= nil;
    }
    if (item.value[@"office"]) {
        self.office= item.value[@"office"];
    } else {
        self.office= nil;
    }
    if (item.value[@"isSlotEvents"]) {
        self.isSlotEvents= item.value[@"isSlotEvents"];
    } else {
        self.isSlotEvents= nil;
    }
    if (item.value[@"eventType"]) {
        self.eventType= item.value[@"eventType"];
    } else {
        self.eventType= nil;
    }
    if (item.value[@"URL"]) {
        self.URL= item.value[@"URL"];
    } else {
        self.URL= nil;
    }
    if (item.value[@"URLBook"]) {
        self.URLBook= item.value[@"URLBook"];
    } else {
        self.URLBook= nil;
    }
    if (item.value[@"Book"]) {
        self.Book= item.value[@"Book"];
    } else {
        self.Book= nil;
    }
    }
    return self;
}

-(NSDate *)StartDate {
    
    return [self.dateFormatter dateFromString:_StartDate];;
}
-(NSDate *)EndDate {
    
    return [self.dateFormatter dateFromString:_EndDate];;
}

-(UIImage *)ImageName {
    if ([_ImageName isKindOfClass:[NSString class]] ) {
    
        FIRStorageReference *starsRef = [self.storageRef child:_ImageName];
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            [starsRef dataWithMaxSize:1 * 1024 * 1024 completion:^(NSData* data, NSError* error){
                if (error != nil) {
                    // Uh-oh, an error occurred!
                } else {
                    // Data for "images/island.jpg" is returned
                    
                    _ImageName =  [UIImage imageWithData:data];
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.theTableView reloadData];
                    });
                }
            }];
        return [UIImage imageNamed:@"640x408default.jpg"];
    
    } else {
    return _ImageName;
    }
    
}

@end
