//
//  CMVEventKitController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 05/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <EventKit/EventKit.h>



@interface CMVEventKitController : NSObject

@property (strong, readonly) EKEventStore *eventStore;
@property (assign, readonly) BOOL eventAccess;
@property (assign, readonly) BOOL reminderAccess;



-(void)addEventWithName:(NSString*)eventName startTime:(NSDate*)startDate endTime:(NSDate*)endDate description:(NSString*)description eventURL:(NSString*)eventURL;

@end

