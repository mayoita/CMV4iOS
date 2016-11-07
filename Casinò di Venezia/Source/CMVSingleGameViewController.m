//
//  CMVSingleGameViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 12/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSingleGameViewController.h"
#import "CMVShowImage.h"
#import "MZFormSheetController.h"
#import "CMVFesturesFlowLayout.h"
#import "MZNavViewController.h"
#import "CMVTable.h"
#import "CMVAppDelegate.h"
#import "CMVCloseButton.h"
#import "CMVTextForGame.h"


#define ImageForGame 0
#define TextForGame 1
#define ImageZoom 2

#define DescriptionRoot 3
#define Description 0
#define Description2 1
#define BigLabel 0
#define SmallLabel 2
#define FeaturesText 1
#define widthMasterViewController 320.0f
#define collectionViewInsets 70.0f
#define aspectRatioImage 0.48



@interface CMVSingleGameViewController ()
@property (nonatomic,strong) NSArray *dataSource;
@property (weak, nonatomic) IBOutlet CMVTable *tableImageView;
@property(strong,nonatomic)CMVFesturesFlowLayout *flowLayout;
@property (nonatomic, strong) AVSpeechSynthesizer *synthesizer;
@property(strong,nonatomic)UIView *myGameView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@property (weak, nonatomic) IBOutlet CMVCloseButton *closeButton;

@end

@implementation CMVSingleGameViewController
@synthesize talking;


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    //Theme
    self.gameName.font=GOTHAM_XLight(30);
	self.ArrowSx.color=BRAND_YELLOW_COLOR;
    self.ArrowDx.color=BRAND_YELLOW_COLOR;
    self.imageHeight.constant= self.view.frame.size.width*aspectRatioImage;
    //self.imageView.contentMode = UIViewContentModeScaleAspectFill;
    [self setUpGame];
    
    UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openLargeImage)];
    tap.numberOfTapsRequired=1;
    self.textView.textColor=[UIColor whiteColor];
    [self.myShadowImage addGestureRecognizer:tap];

    
    //MZForm Setup
    [[MZFormSheetController appearance] setCornerRadius:20.0];
  //  [[MZFormSheetBackgroundWindow appearance] setBackgroundColor:[UIColor clearColor]];
    [[MZFormSheetBackgroundWindow appearance] setBackgroundBlurEffect:YES];
    
    //Setup for collectionView
    self.flowLayout = [[CMVFesturesFlowLayout alloc] init];
    if (iPHONE) {
        [self.flowLayout setItemSize:CGSizeMake(270, 50)];
    } else {
        [self calculateItemSizeForiPad];
        if (_navigationPaneBarButtonItem)
            [self.toolbar setItems:[NSArray arrayWithObject:self.navigationPaneBarButtonItem] animated:NO];
    }
    
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.flowLayout setMinimumInteritemSpacing:0.0f];
    [self.flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setCollectionViewLayout:self.flowLayout];
    self.closeButton.color=[UIColor whiteColor];
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.synthesizer = [[AVSpeechSynthesizer alloc] init];
        
    }

}

-(void)viewWillLayoutSubviews {
    self.textView.contentOffset=CGPointZero;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
       value=@"TableGameDetailsCN";
    } else {
        value=@"TableGameDetailsVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}



#pragma mark -
#pragma mark SubstitutableDetailViewController

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
        //self.toolbar.hidden=YES;
    } 
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    
    [self calculateItemSizeForiPad];
}

-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
  
    [self.collectionView performBatchUpdates:nil completion:nil];
}

-(void)calculateItemSizeForiPad {

    UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
  
    if ((orientation == UIDeviceOrientationLandscapeRight) || (orientation == UIDeviceOrientationLandscapeLeft))
    {
        if (self.flowLayout.itemSize.width == 633.0f) {
            [self.flowLayout setItemSize:CGSizeMake(698.0f, 50)];
        } else {
            [self.flowLayout setItemSize:CGSizeMake(633.0f, 50)];
        }
        
    }
    else if ((orientation == UIDeviceOrientationPortrait) || (orientation == UIDeviceOrientationPortraitUpsideDown))
    {
        if (self.flowLayout.itemSize.width == 698.0f) {
            [self.flowLayout setItemSize:CGSizeMake(633.0f, 50)];
        } else {
            [self.flowLayout setItemSize:CGSizeMake(698.0f, 50)];
        }
        
    }
}

