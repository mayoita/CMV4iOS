//
//  CMVSwipeTableViewCell.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/10/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSwipeTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "CMVConstants.h"
#import "CMVLocalize.h"

#define kUtilityButtonsWidthMax 414
#define kUtilityButtonWidthDefault 90
#define ROW_HEIGHT 204


static NSString * const kTableViewCellContentView = @"UITableViewCellContentView";

typedef enum {
    kCellStateCenter,
    kCellStateLeft,
    kCellStateRight
} SWCellState;

#pragma mark - SWUtilityButtonView

@interface SWUtilityButtonView : UIView

@property (nonatomic, strong) NSArray *utilityButtons;
@property (nonatomic) CGFloat utilityButtonWidth;
@property (nonatomic, weak) CMVSwipeTableViewCell *parentCell;
@property (nonatomic) SEL utilityButtonSelector;

- (id)initWithUtilityButtons:(NSArray *)utilityButtons parentCell:(CMVSwipeTableViewCell *)parentCell utilityButtonSelector:(SEL)utilityButtonSelector;

- (id)initWithFrame:(CGRect)frame utilityButtons:(NSArray *)utilityButtons parentCell:(CMVSwipeTableViewCell *)parentCell utilityButtonSelector:(SEL)utilityButtonSelector;

@end

@implementation SWUtilityButtonView

#pragma mark - SWUtilityButonView initializers

- (id)initWithUtilityButtons:(NSArray *)utilityButtons
                  parentCell:(CMVSwipeTableViewCell *)parentCell
       utilityButtonSelector:(SEL)utilityButtonSelector {
    
    self = [super init];
    
    if (self) {
        self.utilityButtons = utilityButtons;
        self.utilityButtonWidth = [self calculateUtilityButtonWidth];
        self.parentCell = parentCell;
        self.utilityButtonSelector = utilityButtonSelector; // eh.
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
     utilityButtons:(NSArray *)utilityButtons
         parentCell:(CMVSwipeTableViewCell *)parentCell
utilityButtonSelector:(SEL)utilityButtonSelector {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.utilityButtons = utilityButtons;
        self.utilityButtonWidth = [self calculateUtilityButtonWidth];
        self.parentCell = parentCell;
        self.utilityButtonSelector = utilityButtonSelector; 
    }
    
    return self;
}

#pragma mark Populating utility buttons

- (CGFloat)calculateUtilityButtonWidth {
    CGFloat buttonWidth = kUtilityButtonWidthDefault;
    if (buttonWidth * _utilityButtons.count > kUtilityButtonsWidthMax) {
        CGFloat buffer = (buttonWidth * _utilityButtons.count) - kUtilityButtonsWidthMax;
        buttonWidth -= (buffer / _utilityButtons.count);
    }
    return buttonWidth;
}

- (CGFloat)utilityButtonsWidth {
    return (_utilityButtons.count * _utilityButtonWidth);
}

- (void)populateUtilityButtons {
    NSUInteger utilityButtonsCounter = 0;
    for (UIButton *utilityButton in _utilityButtons) {
        CGFloat utilityButtonXCord = 0;
        if (utilityButtonsCounter >= 1) utilityButtonXCord = _utilityButtonWidth * utilityButtonsCounter;
        [utilityButton setFrame:CGRectMake(utilityButtonXCord, 0, _utilityButtonWidth, CGRectGetHeight(self.bounds))];
        [utilityButton setTag:utilityButtonsCounter];
        [utilityButton addTarget:self.parentCell
                          action:self.utilityButtonSelector
                forControlEvents:UIControlEventTouchDown];
        [self addSubview: utilityButton];
        utilityButtonsCounter++;
    }
}

@end

@interface CMVSwipeTableViewCell () <UIScrollViewDelegate> {
    SWCellState _cellState; // The state of the cell within the scroll view, can be left, right or middle
   // bool talking;
}


// Scroll view to be added to UITableViewCell
@property (nonatomic, weak) UIScrollView *cellScrollView;

// The cell's height
@property (nonatomic) CGFloat height;
@property(nonatomic)CGFloat mywidth;


@property (nonatomic, strong) SWUtilityButtonView *scrollViewButtonViewRight;

@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@end

@implementation CMVSwipeTableViewCell
@synthesize eventName;
@synthesize talking;

#pragma mark Initializers

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
       
    }
    
    return self;
}

