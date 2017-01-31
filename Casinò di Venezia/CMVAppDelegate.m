//
//  CMVAppDelegate.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 25/10/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
// Test 2

#import "Reachability.h"
#import "CMVAppDelegate.h"
#import "UINavigationController+MHDismissModalView.h"
#import "CMVMapViewController.h"
#import "CMVLocalize.h"

#import "CMVEventKitController.h"
#import "MZModalViewController.h"
#import "MZFormSheetController.h"
#import "CMVPermissionForPushNotification.h"
#import "ChimpKit.h"
#import "CMVMainTabbarController.h"
#import "GAI.h"

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "ECSlidingViewController.h"

#define PARSE_CLASS_NAME @"Events"
#define SavedHTTPCookiesKey @"SavedHTTPCookies"
#define MAX_RADIUS  2300.0f

#import "Firebase.h"
#import "EventsFireBase.h"

#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
@import UserNotifications;
#endif



//TODO: Set 120 for publishing
//TODO: Voice speed for iOS 8
//TODO: Remove Spark
static int const kGaDispatchPeriod = 20;
static NSString *const kGaPropertyId = @"UA-42477250-3";

@interface CMVAppDelegate ()<UNUserNotificationCenterDelegate, FIRMessagingDelegate> {
    FIRDatabaseHandle _refHandle;
    
}

@property (nonatomic)  CLLocationCoordinate2D region;
@property(nonatomic)int radius;
@property(nonatomic)float veniceRadius;
@property (strong, nonatomic)NSString *myObjectLocation;

@property(strong,nonatomic)CLRegion *veniceRegion;
@property(strong,nonatomic)CLRegion *veniceRegion6;
@property (strong, nonatomic) FIRDatabaseReference *refFireDatabase;
@property (strong, nonatomic) FIRStorageReference *storageRefPro;
@end
//AWSIdentityManager *identityManager;
//AWSCognito *syncClient;
//AWSCognitoDataset *dataset;
@implementation CMVAppDelegate
@synthesize locationManager = _locationManager;
@synthesize veniceRadius=_veniceRadius;




- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.showAD = true;
    _veniceRadius = MAX_RADIUS;
    
    [self StartRegisterForNotification:application];
    [FIRApp configure];
    FIRUser *user = [FIRAuth auth].currentUser;
    //Da usare quando non si riesce a fare il logout
   // NSError *signOutError;
    //BOOL status = [[FIRAuth auth] signOut:&signOutError];
   // if (!status) {
    //    NSLog(@"Error signing out: %@", signOutError);
        
  //  }
    if (user.uid == nil){
    [[FIRAuth auth]
     signInAnonymouslyWithCompletion:^(FIRUser *_Nullable user, NSError *_Nullable error) {
         // ...
         [[[[_refFireDatabase child:@"users"] child:user.uid] child:@"name"] setValue:@"Anonymous"];
         [[[[_refFireDatabase child:@"users"] child:user.uid] child:@"surname"] setValue:@"Test"];
         [[[[_refFireDatabase child:@"users"] child:user.uid] child:@"profileImageURL"] setValue:@""];
         [[[[_refFireDatabase child:@"users"] child:user.uid] child:@"isAnonymous"] setValue:@1];
     }];
    }
    // Add observer for InstanceID token refresh callback.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tokenRefreshNotification:)
                                                 name:kFIRInstanceIDTokenRefreshNotification object:nil];
    
    
    [self configureDatabase];
    NSArray *windows = [[UIApplication sharedApplication] windows];
    for(UIWindow *window in windows) {
        NSLog(@"window: %@",window.description);
        if(window.rootViewController == nil){
            UIViewController* vc = [[UIViewController alloc]initWithNibName:nil bundle:nil];
            window.rootViewController = vc;
        }
    }
    
    //Facebook init
    [[FBSDKApplicationDelegate sharedInstance] application:application didFinishLaunchingWithOptions:launchOptions];
    

    // Override point for customization after application launch.
    [[UIApplication sharedApplication] setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    
    //Helpshift

    [Helpshift installForApiKey:@"75b10c6c105e8bebefc95729c56e33ae" domainName:@"casinovenezia.helpshift.com" appID:@"casinovenezia_platform_20131218091253899-f3f796e2d4b9e99"];
    
    
    //Google Analitycs
    [GAI sharedInstance].trackUncaughtExceptions = YES;
    [[GAI sharedInstance].logger setLogLevel:kGAILogLevelError];
    [GAI sharedInstance].dispatchInterval = kGaDispatchPeriod;
    self.tracker = [[GAI sharedInstance] trackerWithTrackingId:kGaPropertyId];
    
    //Ask for permission
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"permissionForLocationAndNotification"]) {
        [[[NSUserDefaults standardUserDefaults] objectForKey:@"permissionForLocationAndNotification"] boolValue];
        [self permissionForPushNotification];
    }
    //tracking Pushes and App Opens
    [self trackingPushes:application options:launchOptions];
    
    [self checkLocationSrvicesEnabled];
    [self loadStorage];
    [self loadPrmotions];
    //Mail Chimp
   [[ChimpKit sharedKit] setApiKey:@"0746dc6bf1d0448814fe0e4148898870-us8"];
    
    
    
    
    
    // Handle launching from a notification
    UILocalNotification *locationNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    if (locationNotification) {
        // Set icon badge number to zero
        application.applicationIconBadgeNumber = 0;
    
    }
    
    
    //Restore cookies
    NSData *cookiesData = [[NSUserDefaults standardUserDefaults] objectForKey:SavedHTTPCookiesKey];
    if (cookiesData) {
        NSArray *cookies = [NSKeyedUnarchiver unarchiveObjectWithData:cookiesData];
        for (NSHTTPCookie *cookie in cookies)
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
    }
    //Helpshift notifications
    if (launchOptions != nil) //Handle PushNotification when app is opened
    {
        NSDictionary* userInfo = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (userInfo != nil && [[userInfo objectForKey:@"origin"] isEqualToString:@"helpshift"])
        {
            UIViewController* vc = [[UIViewController alloc]initWithNibName:nil bundle:nil];
            [[Helpshift sharedInstance] handleRemoteNotification:userInfo withController:vc];
        }
    }
    NSArray *windowstt = [[UIApplication sharedApplication] windows];
    for(UIWindow *window in windowstt) {
        if(window.rootViewController == nil){
            UIViewController* vc = [[UIViewController alloc]initWithNibName:nil bundle:nil];
            window.rootViewController = vc;
        }
    }
    // Sets up the date formatter.
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateStyle = kCFDateFormatterShortStyle;
    self.dateFormatter.timeStyle = kCFDateFormatterShortStyle;
    self.dateFormatter.locale = [NSLocale currentLocale];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];

    return YES;
}
-(void)loadPrmotions {
    _refHandle = [[_refFireDatabase child:@"QRCode"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        FIRStorageReference *starsRef = [self.storageRefPro child:snapshot.value[@"imagePro"]];
        NSString *visible = snapshot.value[@"visible"];
        
        if ([visible isEqualToString:@"YES"]) {
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            if (self.dataForPromotions == nil){
                [starsRef dataWithMaxSize:1 * 4096 * 4096 completion:^(NSData* data, NSError* error){
                    if (error != nil) {
                        // Uh-oh, an error occurred!
                        NSLog(@"%@", error.localizedDescription);
                    } else {
                        //  NSURL *url1 = [[NSBundle mainBundle] URLForResource:@"rock" withExtension:@"gif"];
                        self.dataForPromotions = data; //[NSData dataWithContentsOfURL:url1];
                        [self.delegate loadPromotionsCompleted:data];
                        
                    }
                }];
            } else{
                [self.delegate loadPromotionsCompleted:self.dataForPromotions];
            }
        }
    }];
    
    
}
- (void)configureDatabase {
    _refFireDatabase = [[FIRDatabase database] reference];
}
-(void)loadStorage {
    self.storageRefPro = [[FIRStorage storage] referenceForURL:@"gs://cmv-gioco.appspot.com/Promotions"];
    self.storage = [[NSMutableArray alloc] init];
    _refHandle = [[_refFireDatabase child:@"Events"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        
        for (FIRDataSnapshot *item in snapshot.children) {
            
            EventsFireBase *newItem = [[EventsFireBase alloc] initWithSnapshot:item];
            [self.storage addObject:newItem];
        }

    }];
}

