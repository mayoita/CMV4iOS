//
//  CMVHomeViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 23/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVHomeViewController.h"
#import "DVOMarqueeView.h"
#import "CMVSetUpCurrency.h"
#import "CMVAppDelegate.h"
#import "CMVCheckWeekDay.h"
#import "CMVLocalize.h"
#import "CMVGradientForNews.h"
#import "CMVArrowChat.h"
//#import <AWSDynamoDB/AWSDynamoDB.h>
//#import "Jackpot.h"
//#import "Festivity.h"
//#import "News.h"
#import "Firebase.h"

#define VE 0
#define CN 1


@interface CMVHomeViewController (){
    DVOMarqueeView *labelMarquee;
     FIRDatabaseHandle _refHandle;
}
@property (weak, nonatomic) IBOutlet UILabel *jackpot;

@property (weak, nonatomic) IBOutlet UILabel *labelJackpot;

@property (weak, nonatomic) IBOutlet UIImageView *homeImage;
@property (weak, nonatomic) IBOutlet UILabel *chatWithUs;
@property (weak, nonatomic) IBOutlet CMVArrowChat *arrowChat;


@property(strong,nonatomic)UILabel *labelMarqueeText;
@property(strong,nonatomic)DVOMarqueeView *labelMarquee;


@property(strong,nonatomic)UIButton *lockerButton;
@property (nonatomic,strong)CMVDataClass *site;

//Firebase database reference
@property (strong, nonatomic) FIRDatabaseReference *refFireDatabase;
@property (strong, nonatomic) FIRStorageReference *storageRef;
@property(strong,nonatomic)CMVSetUpCurrency *checkCurrency;
@end

@implementation CMVHomeViewController
@synthesize labelMarquee;
int Office;
BOOL VeSaPr = 0;
NSArray *storageFestivity;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configureDatabase];
    [self configureStorage];
    [self setJackpot];
 //   [self loadStorageFestivity];
    [self setOffHelper];
    self.chatWithUs.layer.cornerRadius = 4.0;
    self.chatWithUs.layer.masksToBounds = YES;
    
    self.site=[CMVDataClass getInstance];
    
    
 
    
    UIImage *myGradient = [UIImage imageNamed:@"JackpotColorPattern"];
    self.labelJackpot.textColor   = [UIColor colorWithPatternImage:myGradient];
    if (iPAD) {
        self.jackpot.font=GOTHAM_Thin(53);
        self.labelJackpot.font=GOTHAM_XLight(45);
        self.today.font=GOTHAM_Medium(15);
    } else {
        self.jackpot.font=GOTHAM_Thin(43);
        self.labelJackpot.font=GOTHAM_XLight(40);
        self.today.font=GOTHAM_Medium(10);
    }
    //Init currency rates
    
    self.checkCurrency=[[CMVSetUpCurrency alloc] init];
    [self.checkCurrency exchangeRates];
    
//    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
//    [[dynamoDBObjectMapper load:[Jackpot class] hashKey:@"1" rangeKey:nil]
//     continueWithBlock:^id(AWSTask *task) {
//         if (task.error) {
//             NSLog(@"The request failed. Error: [%@]", task.error);
//         }
//         if (task.exception) {
//             NSLog(@"The request failed. Exception: [%@]", task.exception);
//         }
//         if (task.result) {
//             dispatch_async(dispatch_get_main_queue(), ^{
//                 Jackpot *item = task.result;
//                 self.jackpot.text=item.jackpot;
//                 self.jackpot.text=[self.checkCurrency setupCurrency:self.jackpot.text];
//             });
//            
//             
//         }
//         return nil;
//     }];
    
    
    self.mainTabBarController = (CMVMainTabbarController *)self.tabBarController;
    [self.mainTabBarController setCenterButtonDelegate:self];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        //[self addLabelMarquee];
    }
}
- (void)configureDatabase {
    _refFireDatabase = [[FIRDatabase database] reference];
}

-(void)setJackpot {
    _refHandle = [[_refFireDatabase child:@"Jackpot"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        self.jackpot.text=[NSString stringWithFormat:@"%@ €", snapshot.value[@"jackpot"]];
    }];
}