- (id)init {
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

//IBOutlets are loaded only in awakeFromNib so this is the right method where configure custom initialization
-(void)awakeFromNib {
    NSMutableArray *rightUtilityButtons = [NSMutableArray new];
    [rightUtilityButtons addUtilityButtonWithColor:[UIColor clearColor] icon:[UIImage imageNamed:@"TwitterIcon.png"]];
    [rightUtilityButtons addUtilityButtonWithColor:[UIColor clearColor] icon:[UIImage imageNamed:@"FacebookIcon.png"]];
    [rightUtilityButtons addUtilityButtonWithColor:[UIColor clearColor] icon:[UIImage imageNamed:@"CalendarIcon.png"]];
    talking=NO;
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    CGFloat myHeight;
    if (iPAD) {
        self.myWidth = 320;
        myHeight=203;
    } else {
        self.myWidth = screenRect.size.width;
        myHeight=(203*self.myWidth)/320;
    }
  
    [self initWithHeight:myHeight rightUtilityButtons:rightUtilityButtons];
}



-(void)initWithHeight:(CGFloat)height rightUtilityButtons:(NSArray *)rightUtilityButtons {
    self.height = height;
    //Speech button setup
    self.readDescriptionS.hidden=YES;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.synthesizer = [[AVSpeechSynthesizer alloc] init];
        self.readDescriptionS.hidden=NO;
    }
    self.synthesizer.delegate=self;
    
    CGRect pictureFrame=CGRectMake(-self.eventPicture.frame.origin.x, self.eventPicture.frame.origin.y, kUtilityButtonsWidthMax-self.eventPicture.frame.origin.x, self.height);
    
    self.rightUtilityButtons = rightUtilityButtons;
    ;
    
    // Set up scroll view that will host our cell content
    UIScrollView *cellScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), _height)];
   
    cellScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) + [self utilityButtonsPadding], _height);
    cellScrollView.contentOffset = CGPointZero;
    cellScrollView.delegate = self;
    cellScrollView.showsHorizontalScrollIndicator = NO;
    cellScrollView.bounces=NO;
    
    //Set up single tap recognizer
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                action:@selector(singleTapGestureCaptured:)];
    [cellScrollView addGestureRecognizer:singleTap];
    
    self.cellScrollView = cellScrollView;
    if (iPAD) {
        self.cellScrollView.scrollEnabled=NO;
    }
    
    // Set up the views that will hold the utility buttons
    SWUtilityButtonView *scrollViewButtonViewRight = [[SWUtilityButtonView alloc] initWithUtilityButtons:_rightUtilityButtons
                                                                                              parentCell:self
                                                                                   utilityButtonSelector:@selector(rightUtilityButtonHandler:)];

    
    
    // Add the background pattern
    UIImageView* backgroundImageView = [[UIImageView alloc] initWithFrame:pictureFrame];
    [backgroundImageView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"dotted-pattern.png"]]];
    [scrollViewButtonViewRight addSubview:backgroundImageView];
  
    
    // Overlay a shadow image that adds a subtle darker drop shadow around the edges
    UIImage* shadow = [[UIImage imageNamed:@"inner-shadow.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:0];
    UIImageView* shadowImageView = [[UIImageView alloc] initWithFrame:pictureFrame];
    shadowImageView.alpha = 0.6;
    shadowImageView.image = shadow;
    [scrollViewButtonViewRight addSubview:shadowImageView];
    [scrollViewButtonViewRight setFrame:CGRectMake(self.eventPicture.frame.origin.x, 0, [self rightUtilityButtonsWidth], _height)];
   
    
    self.scrollViewButtonViewRight = scrollViewButtonViewRight;
    scrollViewButtonViewRight.hidden=YES;
    [self.cellScrollView addSubview:scrollViewButtonViewRight];
    
    // Populate the button views with utility buttons
 
    [scrollViewButtonViewRight populateUtilityButtons];
 
    
    // Create the content view that will live in our scroll view
    UIView *scrollViewContentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.bounds), self.height)];
    scrollViewContentView.backgroundColor = [UIColor clearColor];

    self.eventPicture.frame=CGRectMake(0, 0, CGRectGetWidth(self.bounds), self.height);
    self.picture = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.myWidth, self.height)];

    self.picture.contentMode=UIViewContentModeScaleToFill;
    self.picture.image=self.eventPicture.image;

   // [scrollViewContentView addSubview:self.eventPicture];
   // [scrollViewContentView addSubview:self.demoView];
    self.labelForPoker=[[UILabel alloc] initWithFrame:CGRectMake(30, 30, 280, 21)];
    self.labelForPoker.numberOfLines=0;
    self.labelForPoker.minimumScaleFactor=0.5;
    self.labelForPoker.adjustsFontSizeToFitWidth=YES;
    
    self.readDescriptionS=[[UIImageView alloc] initWithFrame:CGRectMake(8, 8, 50, 50)];
    self.readDescriptionS.image = [UIImage imageNamed:@"speak"];
    self.readDescriptionS.contentMode = UIViewContentModeScaleToFill;

    UITapGestureRecognizer *singleTapS = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
    singleTapS.numberOfTapsRequired = 1;
    [self.readDescriptionS setUserInteractionEnabled:YES];
    [self.readDescriptionS addGestureRecognizer:singleTapS];

    
    self.dateForPoker=[[UILabel alloc] initWithFrame:CGRectMake(30, 50, 261, 21)];
    self.dateForPoker.minimumScaleFactor=0.5;
    self.dateForPoker.adjustsFontSizeToFitWidth=YES;
  
    
    [scrollViewContentView addSubview:self.picture];
    [scrollViewContentView addSubview:self.eventName];
    //[scrollViewContentView addSubview:self.eventDescription];
    
    //[scrollViewContentView addSubview:self.labelTitle];
    
   
    [scrollViewContentView addSubview:self.eventStartDate];
    [scrollViewContentView addSubview:self.labelForPoker];
    
    [scrollViewContentView addSubview:self.dateForPoker];
   
  
   [scrollViewContentView addSubview:self.readDescriptionS];
    
    //[scrollViewContentView addSubview:self.demoView];
    
    [self.cellScrollView addSubview:scrollViewContentView];
    self.scrollViewContentView = scrollViewContentView;
    
    [self.contentView addSubview:cellScrollView];
}

