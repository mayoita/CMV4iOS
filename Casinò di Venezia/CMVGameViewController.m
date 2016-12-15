
//
//  CMVGameViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVGameViewController.h"

#import "CMVShowImage.h"

#import <AVFoundation/AVFoundation.h>
#import "CMVCloseButton.h"
#import "CMVTextForGame.h"

#import "FXImageView.h"
#import "CMVSharedClass.h"
#import "EventsFireBase.h"





#define cellIdentifier @"GameCell"

#define CN 1
#define VE 0
#define Photo 0
#define Name 0
#define DataForSlot 2
#define PARSE_CLASS_NAME @"Events"
#define EVENTS_INDEX 0

#define PLAY @"play"
#define PAUSE @"pause"

#define TimeInterval 2.0f

#define SCROLL_SPEED 1 //items per second, can be negative or fractional
#define CN 1
#define VE 0
#define AspectRatioImage 0.66


@interface CMVGameViewController () <KIImagePagerDelegate, KIImagePagerDataSource>
{
    IBOutlet KIImagePager *_imagePager;
    bool displayingPrimary;
    BOOL isPlaying;
    bool single;
    bool toRight;
    int scrollStep;
    int widthOfLastImage;
    id standardLayout;
    bool  talking;
    Events *selectedEvent;
}


@property (weak, nonatomic) IBOutlet CMVCloseButton *closeButton;

@property (weak, nonatomic) IBOutlet UITextView *descriptionView;


@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintheight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeightConstrait;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *carouselHeight;

@property (nonatomic, strong) NSTimer *scrollTimer;
@property (nonatomic, assign) NSTimeInterval lastTime;

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property (nonatomic, strong)NSString * textToBeRead;
@property (nonatomic,strong)CMVDataClass *site;

@property (strong, nonatomic) NSMutableArray *slotsEvents;




@end

@implementation CMVGameViewController

@synthesize carousel;
@synthesize slotsEvents;

int Office3;
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.imageHeightConstrait.constant=(203*self.view.frame.size.width)/320;
  
    [self hideToolbarForiPad];
    self.site=[CMVDataClass getInstance];
    [self setSite];
    self.speechButton.hidden=YES;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.synthesizer = [[AVSpeechSynthesizer alloc] init];
        self.speechButton.hidden=NO;
    }
    [self loadText];
    
    //Delegate for iPad split controller
    //self.eventDelegate=(CMVEventViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"EventDetails"];
    if (iPHONE) {
        if (!self.eventDelegate) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
            CMVEventViewController *eventDetail = [storyboard instantiateViewControllerWithIdentifier:@"EventViewControlleriPhone"];
            self.eventDelegate=eventDetail;
        }
    } else {
        if (!self.eventDelegate) {
            UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
            CMVEventViewController *eventDetail = [storyboard instantiateViewControllerWithIdentifier:@"EventDetailsForSlots"];
            self.eventDelegate=eventDetail;
        }
    }

    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"Game_detail_background_long.png"]]];
    
    
    
    if (_navigationPaneBarButtonItem)
        [self.toolbar setItems:[NSArray arrayWithObject:self.navigationPaneBarButtonItem] animated:NO];
    
    self.synthesizer.delegate=self;
    self.descriptionView.textColor=[UIColor whiteColor];
    self.descriptionLabel.text=self.descriptionText;
    if (self.showCarousel) {
        self.carousel.hidden=NO;
    }
    self.closeButton.color=[UIColor whiteColor];
    [self loadImage];
    carousel.type = iCarouselTypeInvertedTimeMachine;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    
    //free up memory by releasing subviews
    self.carousel = nil;
}

-(void)setSite {
    if (self.site.location == VENEZIA) {
        Office3=CN;
        
    } else {
        Office3=VE;
        
    }
}


- (void) viewDidAppear:(BOOL)animated {
    
    [super viewDidAppear:animated];
  
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"SlotsDetailsCN";
    } else {
        value=@"SlotsDetailsVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

    
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    _imagePager.slideshowTimeInterval = 0.0f;
}

// -------------------------------------------------------------------------------
//	setNavigationPaneBarButtonItem:
//  Custom implementation for the navigationPaneBarButtonItem setter.
//  In addition to updating the _navigationPaneBarButtonItem ivar, it
//  reconfigures the toolbar to either show or hide the
//  navigationPaneBarButtonItem.
// -------------------------------------------------------------------------------
- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)navigationPaneBarButtonItem
{
    if ((navigationPaneBarButtonItem != _navigationPaneBarButtonItem) || navigationPaneBarButtonItem==nil) {
        if (navigationPaneBarButtonItem)
            [self.toolbar setItems:[NSArray arrayWithObject:navigationPaneBarButtonItem] animated:NO];
        else
            [self.toolbar setItems:nil animated:NO];
        
    }
}



#pragma mark - KIImagePager DataSource

- (NSArray *) arrayWithImages
{
    NSMutableArray *photo=[[NSMutableArray alloc] init];
    for (int i = 0; i < [(NSArray *)self.dataForGame[DataForSlot][0] count]; i++) {
        UIImage *photoName=[UIImage imageNamed:self.dataForGame[DataForSlot][0][i][Name]];
        [photo addObject:photoName];
    }
    return photo;
}


- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}