-(void)openLargeImage {
if (![self.dataForGame[ImageForGame]  isEqual: @""]) {
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard=appDelegate.storyboard;
    
    CMVShowImage *presentingViewController=  [storyboard instantiateViewControllerWithIdentifier:@"GameZoom"];
    //presentingViewController.largePhoto=self.imageView.image;
    presentingViewController.largePhoto=[UIImage imageNamed:self.dataForGame[ImageZoom]];
    [self presentViewController:presentingViewController animated:YES completion:nil];
}
}


-(void)setUpGame {
    if ([self.dataForGame[ImageForGame]  isEqual: @""]) {
        self.noImage.hidden=NO;
        self.noImage.text=NSLocalizedString(@"No image for this game", nil);
        self.myShadowImage.hidden=YES;
    } else {
        self.noImage.hidden=YES;
        //self.myShadowImage.myImage.image=[UIImage imageNamed:self.dataForGame[ImageForGame]];
        self.imageView.image=[UIImage imageNamed:self.dataForGame[ImageForGame]];
        self.myShadowImage.hidden=NO;
       ;
    }
    
    self.indexForGame=[self.dataForGame[TextForGame] intValue];
    CMVTextForGame *textForAllGame=[[CMVTextForGame alloc] init];
    
    switch (self.indexForGame) {
        case 0:
            self.textView.attributedText=textForAllGame.fairRoulette;
            break;
        case 1:
            self.textView.attributedText=textForAllGame.blackJack;
            break;
        case 2:
            self.textView.attributedText=textForAllGame.midTrenteEtQuarante;
            break;
        case 3:
            self.textView.attributedText=textForAllGame.texasHold;
            break;
        case 4:
            self.textView.attributedText=textForAllGame.puntoBanco;
            break;
        case 5:
            self.textView.attributedText=textForAllGame.carribeanPoker;
            break;
        case 6:
           self.textView.attributedText=textForAllGame.frenchRoulette;
            break;
        case 7:
            self.textView.attributedText=textForAllGame.chemin;
            break;
        default:
            break;
    }
    [self.collectionView reloadData];
}
- (IBAction)backButton:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
}


#pragma Collection view delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *numberOfElement=self.dataForGame[DescriptionRoot];
    return numberOfElement.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"FesturesCell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:100];
    cellLabel.font=GOTHAM_XLight(20);
    cellLabel.textColor=BRAND_YELLOW_COLOR;
    cellLabel.text = self.dataForGame[DescriptionRoot][indexPath.row][BigLabel];
    
    UILabel *cellLabelSmall = (UILabel *)[cell viewWithTag:99];
    cellLabelSmall.text = self.dataForGame[DescriptionRoot][indexPath.row][SmallLabel];
    cellLabelSmall.font=GOTHAM_XLight(15);
    cellLabelSmall.textColor=[UIColor whiteColor];
    cellLabelSmall.numberOfLines=2;
    cellLabelSmall.minimumScaleFactor=0;
    
    CMVTable *tableImageView=(CMVTable *)[cell viewWithTag:98];
    if ([self thereIsFeaturesArray:indexPath]) {
         tableImageView.hidden=NO;
    } else {
         tableImageView.hidden=YES;
    }
   
    return cell;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {

    NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:self.collectionView.contentOffset];
    

    
    if (self.dataForGame[DescriptionRoot][indexPath.row][FeaturesText] != NULL) {
        
        self.textView.attributedText=[self featuresText:indexPath.row];
        
    }
    
    if (self.collectionView.contentOffset.x < self.collectionView.frame.size.width)  {
        self.ArrowSx.hidden=YES;
    } else {
        self.ArrowSx.hidden=NO;
    }
    
    if (self.collectionView.contentOffset.x == self.collectionView.contentSize.width-self.collectionView.frame.size.width)  {
        self.ArrowDx.hidden=YES;
    } else {
        self.ArrowDx.hidden=NO;
    }
}