#pragma mark - Utility buttons handling & single tap recognizer

- (void)rightUtilityButtonHandler:(id)sender {
    UIButton *utilityButton = (UIButton *)sender;
    NSInteger utilityButtonTag = [utilityButton tag];
    [_delegate swippableTableViewCell:self didTriggerRightUtilityButtonWithIndex:utilityButtonTag];
}

-(void)singleTapGestureCaptured:(id)sender {
    [_delegate tapTableViewCell:self];
}

#pragma mark - Overriden methods

- (void)layoutSubviews {
    [super layoutSubviews];
   
    self.cellScrollView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), _height);
    self.cellScrollView.contentSize = CGSizeMake(CGRectGetWidth(self.bounds) + [self utilityButtonsPadding], _height);
    self.cellScrollView.contentOffset = CGPointZero;

    //self.scrollViewButtonViewRight.frame = CGRectMake(CGRectGetWidth(self.bounds), 0, [self rightUtilityButtonsWidth], _height);
    self.scrollViewButtonViewRight.frame = CGRectMake(self.eventPicture.frame.origin.x, 0, [self rightUtilityButtonsWidth], _height);
    self.scrollViewContentView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), _height);
    
}

#pragma mark - Setup helpers


- (CGFloat)rightUtilityButtonsWidth {
    return [_scrollViewButtonViewRight utilityButtonsWidth];
}

