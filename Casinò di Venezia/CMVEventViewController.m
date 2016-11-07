//
//  CMVEventViewController.m
//  CMV
//
//  Created by Massimo Moro on 04/04/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import "CMVEventViewController.h"

#import "UINavigationController+MHDismissModalView.h"
#import "CMVAppDelegate.h"
#import "CMVEventKitShared.h"
#import "CMVLocalize.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "GAI.h"
#import "KIImagePager.h"
//#import "Events.h"
#import "EventsFireBase.h"
#define PADDING 0.0f;

@interface CMVEventViewController () <KIImagePagerDelegate, KIImagePagerDataSource>
@property (weak, nonatomic) IBOutlet KIImagePager *imagePager;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintheight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstrait;
@property (weak, nonatomic) IBOutlet UIButton *book;

@end

@implementation CMVEventViewController {
    AAShareBubbles *shareBubbles;
    float radius;
    float bubbleRadius;
}

- (void)viewDidLoad
{
     
    [super viewDidLoad];
   
    self.imageHeightConstrait.constant=(203*self.view.frame.size.width)/320;
	
   
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"EventBackground.png"]]];
   
    radius = 130;
    bubbleRadius = 40;
    
    self.imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    self.imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    self.eventName.font=GOTHAM_BOOK(18);
    self.eventName.textColor=[UIColor redColor];
    self.eventDate.font=GOTHAM_BOOK(16);
    self.eventDate.textColor=[UIColor whiteColor];
    self.closeButton.color=[UIColor redColor];
   
    
    if ([_event.Book isEqualToString:@"ON"]) {
        _book.hidden = false;
    }
   
}

-(void)viewWillAppear:(BOOL)animated {
 [self.closeButton setNeedsDisplay];
    self.eventDescription.font=GOTHAM_XLight(14);
    self.eventDescription.contentOffset=CGPointZero;
    [self refreshUI];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"EventDetailsCN";
    } else {
        value=@"EventDetailsVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

}

-(void)calculateHeight {
    float heightContentSize;
    
    heightContentSize=self.eventDescription.frame.origin.y+[self textViewHeightForAttributedText:self.eventDescription andWidth:self.view.frame.size.width];
    
    self.constraintheight.constant=heightContentSize + self.imageHeightConstrait.constant/3;
    self.textViewHeight.constant=heightContentSize;
    
}

- (CGFloat)textViewHeightForAttributedText:(UITextView *)textView andWidth:(CGFloat)width
{
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

#pragma mark - KIImagePager DataSource

- (NSArray *) arrayWithImages
{

    NSMutableArray *photo=[[NSMutableArray alloc] init];
    NSString *imageFile1=_event.ImageEvent1;
    NSString *imageFile2=_event.ImageEvent2;
    NSString *imageFile3=_event.ImageEvent3;
    UIImage *defaultImage=_event.ImageName;
    self.imagePager.indicatorDisabled = TRUE;
    
    //self.imagePager.hidden = YES;
    self.whiteView.hidden = YES;
    //if (![imageFile1 isEqualToString:@"NULL"]) {
    if (imageFile1) {
        self.imagePager.indicatorDisabled = FALSE;
        //self.imagePager.hidden =NO;
         self.whiteView.hidden = NO;
        [photo addObject:imageFile1];
    } else {
        [photo addObject:defaultImage];
    }
    if (imageFile2) {
        [photo addObject:imageFile2];
    }
    if (imageFile3) {
        [photo addObject:imageFile3];
    }

    return photo;
}
- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}
- (UIImage *) placeHolderImageForImagePager {
    return [UIImage imageNamed:@"Test.png"];
}


-(void)setEvent:(EventsFireBase *)event
{
    //Make sure you're not setting up the same event.
    if (_event != event) {
        _event = event;

    }
}

-(void)refreshUI
{
    
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"EEEE dd, MMMM" options:0
                                                                  locale:[NSLocale currentLocale]];
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:formatString];
     
    }
    
    [self localizeMemo:_event];
    _eventDescription.textColor=[UIColor whiteColor];
    _eventDate.text = [formatter stringFromDate:_event.StartDate];
    [self calculateHeight];
}

-(void)localizeMemo:(EventsFireBase *)event {
    _eventName.text = event.Name;
    _eventDescription.text = event.Description;
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            if (event.NameIT) {
            _eventName.text = event.NameIT;
            }
            if (event.DescriptionIT) {
            _eventDescription.text = event.DescriptionIT;
            }
            break;
        case DE :
            if (event.NameDE) {
                _eventName.text = event.NameDE;
            }
            if (event.DescriptionDE) {
                _eventDescription.text = event.DescriptionDE;
            }
            break;
        case FR :
            
            if (event.NameFR) {
                _eventName.text = event.NameFR;
            }
            if (event.DescriptionFR) {
                _eventDescription.text = event.DescriptionFR;
            }
            break;
        case ES :
            if (event.NameES) {
                _eventName.text = event.NameES;
            }
            if (event.DescriptionES) {
                _eventDescription.text = event.DescriptionES;
            }
            break;
        case ZH  :
            
            if (event.NameZH) {
                _eventName.text = event.NameZH;
            }
            if (event.DescriptionZH) {
                _eventDescription.text = event.DescriptionZH;
            }
            break;
        case RU:
            
            if (event.NameRU) {
                _eventName.text = event.NameRU;
            }
            if (event.DescriptionRU) {
                _eventDescription.text = event.DescriptionRU;
            }
            break;
            
        default:
            
            _eventName.text = event.Name;
            _eventDescription.text = event.Description;
            break;
    }
}

