//
//  CMVEventKitController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 05/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVEventKitController.h"
#import "CMVAppDelegate.h"


@implementation CMVEventKitController
@synthesize eventStore=_eventStore;
- (id) init {
    self = [super init];
 
    if (self) {
        _eventStore = [[EKEventStore alloc] init];

    }
    return self;
}

-(EKEventStore *)eventStore {
    if (!_eventStore) {
         _eventStore = [[EKEventStore alloc] init];
    }
    return _eventStore;
}

- (void) addEventWithName:(NSString*) eventName
                startTime:(NSDate*) startDate
                  endTime:(NSDate*) endDate
              description:(NSString*)description
                 eventURL:(NSString*)eventURL {
    
   
    
    [self.eventStore requestAccessToEntityType:EKEntityTypeEvent
                                completion:^(BOOL granted, NSError *error) {
                                    if (granted) {
                                        //1. Create an Event
                                        EKEvent *event = [EKEvent
                                                          eventWithEventStore:self.eventStore];
                                        
                                        //2. Set the title
                                        event.title = eventName;
                                        
                                        //3. Set the start and end date
                                        event.startDate = startDate;
                                        event.endDate = endDate;
                                        
                                        //4. Set an alarm (This is optional)
                                        EKAlarm *alarm = [EKAlarm alarmWithRelativeOffset:-1800];
                                        [event addAlarm:alarm];
                                        
                                        //5. Add a note (This is optional)
                                        event.notes = description;
                                        
                                        //6. Add event URL
                                        event.URL= [NSURL URLWithString:eventURL];
                                        
                                        
                                        //7. Specify the calendar to store the event
                                       event.calendar=self.eventStore.defaultCalendarForNewEvents;
                                        
                                        
                                        
                                        
                                        
                                        NSError *err;
                                        BOOL success = [self.eventStore
                                                        saveEvent:event
                                                        span:EKSpanThisEvent
                                                        commit:YES error:&err];
                                       
                                        
                                        if (success) {
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                                UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                                                                  message:NSLocalizedString(@"The event was added to the calendar.", nil)
                                                                                                 delegate:nil
                                                                                        cancelButtonTitle:@"OK"
                                                                                        otherButtonTitles:nil];
                                                [message show];
                                            });
                                            
                                            
                                        } else {
                                            NSLog(@"There was an error saving event: %@", err);
                                            dispatch_async(dispatch_get_main_queue(), ^{
                                            UIAlertView *message = [[UIAlertView alloc] initWithTitle:@""
                                                                                              message:@"There was an error saving event."
                                                                                             delegate:nil
                                                                                    cancelButtonTitle:@"OK"
                                                                                    otherButtonTitles:nil];
                                            [message show];
                                                });
                                        }
                                        
                                    } else {
                                        NSLog(@"Event access not granted: %@", error);
                                    }
                                }];
   
    
 
}


@end