-(void)loadText {
    CMVTextForGame *textForAllGame=[[CMVTextForGame alloc] init];
  
    self.indexForGame=[self.dataForGame[1] intValue];
    
    switch (self.indexForGame) {
        case 0:
            self.speechButton.hidden=NO;
            self.descriptionView.attributedText=textForAllGame.whatWeOffer;
            self.textToBeRead=[textForAllGame.whatWeOffer string];
            break;
        case 1:
            self.speechButton.hidden=NO;
            self.descriptionView.attributedText=textForAllGame.whatsNew;
            self.textToBeRead=[textForAllGame.whatsNew string];
            break;
        case 2:
            self.speechButton.hidden=YES;
            textForAllGame.descriptionView=self.descriptionView;
            textForAllGame.textToBeRead=self.textToBeRead;
            textForAllGame.viewController=self;
            [textForAllGame updateOurJackpots];
            
            break;
        case 3:
            self.speechButton.hidden=NO;
            self.descriptionView.attributedText=textForAllGame.slotMachineRooms;
            self.textToBeRead=[textForAllGame.slotMachineRooms string];
            break;
        
    }
    
    float heightContentSize;

    heightContentSize=self.descriptionView.frame.origin.y+[self textViewHeightForAttributedText:self.descriptionView andWidth:self.view.frame.size.width];

    self.constraintheight.constant=heightContentSize;
    self.textViewHeight.constant=heightContentSize;
 
}


- (CGFloat)textViewHeightForAttributedText:(UITextView *)textView andWidth:(CGFloat)width
{
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}


#pragma mark - UICollectionViewDelegate


#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"ShowLargeImage"]) {
        CMVShowImage *showImageViewController = segue.destinationViewController;
        showImageViewController.largePhoto = sender;
    }
}

- (IBAction)done:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
    [self stopTalk];
}
- (IBAction)speak:(id)sender {
  
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        if (!talking) {
            [self readButtonPress:@"ReadingSlot"];
            AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.textToBeRead];
            //utterance.voice = AVSpeechUtterance.AVSpeechSynthesisVoice.FromLanguage ("en-AU");
            //utterance.rate=AVSpeechUtteranceMaximumSpeechRate/8;
            [self.synthesizer speakUtterance:utterance];
            talking = TRUE;
            self.speechButton.selected=FALSE;
    } else {
        [self stopTalk];
    }
    }
}

-(void)readButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"READING"
                                                          action:@"press"
                                                           label:type
                                                           value:nil] build]];
    
    [tracker set:kGAIScreenName value:nil];
}
-(void)stopTalk {
    talking=FALSE;
    [self.synthesizer stopSpeakingAtBoundary:NO];
    self.speechButton.selected=TRUE;
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
   self.speechButton.selected=TRUE;
    
}

-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self hideToolbarForiPad];
}

-(void)hideToolbarForiPad {
    if (iPAD) {
        if (UIDeviceOrientationIsLandscape([UIDevice currentDevice].orientation))
        {
            self.toolbar.hidden= YES;
        } else {
            self.toolbar.hidden= NO;
        }
    }
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {

     [self.carousel reloadData];
}

#pragma mark iCarousel methods

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    //return the total number of items in the carousel
    return [slotsEvents count];
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    //create new view if no view is available for recycling
    EventsFireBase *eventItem =(EventsFireBase *)[slotsEvents objectAtIndex:index];
    eventItem.theCarousel = carousel;
    if (view == nil) {
        float size;
        if (iPHONE) {
            size = [UIScreen mainScreen].bounds.size.height > 480.0f ? 210.0f : 130.0f;
        } else {
            size = [UIScreen mainScreen].bounds.size.height > 768.0f ? 400.0f : 170.0f;
        }
        FXImageView *imageView = [[FXImageView alloc] initWithFrame:CGRectMake(0, 0, size, size)];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.asynchronous = YES;
        imageView.reflectionScale = 0.5f;
        imageView.reflectionAlpha = 0.25f;
        imageView.reflectionGap = 10.0f;
        imageView.shadowOffset = CGSizeMake(0.0f, 2.0f);
        imageView.shadowBlur = 5.0f;
        
     //   imageView.textForImage=(NSString *)eventItem.StartDate;
        view = imageView;
    }
    
    //show placeholder
    ((FXImageView *)view).processedImage = [UIImage imageNamed:@"placeholder.png"];
     [(FXImageView *)view setImage:eventItem.ImageName];
    
    return view;
}


- (void)loadImage {

    CMVSharedClass *shared=[[CMVSharedClass alloc] init];
    self.slotsEvents=[shared retrieveSlotsEvents:PARSE_CLASS_NAME eventType:EVENTS_INDEX carousel:carousel];
    [carousel reloadData];

}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index {
    [self configureDetailItemForRow:index viewController:self.eventDelegate];
    
    if (iPHONE) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        CMVEventViewController *eventDetail = [storyboard instantiateViewControllerWithIdentifier:@"EventViewControlleriPhone"];
        if (eventDetail) {
            [eventDetail selectedEvent:selectedEvent];
        }
        [self presentViewController:eventDetail animated:YES completion:nil];
        
    } else {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
        CMVEventViewController *eventDetail = [storyboard instantiateViewControllerWithIdentifier:@"EventDetailsForSlots"];
        if (eventDetail) {
            [eventDetail selectedEvent:selectedEvent];
        }
        [self presentViewController:self.eventDelegate animated:YES completion:nil];
    }
}

- (void)configureDetailItemForRow:(NSUInteger)row viewController:(CMVEventViewController *)viewController  {
    
    selectedEvent = [self.slotsEvents objectAtIndex:row];
}



@end