-(void)selectedEvent:(Events *)newEvent {
    [self setEvent:newEvent];
}

- (IBAction)done:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
}
- (IBAction)shareTapped:(id)sender {
    [self shareButtonPress:nil];
    if(shareBubbles) {
        //[shareBubbles hide];
        shareBubbles = nil;
    }
    CGRect buttonFrame= self.shareButton.frame;
    shareBubbles = [[AAShareBubbles alloc] initWithFrame:self.view.frame andButtonFrame:buttonFrame radius:radius inView:self.view];
    shareBubbles.delegate = self;
    shareBubbles.bubbleRadius = bubbleRadius;
    shareBubbles.showFacebookBubble = YES;
    shareBubbles.showTwitterBubble = YES;
    shareBubbles.showVkBubble = YES;
    shareBubbles.parentButton=self.shareButton;
    [shareBubbles show];
    self.shareButton.enabled=NO;
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
  
    [shareBubbles hide];
    
}

-(void)shareButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    if (type) {
        if (![type  isEqual: @"CalendarSharingEvents"]) {
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"SHARING"
                                                                  action:@"press"
                                                                   label:type
                                                                   value:nil] build]];
        } else {
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"REMINDER"
                                                                  action:@"press"
                                                                   label:type
                                                                   value:nil] build]];
        }
    } else {
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"SHARING"
                                                          action:@"press"
                                                           label:@"SharingButton"
                                                           value:nil] build]];
    }
    [tracker set:kGAIScreenName value:nil];
}

#pragma mark -
#pragma mark AAShareBubbles

-(void)aaShareBubbles:(AAShareBubbles *)shareBubbles tappedBubbleWithType:(AAShareBubbleType)bubbleType
{
    switch (bubbleType) {
        case AAShareBubbleTypeFacebook:
            [self shareButtonPress:@"FacebookSharingEvents"];
            [self initWithSocial:SLServiceTypeFacebook andCell:self.cell];
            break;
        case AAShareBubbleTypeTwitter:
            [self shareButtonPress:@"TwitterSharingEvents"];
            [self initWithSocial:SLServiceTypeTwitter andCell:self.cell];
            break;
        case AAShareBubbleTypeGooglePlus:
            NSLog(@"Google+");
            break;
        case AAShareBubbleTypeTumblr:
            NSLog(@"Tumblr");
            break;
        case AAShareBubbleTypeVk:{
            [self shareButtonPress:@"CalendarSharingEvents"];
            CMVEventKitShared *eks=[[CMVEventKitShared alloc] init];
            [eks setUpEvent:self.cell];
    
        }
            break;
        case AAShareBubbleTypeLinkedIn:
            NSLog(@"LinkedIn");
            break;
        case AAShareBubbleTypeYoutube:
            NSLog(@"Youtube");
            break;
        case AAShareBubbleTypeVimeo:
            NSLog(@"Vimeo");
            break;
        default:
            break;
    }
}





-(void)initWithSocial:(NSString *)service andCell:(CMVSwipeTableViewCell *)cell {
    if (![SLComposeViewController isAvailableForServiceType:service])
    {
        [self showUnavailableAlertForServiceType:service];
    }
    else
    {
        SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:service];
        [composeViewController addImage:cell.picture.image];
        [composeViewController addURL:[NSURL URLWithString:cell.eventURL]];
        NSString *initalTextString = cell.eventDescription.text;
        [composeViewController setInitialText:initalTextString];
        
        composeViewController.completionHandler = ^(SLComposeViewControllerResult result) {
            switch(result) {
                    //  This means the user cancelled without sending the Tweet
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Cancelled");
                    break;
                    //  This means the user hit 'Send'
                case SLComposeViewControllerResultDone:
                   [self shareButtonPress:service];
                    break;
            }
            
            //  dismiss the Tweet Sheet
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:^{
                    NSLog(@"Tweet Sheet has been dismissed.");
                }];
            });
        };
        
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

- (void)showUnavailableAlertForServiceType:(NSString *)serviceType
{
    NSString *serviceName = @"";
    
    if (serviceType == SLServiceTypeFacebook)
    {
        serviceName = @"Facebook";
    }
    else if (serviceType == SLServiceTypeTwitter)
    {
        serviceName = @"Twitter";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Account"
                              message:[NSString stringWithFormat:@"Please go to the device settings and add a %@ account in order to share through that service", serviceName]
                              delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles:nil];
    [alertView show];
}
- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)navigationPaneBarButtonItem
{
    if ((navigationPaneBarButtonItem != _navigationPaneBarButtonItem) || navigationPaneBarButtonItem==nil) {
        if (navigationPaneBarButtonItem)
            [self.toolbar setItems:[NSArray arrayWithObject:navigationPaneBarButtonItem] animated:NO];
        else
            [self.toolbar setItems:nil animated:NO];
        //self.toolbar.hidden=YES;
    }
}
- (IBAction)booking:(id)sender {
    if (![_event.URLBook isEqualToString:@"NULL"]) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString: _event.URLBook]];
    }
    
}


@end