-(void)StartRegisterForNotification:(UIApplication *)application {
    if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_7_1) {
        // iOS 7.1 or earlier. Disable the deprecation warnings.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
        UIRemoteNotificationType allNotificationTypes =
        (UIRemoteNotificationTypeSound |
         UIRemoteNotificationTypeAlert |
         UIRemoteNotificationTypeBadge);
        [application registerForRemoteNotificationTypes:allNotificationTypes];
#pragma clang diagnostic pop
    } else {
        // iOS 8 or later
        // [START register_for_notifications]
        if (floor(NSFoundationVersionNumber) <= NSFoundationVersionNumber_iOS_9_x_Max) {
            UIUserNotificationType allNotificationTypes =
            (UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge);
            UIUserNotificationSettings *settings =
            [UIUserNotificationSettings settingsForTypes:allNotificationTypes categories:nil];
            [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
        } else {
            // iOS 10 or later
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
            UNAuthorizationOptions authOptions =
            UNAuthorizationOptionAlert
            | UNAuthorizationOptionSound
            | UNAuthorizationOptionBadge;
            [[UNUserNotificationCenter currentNotificationCenter]
             requestAuthorizationWithOptions:authOptions
             completionHandler:^(BOOL granted, NSError * _Nullable error) {
             }
             ];
            
            // For iOS 10 display notification (sent via APNS)
            [[UNUserNotificationCenter currentNotificationCenter] setDelegate:self];
            // For iOS 10 data message (sent via FCM)
            [[FIRMessaging messaging] setRemoteMessageDelegate:self];
#endif
        }
        
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        // [END register_for_notifications]
    }
}

-(void)trackingPushes:(UIApplication *)application options:(NSDictionary *)launchOptions {
    if (application.applicationState != UIApplicationStateBackground) {
        // Track an app open here if we launch with a push, unless
        // "content_available" was used to trigger a background push (introduced
        // in iOS 7). In that case, we skip tracking here to avoid double
        // counting the app-open.
        BOOL preBackgroundPush = ![application respondsToSelector:@selector(backgroundRefreshStatus)];
        BOOL oldPushHandlerOnly = ![self respondsToSelector:@selector(application:didReceiveRemoteNotification:fetchCompletionHandler:)];
        BOOL noPushPayload = ![launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
        if (preBackgroundPush || oldPushHandlerOnly || noPushPayload) {
            //[PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
        }
    }
}

-(void)checkLocationSrvicesEnabled {
    if (![CLLocationManager locationServicesEnabled]) {
        // location services is disabled, alert user
        UIAlertView *servicesDisabledAlert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Location Services", @"DisabledTitle")
                                                                        message:NSLocalizedString(@"Location services are off", @"DisabledMessage")
                                                                       delegate:nil
                                                              cancelButtonTitle:@"OK"
                                                              otherButtonTitles:nil];
        [servicesDisabledAlert show];
    }
}


-(UIStoryboard *)storyboard {
    if (!_storyboard) {
       
        _storyboard=[UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
      
    }
    
    return _storyboard;
}

-(void)permissionForPushNotification {
    int status;
    if (!SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        status = [[[UIApplication sharedApplication] currentUserNotificationSettings] types];
    }else{
        status = [[UIApplication sharedApplication] enabledRemoteNotificationTypes];
    }
    
    CLAuthorizationStatus authStatus = [CLLocationManager authorizationStatus];
    if (((status == UIRemoteNotificationTypeNone) && (authStatus == kCLAuthorizationStatusNotDetermined)) || (authStatus == kCLAuthorizationStatusNotDetermined))
    {
        CMVPermissionForPushNotification *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"Push"];
        
        
        MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:vc];
        
        [[MZFormSheetBackgroundWindow appearance] setBackgroundBlurEffect:YES];
        [[MZFormSheetBackgroundWindow appearance] setBlurRadius:5.0];
        [[MZFormSheetBackgroundWindow appearance]setBackgroundColor:[UIColor clearColor]];
        
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
    } else {
        [self regionMonitoring];
    }
    
}

