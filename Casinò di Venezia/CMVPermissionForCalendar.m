//
//  CMVPermissionForCalendar.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVPermissionForCalendar.h"
#import "MZFormSheetController.h"
#import "CMVAppDelegate.h"
#import "CMVPokerHourCellNew.h"

@interface CMVPermissionForCalendar ()

@end

@implementation CMVPermissionForCalendar

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)remindMe:(id)sender {
    [self permissionButtonPress:@"YesPermissionForCalendar"];
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    CMVEventKitController *eventKitController =appDelegate.eventKit;
    if ([self.controller isKindOfClass:[CMVPokerHourCellNew class]]) {
        [eventKitController addEventWithName:self.eventName startTime:self.startDate endTime:self.endDate description:nil eventURL:nil];
    } else {
    [eventKitController addEventWithName:self.cell.eventName.text startTime:self.cell.startDate endTime:self.cell.endDate description:self.cell.eventDescription.text eventURL:self.cell.eventURL];
    }
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        
    }];
}

- (IBAction)noThanks:(id)sender {
    [self permissionButtonPress:@"NoPermissionForCalendar"];
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        
    }];
}

-(void)permissionButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
   
        //[tracker set:kGAIScreenName value:@"Stopwatch"];
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"PERMISSIONS"
                                                              action:@"press"
                                                               label:type
                                                               value:nil] build]];
   
    [tracker set:kGAIScreenName value:nil];
}
@end
