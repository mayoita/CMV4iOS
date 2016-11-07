//
//  CMVPermissionForPushNotification.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVPermissionForPushNotification.h"
#import "MZFormSheetController.h"
#import "CMVAppDelegate.h"

@interface CMVPermissionForPushNotification ()

@end

@implementation CMVPermissionForPushNotification

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
- (IBAction)notifyMe:(id)sender {
    [self permissionButtonPress:@"YesPermissionForPush"];
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        
    }];
    // Register for push notifications
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)])
    {
        // iOS 8 Notifications
        UIUserNotificationSettings *settings =
        [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert |
         UIUserNotificationTypeBadge |
         UIUserNotificationTypeSound
                                          categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    else
    {
        // iOS < 8 Notifications
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIRemoteNotificationTypeBadge | UIRemoteNotificationTypeAlert | UIRemoteNotificationTypeSound)];
    }
   
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:@"YES"
                                                            forKey:@"enableGeofencingNotification"];
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];
    
    CMVAppDelegate *appdelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    [appdelegate proximityMonitoring:defaults];
    [appdelegate venicerRegionMonitoring:defaults];
}
- (IBAction)noThanks:(id)sender {
    [self permissionButtonPress:@"NoPermissionForPush"];
    [self mz_dismissFormSheetControllerAnimated:YES completionHandler:^(MZFormSheetController *formSheetController) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        [userDefaults setBool:NO forKey:@"permissionForLocationAndNotification"];
        [userDefaults synchronize];
        
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