-(CMVEventKitController *)eventKit {
    if (!_eventKit) {
        _eventKit=[[CMVEventKitController alloc] init];
    }
    return _eventKit;
}

-(int)radius {
    if (!_radius) {
        _radius=200;
        _refHandle = [[_refFireDatabase child:@"radius"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
            
            _radius = [snapshot.value intValue];
          
        }];
    }
    
    return _radius;
}

- (CLLocationManager *)locationManager {
	if ([CLLocationManager locationServicesEnabled] &&
        [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        if (_locationManager != nil) {

            return _locationManager;
         
        }
        
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
        _locationManager.delegate = self;
        
	}
    
	return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if ([CLLocationManager locationServicesEnabled] &&
        [CLLocationManager authorizationStatus] != kCLAuthorizationStatusDenied) {
        [self saveInstallationLocation];
      
        
    }

}

-(void)regionMonitoring {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *appDefaults = [NSDictionary dictionaryWithObject:@"YES"
                                                            forKey:@"enableGeofencingNotification"];
    [defaults registerDefaults:appDefaults];
    [defaults synchronize];
    
    [self proximityMonitoring:defaults];
    [self venicerRegionMonitoring:defaults];
    
}

-(void)proximityMonitoring:(NSUserDefaults *)aDefaults {
 
    if ([aDefaults boolForKey:@"enableGeofencingNotification"]) {
        [self convenienceStartUpdateLocation];
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))  {
            
            [self.locationManager  startMonitoringForRegion:[[CLCircularRegion alloc] initWithCenter:self.region radius:self.radius identifier:@"proximity"]];
           
            
        } else {
            [self.locationManager  startMonitoringForRegion:[[CLRegion alloc] initCircularRegionWithCenter:self.region radius:self.radius identifier:@"proximity"]];
        }
    } else {
      
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            [self.locationManager stopMonitoringForRegion:[[CLCircularRegion alloc] initWithCenter:self.region radius:self.radius identifier:@"proximity"]];
        } else {
            [self.locationManager  stopMonitoringForRegion:[[CLRegion alloc] initCircularRegionWithCenter:self.region radius:self.radius identifier:@"proximity"]];
        }
        
    }
   
}

-(void)convenienceStartUpdateLocation {
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

-(void)venicerRegionMonitoring:(NSUserDefaults *)aDefaults {
    
    if ([aDefaults boolForKey:@"enableGeofencingNotification"]) {
        [self convenienceStartUpdateLocation];
        self.veniceRegion=[[CLCircularRegion alloc] initWithCenter:self.region radius:_veniceRadius identifier:@"Venice"];
        self.veniceRegion6=[[CLRegion alloc] initCircularRegionWithCenter:self.region radius:_veniceRadius identifier:@"Venice"];
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))  {
            [self.locationManager  startMonitoringForRegion:self.veniceRegion];
   
        } else {
            [self.locationManager  startMonitoringForRegion:self.veniceRegion6];
            
        }
    } else {
        
        if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
            [self.locationManager stopMonitoringForRegion:self.veniceRegion];
        } else {
            [self.locationManager  stopMonitoringForRegion:self.veniceRegion6];
        }
        
    }
    
}



- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    static BOOL firstTime=TRUE;
    if(firstTime)
    {
        firstTime = FALSE;
        NSSet * monitoredRegions = self.locationManager.monitoredRegions;
        if(monitoredRegions)
        {
            [monitoredRegions enumerateObjectsUsingBlock:^(CLRegion *region,BOOL *stop)
             
             {
                 NSString *identifer = region.identifier;
                 if ([identifer isEqualToString:@"Venice"]) {
                     
                 
                 CLLocationCoordinate2D centerCoords =region.center;
                 CLLocationCoordinate2D currentCoords= CLLocationCoordinate2DMake(newLocation.coordinate.latitude,newLocation.coordinate.longitude);
                 CLLocationDistance radius = region.radius;
                 
                 NSNumber * currentLocationDistance =[self calculateDistanceInMetersBetweenCoord:currentCoords coord:centerCoords];
                 if([currentLocationDistance floatValue] < radius)
                 {
                     NSLog(@"Invoking didEnterRegion Manually for region: %@",identifer);
                     
                     //stop Monitoring Region temporarily
                     [self.locationManager stopMonitoringForRegion:self.veniceRegion];
                     
                     [self locationManager:self.locationManager didEnterRegion:self.veniceRegion];
                     //start Monitoing Region again.
                     [self.locationManager startMonitoringForRegion:region];
                 }
                 }
             }];
        }
        //Stop Location Updation, we dont need it now.
        [self.locationManager stopUpdatingLocation];
        
    }
}

- (NSNumber*)calculateDistanceInMetersBetweenCoord:(CLLocationCoordinate2D)coord1 coord:(CLLocationCoordinate2D)coord2 {
    NSInteger nRadius = 6371; // Earth's radius in Kilometers
    double latDiff = (coord2.latitude - coord1.latitude) * (M_PI/180);
    double lonDiff = (coord2.longitude - coord1.longitude) * (M_PI/180);
    double lat1InRadians = coord1.latitude * (M_PI/180);
    double lat2InRadians = coord2.latitude * (M_PI/180);
    double nA = pow ( sin(latDiff/2), 2 ) + cos(lat1InRadians) * cos(lat2InRadians) * pow ( sin(lonDiff/2), 2 );
    double nC = 2 * atan2( sqrt(nA), sqrt( 1 - nA ));
    double nD = nRadius * nC;
    // convert to meters
    return @(nD*1000);
}

-(void)saveInstallationLocation {
    FIRUser *user = [FIRAuth auth].currentUser;
    
    if (user.uid != nil){
       
        [[[_refFireDatabase child:@"users"] child:user.uid]
         updateChildValues:@{@"latitude": [[NSNumber numberWithDouble:_locationManager.location.coordinate.latitude] stringValue]}];
        [[[_refFireDatabase child:@"users"] child:user.uid]
         updateChildValues:@{@"longitude": [[NSNumber numberWithDouble:_locationManager.location.coordinate.longitude] stringValue]}];

    }
}


-(CLLocationCoordinate2D)region {
    CLLocationCoordinate2D centre;
    centre.latitude = PALAZZO_LOREDAN_VENDRAMIN.latitude;
    centre.longitude = PALAZZO_LOREDAN_VENDRAMIN.longitude;
    _region=centre;
    return _region;
    
}

- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification
{
    UIApplicationState state = [application applicationState];
    if (state == UIApplicationStateActive) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Hi !", @"")
                                                        message:notification.alertBody
                                                       delegate:self cancelButtonTitle:NSLocalizedString(@"OK", @"")
                                              otherButtonTitles:nil];
        [alert show];
    }
    
    // Set icon badge number to zero
    application.applicationIconBadgeNumber = 0;
}

// as a delegate to our UISplitViewController, block from hiding the master view controller for any orientation
- (BOOL)splitViewController:(UISplitViewController *)svc shouldHideViewController:(UIViewController *)vc inOrientation:(UIInterfaceOrientation)orientation
{
    return NO;
}