-(NSMutableAttributedString *)featuresText:(int)rowText {
    NSMutableAttributedString *theText=[[NSMutableAttributedString alloc] init];
    CMVTextForGame *textForAllGame=[[CMVTextForGame alloc] init];
    switch (self.indexForGame) {
        case 0:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.fairRoulette;
                    break;
                case 1:
                    theText=textForAllGame.multipleChances;
                    break;
                case 2:
                    theText=textForAllGame.simpleChances;
                    break;
                case 3:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 4:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 5:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 6:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 7:
                    theText=textForAllGame.sectorAndFinals;
                    break;
                case 8:
                    theText=textForAllGame.generalRules;
                    break;
                
                default:
                    break;
            }
            break;
        case 1:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.blackJack;
                    break;
                case 1:
                    theText=textForAllGame.variationsBJ;
                    break;
                case 2:
                    theText=textForAllGame.generalBJ;
                    break;
                    
                default:
                    break;
            }
            break;
        case 2:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.midTrenteEtQuarante;
                    break;
                case 1:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 2:
                    theText=textForAllGame.apresMTQ;
                    break;
                case 3:
                    theText=textForAllGame.generalMTQ;
                    break;
                    
                default:
                    break;
            }
            break;
        case 3:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.texasHold;
                    break;
                case 1:
                    theText=textForAllGame.differentTH;
                    break;
                case 2:
                    theText=textForAllGame.flopTH;
                    break;
                case 3:
                    theText=textForAllGame.betTH;
                    break;
                case 4:
                    theText=textForAllGame.notesTH;
                    break;
                default:
                    break;
            }
            break;
        case 4:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.puntoBanco;
                    break;
                case 1:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 2:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 3:
                    theText=textForAllGame.notesPunto;
                    break;
               
            }
            break;
        case 5:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.carribeanPoker;
                    break;
                case 1:
                    theText=textForAllGame.progresiveCarribean;
                    break;
                case 2:
                    theText=textForAllGame.generalCarribean;
                    break;
                
            }
            break;
        case 6:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.frenchRoulette;
                    break;
                case 1:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 2:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 3:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 4:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 5:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 6:
                    theText=textForAllGame.tapTheRoll;
                    break;
                case 7:
                    theText=textForAllGame.sectorFrench;
                    break;
                case 8:
                    theText=textForAllGame.generalFrench;
                    break;
                    
                default:
                    break;
            }
            break;
        case 7:
            switch (rowText) {
                case 0:
                    theText=textForAllGame.chemin;
                    break;
                case 1:
                    theText=textForAllGame.cheminTheGame;
                    break;
                case 2:
                    theText=textForAllGame.playingChemin;
                    break;
                case 3:
                    theText=textForAllGame.generalChemin;
                    break;
                    
            }
            break;
        default:
            break;
    }
    return theText;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout  *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        return CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    }
    return CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
}

- (void)collectionView:(UICollectionView *)collectionView
didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self thereIsFeaturesArray:indexPath]) {
        [self backgroundTapToDismiss:indexPath];
    }
}

-(BOOL)thereIsFeaturesArray:(NSIndexPath *)indexPath {
    NSArray *existElementForArray =self.dataForGame[DescriptionRoot][indexPath.row];
    if (existElementForArray.count > 3) {
        return true;
    } else {
        return false;
    }
}

- (void)backgroundTapToDismiss:(NSIndexPath *)indexPath
{
    UINavigationController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"gameFeatures"];
    MZNavViewController *featuresView=vc.viewControllers[0];
    
    featuresView.title=self.dataForGame[DescriptionRoot][indexPath.row][SmallLabel];
    [featuresView setDataSourceForFeatures:self.dataForGame[DescriptionRoot][indexPath.row]];
    MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:vc];

    formSheet.transitionStyle = MZFormSheetTransitionStyleDropDown;
    formSheet.shouldDismissOnBackgroundViewTap = YES;
    
    [formSheet presentAnimated:YES completionHandler:nil];
    
    formSheet.didTapOnBackgroundViewCompletionHandler = ^(CGPoint location)
    {
        
    };
}
- (IBAction)close:(id)sender {
    [self stopTalk];
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)readDescription:(id)sender {
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        if (self.textView.text) {
            if (!talking) {
                [self readButtonPress:@"ReadingGame"];
                AVSpeechUtterance *utterance = [AVSpeechUtterance speechUtteranceWithString:[NSString stringWithString:self.textView.text]];
                
                //utterance.rate=AVSpeechUtteranceMaximumSpeechRate/8;
                [self.synthesizer speakUtterance:utterance];
                talking = TRUE;
                self.readDescription.selected=FALSE;
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
    self.readDescription.selected=TRUE;
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance {
    self.readDescription.selected=TRUE;
    
}

@end
