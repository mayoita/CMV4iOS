//
//  CMVPokerHourMain.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 15/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVPokerHourMain.h"
#import "CMVFesturesFlowLayout.h"
#import "CMVEventKitShared.h"
#import "CMVConstants.h"


#define indexForTextRules 1
#define indexForNotes 1
#define cellIdentifier @"PokerHourCellNew"

#define VE 0
#define CN 1

@interface CMVPokerHourMain ()
@property(strong,nonatomic)CMVFesturesFlowLayout *flowLayout;
@property(nonatomic)NSInteger currentItem;
@property(nonatomic)NSInteger currentOffice;

@end

@implementation CMVPokerHourMain{
    AAShareBubbles *shareBubbles;
    float radius;
    float bubbleRadius;
}
//current item on datasource

- (void)viewDidLoad {
    [super viewDidLoad];

    radius = 130;
    bubbleRadius = 40;
    self.noteGenerali.attributedText= [self formatTextForPokerHour:0];
   
    
    // Do any additional setup after loading the view.
    if (iPHONE) {
        [self.tableView registerNib:[UINib nibWithNibName:@"PokerHourCellNew" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    } else {
        [self.tableView registerNib:[UINib nibWithNibName:@"PokerHourCellNewiPAD" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor clearColor];
    self.closeButton.color=[UIColor whiteColor];
    
    //Setup for collectionView
    self.flowLayout = [[CMVFesturesFlowLayout alloc] init];
    if (iPHONE) {
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BK_date_PokerHour.png"]];
        [self.flowLayout setItemSize:CGSizeMake(280, 50)];
    } else {
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BK_date_PokerHouriPAD.png"]];
        [self calculateItemSizeForiPad];
        self.closeButton.hidden = YES;
        if (_navigationPaneBarButtonItem)
            [self.toolbar setItems:[NSArray arrayWithObject:self.navigationPaneBarButtonItem] animated:NO];
    }
    
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.flowLayout setMinimumInteritemSpacing:0.0f];
    [self.flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setCollectionViewLayout:self.flowLayout];
    
  
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
        //self.toolbar.hidden=YES;
    }
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

-(NSDictionary *)firstAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    mutParaStyleJustified.lineSpacing=2.0;
    
     if (self.currentOffice == CN) {
    return @{NSForegroundColorAttributeName: BRAND_GREEN_COLOR,
             NSFontAttributeName:GOTHAM_Medium(14),
             NSParagraphStyleAttributeName:mutParaStyleJustified};
     } else {
         return @{NSForegroundColorAttributeName: BRAND_RED_COLOR,
                  NSFontAttributeName:GOTHAM_Medium(14),
                  NSParagraphStyleAttributeName:mutParaStyleJustified};
     }
}

-(NSDictionary *)secondAttributes {
    NSMutableParagraphStyle *mutParaStyleCenter=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleCenter setAlignment:NSTextAlignmentJustified];
    
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowBlurRadius:1.0];
    [shadowDic setShadowColor:[UIColor blackColor]];
    [shadowDic setShadowOffset:CGSizeMake(0, 1)];
    
    return @{NSForegroundColorAttributeName: [UIColor whiteColor],
             NSFontAttributeName:GOTHAM_Medium(12),
             NSShadowAttributeName:shadowDic,
             NSParagraphStyleAttributeName:mutParaStyleCenter};
    
}

-(NSMutableAttributedString *)formatTextForPokerHour:(int)indice {
    NSMutableAttributedString *formattedText = [[NSMutableAttributedString alloc] init];
 
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    
    NSArray *arrayText =_dataSourceItemsWithRules.TournamentRules;
    NSArray *obj;
    for (obj in _dataSourceItems[indice][2]) {
        if (![obj[8]  isEqual: @""]) {
            NSString *textNote=[NSString stringWithFormat:@"%@%@",obj[8],@"\n\n"];;
            NSInteger _stringLengthText=[textNote length];
            NSMutableAttributedString *attMyString2=[[NSMutableAttributedString alloc] initWithString:textNote];
            [attMyString2 setAttributes:secondAttributes range:NSMakeRange(0, _stringLengthText)];
            
            [formattedText appendAttributedString:attMyString2];
        }
    }
    
    
    
    for (int i=0; i < arrayText.count; i++) {
            
            NSString *title=[NSString stringWithFormat:@"%@%@",arrayText[i][0],@"\n"];
            NSInteger _stringLength=[title length];
            NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:title];
            [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
            
            NSString *textNote=[NSString stringWithFormat:@"%@%@",arrayText[i][1],@"\n\n"];;
            NSInteger _stringLengthText=[textNote length];
            NSMutableAttributedString *attMyString2=[[NSMutableAttributedString alloc] initWithString:textNote];
            [attMyString2 setAttributes:secondAttributes range:NSMakeRange(0, _stringLengthText)];
        
        [formattedText appendAttributedString:attMyString];
        [formattedText appendAttributedString:attMyString2];
    }
    return formattedText;
}

