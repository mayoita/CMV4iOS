//
//  CMVEventKitShared.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVEventKitShared.h"
#import "MZFormSheetController.h"
#import "MZModalViewController.h"
#import "CMVPermissionForCalendar.h"
#import "CMVAppDelegate.h"

@implementation CMVEventKitShared

-(void)setUpEvent:(CMVSwipeTableViewCell *)cell {
    
    
    EKAuthorizationStatus status = [EKEventStore authorizationStatusForEntityType:EKEntityTypeEvent];
    if (status==EKAuthorizationStatusAuthorized) {
        CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
        CMVEventKitController *eventKitController =appDelegate.eventKit;
        [eventKitController addEventWithName:cell.eventName.text startTime:cell.startDate endTime:cell.endDate description:cell.eventDescription.text eventURL:cell.eventURL];
    } else {
        //UIStoryboard    *st = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
        UIStoryboard    *st;
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) { // is iPad
            st = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:Nil];
        } else {
            st = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:Nil];
        }
        CMVPermissionForCalendar *vc = [st instantiateViewControllerWithIdentifier:@"Alert"];
        
        vc.cell=cell;
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:vc];
        
        [[MZFormSheetBackgroundWindow appearance] setBackgroundBlurEffect:YES];
        [[MZFormSheetBackgroundWindow appearance] setBlurRadius:5.0];
        [[MZFormSheetBackgroundWindow appearance]setBackgroundColor:(__bridge CGColorRef)([UIColor clearColor])];
        
        formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromTop;
        formSheet.shadowRadius = 2.0;
        formSheet.shadowOpacity = 0.3;
        formSheet.shouldDismissOnBackgroundViewTap = NO;
        //formSheet.shouldCenterVerticallyWhenKeyboardAppears = YES;
        formSheet.presentedFormSheetSize = CGSizeMake(245, 350);
        formSheet.cornerRadius=0;
        
        if (iPAD) {
            formSheet.presentedFormSheetSize = CGSizeMake(490, 700);
        }
        
        [formSheet presentAnimated:YES completionHandler:^(UIViewController *presentedFSViewController) {
            
            
        }];
    }
    
}
@end