- (void)configureStorage {
    self.storageRef = [[FIRStorage storage] referenceForURL:@"gs://cmv-gioco.appspot.com/EventAds"];
}
-(void)setOffHelper {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    if ([[NSUserDefaults standardUserDefaults] objectForKey:@"contactUs"]) {
        self.chatWithUs.hidden = YES;
        self.arrowChat.hidden = YES;
        [userDefaults setBool:NO forKey:@"contactUs"];
        [userDefaults synchronize];
    } else {
        [userDefaults setBool:YES forKey:@"contactUs"];
        [userDefaults synchronize];
    }
    
}

-(void)loadFestivity:(NSString *)todayOpen andVSP:(NSString *)vsp{
    _refHandle = [[_refFireDatabase child:@"Festivity"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        if (storageFestivity == nil) {
            storageFestivity = [NSJSONSerialization JSONObjectWithData:[snapshot.value[@"festivity"] dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
        }
 
        
        for (id object in storageFestivity) {
            
            if ([[CMVCheckWeekDay checkWeekDAy][@"day"] intValue] == [object[0] intValue] && [[CMVCheckWeekDay checkWeekDAy][@"month"] intValue] == [object[1] intValue]) {
                VeSaPr=1;
            }
        }
        
        [self checkWeekDAy:todayOpen andVSP:vsp];
    }];
}

-(void)loadStorageFestivity {
//    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
//    
//    [[dynamoDBObjectMapper load:[Festivity class] hashKey:@"1" rangeKey:nil]
//     continueWithBlock:^id(AWSTask *task) {
//         if (task.error) {
//             NSLog(@"The request failed. Error: [%@]", task.error);
//         }
//         if (task.exception) {
//             NSLog(@"The request failed. Exception: [%@]", task.exception);
//         }
//         if (task.result) {
//             dispatch_async(dispatch_get_main_queue(), ^{
//                 Festivity *item = task.result;
//                 storageFestivity = item.festivity;
//             });
//             
//         }
//         return nil;
//     }];
    
    
}

-(void)checkWeekDAy:(NSString *)todayOpen andVSP:(NSString *)vsp{
    
    if ([[CMVCheckWeekDay checkWeekDAy][@"month"] intValue] == 12 && (([[CMVCheckWeekDay checkWeekDAy][@"day"] intValue] == 24) || ([[CMVCheckWeekDay checkWeekDAy][@"day"] intValue] == 25))) {
        self.today.text=NSLocalizedString(@"Today is closed", @"");
    } else {
        if (([[CMVCheckWeekDay checkWeekDAy][@"weekday"] intValue] == 7) || VeSaPr) {
            self.today.text=todayOpen;
        } else {
            self.today.text=vsp;
        }
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self animateChat];
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"HomeCN";
    } else {
        value=@"HomeVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
    [self.mainTabBarController setCenterButtonDelegate:self];
    [self setOffice];
}

-(void)animateChat {
    //Animation
    [UIView animateWithDuration:3.5 delay:0 usingSpringWithDamping:0.05 initialSpringVelocity:0.3 options:UIViewAnimationOptionCurveEaseInOut animations:^(void) {
        
        self.chatWithUs.center=CGPointMake(self.chatWithUs.center.x, self.chatWithUs.center.y - 5);
        self.arrowChat.center=CGPointMake(self.arrowChat.center.x, self.arrowChat.center.y - 5);
    }
                     completion:^(BOOL finished){
                         [UIView animateWithDuration:1.0 animations:^(void) {
                             self.chatWithUs.alpha = 0.0;
                         }
                          ];
                         [UIView animateWithDuration:1.0 animations:^(void) {
                             self.arrowChat.alpha = 0.0;
                         }
                          ];
                         
                     }];
}

- (void)addLabelMarquee
{
    
    self.labelMarqueeText=[UILabel new];
    
    _refHandle = [[_refFireDatabase child:@"News"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        switch ([CMVLocalize myDeviceLocaleIs]) {
            case IT :
                self.labelMarqueeText.text=snapshot.value[@"NewsIT"];
                break;
            case DE :
                self.labelMarqueeText.text=snapshot.value[@"NewsDE"];
                break;
            case FR :
                self.labelMarqueeText.text=snapshot.value[@"NewsFR"];
                break;
            case ES :
                self.labelMarqueeText.text=snapshot.value[@"NewsES"];
                break;
            case RU  :
                self.labelMarqueeText.text=snapshot.value[@"NewsRU"];
                break;
            case ZH:
                self.labelMarqueeText.text=snapshot.value[@"NewsZH"];
                break;
                
            default:
                self.labelMarqueeText.text=snapshot.value[@"News"];
                break;
        }
        
        self.labelMarqueeText.textColor=[UIColor whiteColor];
        [self.labelMarqueeText sizeToFit];
        
        labelMarquee = [[DVOMarqueeView alloc] initWithFrame:CGRectMake(0, self.tabBarController.tabBar.frame.origin.y -35, CGRectGetWidth(self.view.bounds), 30)];
        labelMarquee.viewToScroll =  self.labelMarqueeText;
        CMVGradientForNews *gradient=[[CMVGradientForNews alloc] initWithFrame:CGRectMake(0, self.tabBarController.tabBar.frame.origin.y -35, CGRectGetWidth(self.view.bounds), 30)];
        self.labelMarquee=labelMarquee;
        [self.view addSubview:labelMarquee];
        [self.view addSubview:gradient];
        
        [labelMarquee beginScrolling];
        
    }];
//    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
//    
//    [[dynamoDBObjectMapper load:[News class] hashKey:@"1" rangeKey:nil]
//     continueWithBlock:^id(AWSTask *task) {
//         if (task.error) {
//             NSLog(@"The request failed. Error: [%@]", task.error);
//         }
//         if (task.exception) {
//             NSLog(@"The request failed. Exception: [%@]", task.exception);
//         }
//         if (task.result) {
//             dispatch_async(dispatch_get_main_queue(), ^{
//                 News *item = task.result;
//                 switch ([CMVLocalize myDeviceLocaleIs]) {
//                     case IT :
//                         self.labelMarqueeText.text=item.NewsIT;
//                         break;
//                     case DE :
//                         self.labelMarqueeText.text=item.NewsDE;
//                         break;
//                     case FR :
//                         self.labelMarqueeText.text=item.NewsFR;
//                         break;
//                     case ES :
//                         self.labelMarqueeText.text=item.NewsES;
//                         break;
//                     case RU  :
//                         self.labelMarqueeText.text=item.NewsRU;
//                         break;
//                     case ZH:
//                         self.labelMarqueeText.text=item.NewsZH;
//                         break;
//                         
//                     default:
//                         self.labelMarqueeText.text=item.News;
//                         break;
//                 }
//                 
//                 self.labelMarqueeText.textColor=[UIColor whiteColor];
//                 [ self.labelMarqueeText sizeToFit];
//                 
//                 labelMarquee = [[DVOMarqueeView alloc] initWithFrame:CGRectMake(0, self.tabBarController.tabBar.frame.origin.y -35, CGRectGetWidth(self.view.bounds), 30)];
//                 labelMarquee.viewToScroll =  self.labelMarqueeText;
//                 CMVGradientForNews *gradient=[[CMVGradientForNews alloc] initWithFrame:CGRectMake(0, self.tabBarController.tabBar.frame.origin.y -35, CGRectGetWidth(self.view.bounds), 30)];
//                 self.labelMarquee=labelMarquee;
//                 [self.view addSubview:labelMarquee];
//                 [self.view addSubview:gradient];
//                 
//                 [labelMarquee beginScrolling];
//             });
//             
//         }
//         return nil;
//     }];
    
}

-(void)refreshLabelMarquee {
    self.labelMarqueeText.text=@"";
    _refHandle = [[_refFireDatabase child:@"News"] observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot *snapshot) {
        switch ([CMVLocalize myDeviceLocaleIs]) {
            case IT :
                self.labelMarqueeText.text=snapshot.value[@"NewsIT"];
                break;
            case DE :
                self.labelMarqueeText.text=snapshot.value[@"NewsDE"];
                break;
            case FR :
                self.labelMarqueeText.text=snapshot.value[@"NewsFR"];
                break;
            case ES :
                self.labelMarqueeText.text=snapshot.value[@"NewsES"];
                break;
            case RU  :
                self.labelMarqueeText.text=snapshot.value[@"NewsRU"];
                break;
            case ZH:
                self.labelMarqueeText.text=snapshot.value[@"NewsZH"];
                break;
                
            default:
                self.labelMarqueeText.text=snapshot.value[@"News"];
                break;
        }
        
        [self.labelMarqueeText sizeToFit];
        self.labelMarquee.viewToScroll =  self.labelMarqueeText;
        
    }];
//    AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
//    
//    [[dynamoDBObjectMapper load:[News class] hashKey:@"1" rangeKey:nil]
//     continueWithBlock:^id(AWSTask *task) {
//         if (task.error) {
//             NSLog(@"The request failed. Error: [%@]", task.error);
//         }
//         if (task.exception) {
//             NSLog(@"The request failed. Exception: [%@]", task.exception);
//         }
//         if (task.result) {
//              dispatch_async(dispatch_get_main_queue(), ^{
//             News *item = task.result;
//             switch ([CMVLocalize myDeviceLocaleIs]) {
//                 case IT :
//                     self.labelMarqueeText.text=item.NewsIT;
//                     break;
//                 case DE :
//                     self.labelMarqueeText.text=item.NewsDE;
//                     break;
//                 case FR :
//                     self.labelMarqueeText.text=item.NewsFR;
//                     break;
//                 case ES :
//                     self.labelMarqueeText.text=item.NewsES;
//                     break;
//                 case RU  :
//                     self.labelMarqueeText.text=item.NewsRU;
//                     break;
//                 case ZH:
//                     self.labelMarqueeText.text=item.NewsZH;
//                     break;
//                     
//                 default:
//                     self.labelMarqueeText.text=item.News;
//                     break;
//             }
//             
//             [self.labelMarqueeText sizeToFit];
//             self.labelMarquee.viewToScroll =  self.labelMarqueeText;
//                    });
//         }
//         return nil;
//     }];
}

-(void)viewWillAppear:(BOOL)animated {
    [self refreshLabelMarquee];
}



- (IBAction)openHelp:(id)sender {
    [self infoButtonPress:@"HelpSfhift"];
  
    [[Helpshift sharedInstance] showConversation:self withOptions:nil];
    //[[Helpshift sharedInstance] showFAQs:self
                            // withOptions:@{@"enableContactUs":@"ALWAYS"}];
    
}

-(void)infoButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"INFORMATION"
                                                          action:@"press"
                                                           label:type
                                                           value:nil] build]];
    [tracker set:kGAIScreenName value:nil];
}

#pragma mark - Center button delegate
-(void)centerButtonAction:(UIButton *)sender {
    
    [self setOffice];
    
}

-(void)setOffice {
    if (self.site.location == VENEZIA) {
        Office=CN;
        [self.homeImage setImage:[UIImage imageNamed:@"HomeBackgroundCaNoghera.png"]];
        self.tabBarController.tabBar.tintColor=BRAND_GREEN_COLOR;
        [self loadFestivity:NSLocalizedString(@"Today open 11:00 am - 03:45 am",nil) andVSP:NSLocalizedString(@"Today open 11:00 am - 03:15 am",nil)];
    } else {
        Office=VE;
        [self.homeImage setImage:[UIImage imageNamed:@"HomeBackgroundVenezia.png"]];
        self.tabBarController.tabBar.tintColor=BRAND_RED_COLOR;
        [self loadFestivity:NSLocalizedString(@"Today open 11.00 am - 03.15 am",nil) andVSP:NSLocalizedString(@"Today open 11:00 am - 02:45 am",nil)];
    }
}



@end