#pragma Collection view delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //if ([[self.dataSourceItemsWithRules lastObject] count] == 1) {
   
    if (self.dataSourceItems.count == 1) {
        self.arrowSx.hidden=YES;
    } else {
        self.arrowSx.hidden=NO;
    }
    //return [[self.dataSourceItemsWithRules lastObject] count];
    return self.dataSourceItems.count;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"MyCollectionCell";
   
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    UILabel *cellLabel = (UILabel *)[cell viewWithTag:120];
    if (self.currentOffice == CN) {
        cellLabel.textColor = BRAND_GREEN_COLOR;
    } else {
        cellLabel.textColor = BRAND_RED_COLOR;
    }
    
    cellLabel.text = [self stringToDate:self.dataSourceItems[indexPath.row][1]];
    
    return cell;
}

- (NSString *)stringToDate:(NSString *)myString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
  
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
 
    NSDate *dateFromString = [[NSDate alloc] init];

    dateFromString = [dateFormatter dateFromString:myString];

    NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"EEEEdMMMM" options:0
                                                              locale:[NSLocale currentLocale]];

    [dateFormatter setDateFormat:formatString];
    NSString *myNewFormatDate = [dateFormatter stringFromDate:dateFromString].uppercaseString;

    return myNewFormatDate;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    if (scrollView.tag == 1) {
       
        NSIndexPath *indexPath = [self.collectionView indexPathForItemAtPoint:self.collectionView.contentOffset];
        self.currentItem = indexPath.row ;
        [self.tableView reloadData];
        NSLog(@"index: %@", indexPath);
        self.noteGenerali.attributedText= [self formatTextForPokerHour:indexPath.row];
        if (self.collectionView.contentOffset.x < self.collectionView.frame.size.width)  {
            self.arrowDx.hidden=YES;
        } else {
            self.arrowDx.hidden=NO;
        }
        
        if (self.collectionView.contentOffset.x == self.collectionView.contentSize.width-self.collectionView.frame.size.width)  {
            self.arrowSx.hidden=YES;
        } else {
            self.arrowSx.hidden=NO;
        }
    }
    
}