-(void)sendLocalNotification {
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    localNotification.fireDate = nil;
    //[localNotification setHasAction:YES];
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.alertBody = NSLocalizedString(@"You are close to the Casinò !!!", @"");
    localNotification.soundName = @"coins4.caf";
    //localNotification.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}


-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:@"notificationCount"]) {
       
        if ((int)[userDefaults integerForKey:@"notificationCount"] < 5) {
            [userDefaults setInteger:(int)[[NSUserDefaults standardUserDefaults] integerForKey:@"notificationCount"] + 1 forKey:@"notificationCount"];
            if ([region.identifier isEqualToString: @"proximity"]) {
                [self sendLocalNotification];
            }
        }
        
        [userDefaults synchronize];
    } else {
        if ([region.identifier isEqualToString: @"proximity"]) {
            [self sendLocalNotification];
        }
        [userDefaults setInteger:0 forKey:@"notificationCount"];
        [userDefaults synchronize];
    }
    
    //[self isInVenice];
    [[FIRMessaging messaging] subscribeToTopic:@"/topics/isInVenice"];
    [self saveInstallationLocation];
    
}



- (void)locationManager:(CLLocationManager *)manager didDetermineState:(CLRegionState)state forRegion:(CLRegion *)region {

       // [self isInVenice];
    [self saveInstallationLocation];
        
}

-(void)isInVenice {

    [[FIRMessaging messaging] subscribeToTopic:@"/topics/isInVenice"];

}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    if ([region.identifier isEqualToString: @"Venice"]) {
        [[FIRMessaging messaging] unsubscribeFromTopic:@"/topics/news"];

    }
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    // Save cookies
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData *cookiesData = [NSKeyedArchiver archivedDataWithRootObject:[[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]];
    [userDefaults setObject:cookiesData
                                              forKey:SavedHTTPCookiesKey];
    
    if ([userDefaults objectForKey:@"helper"]) {
    
        if ((int)[userDefaults integerForKey:@"helper"] < 3) {
            [userDefaults setInteger:(int)[[NSUserDefaults standardUserDefaults] integerForKey:@"helper"] + 1 forKey:@"helper"];
            NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay  fromDate:[NSDate date]];
            NSInteger day = [components day];
            [userDefaults setInteger:day forKey:@"today"];
        }
      
        [userDefaults synchronize];
    } else {
        NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay  fromDate:[NSDate date]];
        NSInteger day = [components day];
        
        [userDefaults setInteger:0 forKey:@"helper"];
        [userDefaults setInteger:day forKey:@"today"];
        
        [userDefaults synchronize];
    }
    [[FIRMessaging messaging] disconnect];
    NSLog(@"Disconnected from FCM");

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    if (![[[NSUserDefaults standardUserDefaults] objectForKey:@"permissionForLocationAndNotification"] boolValue] == NO) {
    [self regionMonitoring];
    }
}

- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)newDeviceToken {
    
  //  [[AWSMobileClient sharedInstance] application:application didRegisterForRemoteNotificationsWithDeviceToken:newDeviceToken];

    
    [[Helpshift sharedInstance] registerDeviceToken:newDeviceToken];
}

- (void)application:(UIApplication *)application didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
	if (error.code != 3010) { // 3010 is for the iPhone Simulator
        NSLog(@"Application failed to register for push notifications: %@", error);
	}
   // [[AWSMobileClient sharedInstance] application:application didFailToRegisterForRemoteNotificationsWithError:error];
}


- (BOOL)application:(UIApplication *)app
            openURL:(NSURL *)url
            options:(NSDictionary<NSString *, id> *)options {
    
    BOOL handledFB = [[FBSDKApplicationDelegate sharedInstance] application:app
                                                                    openURL:url
                                                          sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                                 annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
                      ];
    BOOL handledGoo = [[GIDSignIn sharedInstance] handleURL:url
                                         sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                annotation:options[UIApplicationOpenURLOptionsAnnotationKey]];
    
    return handledFB || handledGoo;
}