- (CGFloat)utilityButtonsPadding {
    return [_scrollViewButtonViewRight utilityButtonsWidth];
}

#pragma mark UIScrollView helpers

- (void)scrollToRight:(inout CGPoint *)targetContentOffset{
    targetContentOffset->x = [self utilityButtonsPadding];
    _cellState = kCellStateRight;
}

- (void)scrollToCenter:(inout CGPoint *)targetContentOffset {
    targetContentOffset->x = 0;
    _cellState = kCellStateCenter;
}

- (void)scrollToLeft:(inout CGPoint *)targetContentOffset{
    targetContentOffset->x = 0;
    _cellState = kCellStateLeft;
}

#pragma mark UIScrollViewDelegate

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView
                     withVelocity:(CGPoint)velocity
              targetContentOffset:(inout CGPoint *)targetContentOffset {
    
    switch (_cellState) {
        case kCellStateCenter:
            if (velocity.x >= 0.5f) {
                [self scrollToRight:targetContentOffset];
            } else if (velocity.x <= -0.5f) {
                [self scrollToLeft:targetContentOffset];
            } else {
                CGFloat rightThreshold = [self utilityButtonsPadding] - ([self rightUtilityButtonsWidth] / 2);
                CGFloat leftThreshold = 0 / 2;
                if (targetContentOffset->x > rightThreshold)
                    [self scrollToRight:targetContentOffset];
                else if (targetContentOffset->x < leftThreshold)
                    [self scrollToLeft:targetContentOffset];
                else
                    [self scrollToCenter:targetContentOffset];
            }
            break;

        case kCellStateRight:
            if (velocity.x >= 0.5f) {
                // No-op
                
            } else if (velocity.x <= -0.5f) {
               
                    [self scrollToCenter:targetContentOffset];
                
                
            } else {
                if (targetContentOffset->x < ([self utilityButtonsPadding] - [self rightUtilityButtonsWidth] / 2)) {
                    [self scrollToCenter:targetContentOffset];
                }
                else
                    [self scrollToRight:targetContentOffset];
            }
            break;
        default:
            break;
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x > 0) {
        // Expose the right button view
        self.scrollViewButtonViewRight.hidden=NO;
        self.scrollViewButtonViewRight.frame = CGRectMake(scrollView.contentOffset.x + (CGRectGetWidth(self.bounds) - [self rightUtilityButtonsWidth]), 0.0f, [self rightUtilityButtonsWidth], _height);
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.x == 0) {
        // Expose the right button view
        self.scrollViewButtonViewRight.hidden=YES;
        self.scrollViewButtonViewRight.frame = CGRectMake(scrollView.contentOffset.x + (CGRectGetWidth(self.bounds) - [self rightUtilityButtonsWidth]), 0.0f, [self rightUtilityButtonsWidth], _height);
    }
}

-(void)tapDetected{
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        if (self.eventMemo) {
            if (!talking) {
                [self readButtonPress:@"ReadingEvent"];
                AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:self.eventMemo];
                //utterance.voice = AVSpeechUtterance.AVSpeechSynthesisVoice.FromLanguage ("en-AU");
              //  utterance.rate=AVSpeechUtteranceMaximumSpeechRate/4;
                [self.synthesizer speakUtterance:utterance];
                talking = TRUE;
                self.readDescriptionS.image =[UIImage imageNamed:@"speak_f"];
            } else {
                [self stopTalk];
            }
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

    self.readDescriptionS.image =[UIImage imageNamed:@"speak"];
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {

    self.readDescriptionS.image =[UIImage imageNamed:@"speak"];

}

@end

#pragma mark NSMutableArray class extension helper

@implementation NSMutableArray (SWUtilityButtons)

- (void)addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self addObject:button];
}

- (void)addUtilityButtonWithColor:(UIColor *)color icon:(UIImage *)icon {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = color;
    [button setImage:icon forState:UIControlStateNormal];
    [self addObject:button];
}

@end