-(void)colorArrowAndlabel {
    if (self.currentOffice == CN) {
        self.arrowSx.color=BRAND_GREEN_COLOR;
        [self.arrowSx setNeedsDisplay];
        self.arrowDx.color =BRAND_GREEN_COLOR;
        [self.arrowDx setNeedsDisplay];

    } else {
        
        self.arrowSx.color=BRAND_RED_COLOR;
        [self.arrowSx setNeedsDisplay];
        self.arrowDx.color =BRAND_RED_COLOR;
        [self.arrowDx setNeedsDisplay];

    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout  *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // Adjust cell size for orientation
    if (UIDeviceOrientationIsLandscape([[UIApplication sharedApplication] statusBarOrientation])) {
        return CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
    }
    return CGSizeMake(self.collectionView.bounds.size.width, self.collectionView.bounds.size.height);
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //It's mean that the tableview shows only one day rounds
    NSArray *items = self.dataSourceItems[self.currentItem][2];
    return items.count ;
}

-(void)viewWillLayoutSubviews {
    self.noteGenerali.contentOffset=CGPointZero;
}

-(void)viewWillAppear:(BOOL)animated {
    self.currentItem = 0;
     self.nomeTorneo.text=_dataSourceItemsWithRules.TournamentName;
     [self colorArrowAndlabel];
    self.arrowDx.hidden = YES;
    self.noteGenerali.attributedText= [self formatTextForPokerHour:0];
    [self.tableView reloadData];
   

}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
  
    
    NSIndexPath *myIndex = [NSIndexPath indexPathForItem:0 inSection:0];
    if (self.dataSourceItems ) {
        [self.collectionView scrollToItemAtIndexPath:myIndex atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    
    
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"PokerCN";
    } else {
        value=@"PokerVE";
    }
   
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"PokerHourDetails"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}





-(void)updateDataCollectionAndTable {
    self.currentItem = 0;
    self.nomeTorneo.text=_dataSourceItemsWithRules.TournamentName;
    [self colorArrowAndlabel];
    self.arrowDx.hidden = YES;
    self.noteGenerali.attributedText= [self formatTextForPokerHour:0];
    [self.tableView reloadData];
    NSIndexPath *myIndex = [NSIndexPath indexPathForItem:0 inSection:0];
    if (self.dataSourceItems ) {
        [self.collectionView scrollToItemAtIndexPath:myIndex atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMVPokerHourCellNew *cell = (CMVPokerHourCellNew *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];


    cell.torneo.text = self.dataSourceItems[self.currentItem][0];
    cell.ora.text = [self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][0];
    cell.round.text = [self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][1];
    
   
    cell.buyin.text = [self checkMyClass:[self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][2]];
    cell.stack.text = [self checkMyClass:[self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][3]];
    cell.blinds.text = [self checkMyClass:[self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][4]];
    cell.late.text = [self checkMyClass:[self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][5]];
    cell.cap.text = [self checkMyClass:[self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][6]];
  
    cell.note.text = [self.dataSourceItems[self.currentItem][2] objectAtIndex:indexPath.item][7];
    
    return cell;
}

-(NSString *)checkMyClass:(id)myFiled {
    NSString *check;
    if ([myFiled isKindOfClass:[NSString class]]) {
        if ([myFiled isEqualToString:@"0"]) {
            check = @"-";
        } else {
        check= myFiled;
        }
    } else if ([myFiled integerValue] == 0) {
        check = @"-";
    } else {
        check = [myFiled stringValue];
    }
    return check;
}

-(void)selectedTournament:(PokerFireBase *)newTournament office:(int)currentOffice {
    self.currentItem = 0;
    if (currentOffice == CN) {
        self.currentOffice = CN;

    } else {
        self.currentOffice = VE;

    }
    if (_dataSourceItemsWithRules != newTournament) {
        _dataSourceItemsWithRules = newTournament;
        [self.collectionView reloadData];
        //_dataSourceItems=_dataSourceItemsWithRules[@"TournamentEvent"];
        _dataSourceItems=[self preparePokerData:_dataSourceItemsWithRules.PokerData];
    }
    if (iPAD) {
        [self updateDataCollectionAndTable];
    }
    
}

-(NSArray *)preparePokerData:(NSArray *)pokerData {
    NSString *subTournament;
    NSString *day;
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    NSMutableArray *dateArray=[[NSMutableArray alloc] init];
    NSMutableArray *mainArray=[[NSMutableArray alloc] init];
    for (id object in pokerData) {
       
        if (!subTournament) {
            //if the first field is empty set it to "POKER HOUR"
            if (object[0]) {
                subTournament= object[0];
            } else {
                subTournament= POKER_HOUR;
            }
            day=object[1];
            
            [myArray addObject:subTournament];
            [myArray addObject:object[1]];
            [dateArray addObject:[object subarrayWithRange:NSMakeRange(2, 9)]];
            
        } else if ([object[1] isEqualToString:@""]) {
                [dateArray addObject:[object subarrayWithRange:NSMakeRange(2, 9)]];
            
            
        } else {
            
            [myArray addObject:[NSArray arrayWithArray:dateArray]];
            [mainArray addObject:[NSArray arrayWithArray:myArray]];
            [myArray removeAllObjects];
            [dateArray removeAllObjects];
            [dateArray addObject:[object subarrayWithRange:NSMakeRange(2, 9)]];
            if (object[0] && ![object[0] isEqualToString:@""]) {
                subTournament= object[0];
            }
            
            [myArray addObject:subTournament];
            [myArray addObject:object[1]];
           
           
        }
        
    }
    [myArray addObject:[NSArray arrayWithArray:dateArray]];
    [mainArray addObject:[NSArray arrayWithArray:myArray]];
    return mainArray;
}

- (IBAction)closeController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


//Share button
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
        if (![type  isEqual: @"CalendarSharingTournament"]) {
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
            [self initWithSocial:SLServiceTypeFacebook andCell:self.cell];
            [self shareButtonPress:@"FacebookSharingTournament"];
            break;
        case AAShareBubbleTypeTwitter:
            [self initWithSocial:SLServiceTypeTwitter andCell:self.cell];
            [self shareButtonPress:@"TwitterSharingTournament"];
            break;
        case AAShareBubbleTypeGooglePlus:
            NSLog(@"Google+");
            break;
        case AAShareBubbleTypeTumblr:
            NSLog(@"Tumblr");
            break;
        case AAShareBubbleTypeVk:{
            [self shareButtonPress:@"CalendarSharingTournament"];
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
        [composeViewController addImage:[self captureView:cell]];
        [composeViewController addURL:[NSURL URLWithString:cell.eventURL]];
        NSString *initalTextString = cell.eventName.text;
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

- (UIImage *)captureView:(UIView *)view {
    //CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGRect screenRect = view.bounds;
    
    UIGraphicsBeginImageContext(screenRect.size);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [[UIColor blackColor] set];
    CGContextFillRect(ctx, screenRect);
    
    [view.layer renderInContext:ctx];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
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

@end