// ****************************************************************************
// App switching methods to support Facebook Single Sign-On.
// ****************************************************************************
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    NSLog(@"application application: %@, openURL: %@, sourceApplication: %@", application.description, url.absoluteURL,
//          sourceApplication);
//    return [[AWSMobileClient sharedInstance] withApplication:application
//                                                     withURL:url
//                                       withSourceApplication:sourceApplication
//                                              withAnnotation:annotation];
    
    BOOL handledFB = [[FBSDKApplicationDelegate sharedInstance] application:application
                                                                       openURL:url
                                                             sourceApplication:sourceApplication
                                                                    annotation:annotation
                         ];
    BOOL handledGoo =[[GIDSignIn sharedInstance] handleURL:url
                                         sourceApplication:sourceApplication
                                                annotation:annotation];
    return handledFB || handledGoo;

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */

//    if (_currentInstallation.badge != 0) {
//        _currentInstallation.badge = 0;
//        [_currentInstallation saveEventually];
//    }
    
    [FBSDKAppEvents activateApp];
    [self connectToFcm];
}
- (void)connectToFcm {
    [[FIRMessaging messaging] connectWithCompletion:^(NSError * _Nullable error) {
        if (error != nil) {
            NSLog(@"Unable to connect to FCM. %@", error);
        } else {
            NSLog(@"Connected to FCM.");
        }
    }];
}
// [START refresh_token]
- (void)tokenRefreshNotification:(NSNotification *)notification {
    // Note that this callback will be fired everytime a new token is generated, including the first
    // time. So if you need to retrieve the token as soon as it is available this is where that
    // should be done.
    NSString *refreshedToken = [[FIRInstanceID instanceID] token];
    NSLog(@"InstanceID token: %@", refreshedToken);
    
    // Connect to FCM since connection may have failed when attempted before having a token.
    [self connectToFcm];
    
    // TODO: If necessary send token to application server.
}
- (void)applicationWillTerminate:(UIApplication *)application {
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    //[[PFFacebookUtils session] close];
  
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult result))handler
{
    
    //Success
    handler(UIBackgroundFetchResultNewData);
    // If you are receiving a notification message while your app is in the background,
    // this callback will not be fired till the user taps on the notification launching the application.
    // TODO: Handle data of notification
    
    // Print message ID.
    NSLog(@"Message ID: %@", userInfo[@"gcm.message_id"]);
    
    // Print full message.
    NSLog(@"%@", userInfo);
   
}

// [START ios_10_message_handling]
// Receive displayed notifications for iOS 10 devices.
#if defined(__IPHONE_10_0) && __IPHONE_OS_VERSION_MAX_ALLOWED >= __IPHONE_10_0
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
       willPresentNotification:(UNNotification *)notification
         withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler {
    // Print message ID.
    NSDictionary *userInfo = notification.request.content.userInfo;
    NSLog(@"Message ID: %@", userInfo[@"gcm.message_id"]);
    
    // Print full message.
    NSLog(@"%@", userInfo);
}
// Receive data message on iOS 10 devices.

- (void)applicationReceivedRemoteMessage:(nonnull FIRMessagingRemoteMessage *)remoteMessage {
    NSLog(@"%@", [remoteMessage appData]);
};

#endif
// [END ios_10_message_handling]
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if ([[userInfo objectForKey:@"origin"] isEqualToString:@"helpshift"]) {
        UIViewController* vc = [[UIViewController alloc]initWithNibName:nil bundle:nil];
        [[Helpshift sharedInstance] handleRemoteNotification:userInfo withController:vc];
    }

}
-(void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"Background fetch started...");
    
    //---do background fetch here---
    // You have up to 30 seconds to perform the fetch
    
    BOOL downloadSuccessful = YES;
    
    if (downloadSuccessful) {
        //---set the flag that data is successfully downloaded---
        completionHandler(UIBackgroundFetchResultNewData);
        
    } else {
        //---set the flag that download is not successful---
        completionHandler(UIBackgroundFetchResultFailed);
    }
    
    NSLog(@"Background fetch completed...");
}


#pragma mark - Utility methods

- (void)showAlertWithTitle:(NSString *)title
                   message:(NSString *)message {
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:title
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cancelAction =
    [UIAlertAction actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                           handler:nil];
    [alertController addAction:cancelAction];
    
  //  [self presentViewController:alertController
        //               animated:YES
        //             completion:nil];
}


@end
