//
//  CMVTournamentsViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVTournamentsViewController.h"
#import "CMVTournamentsCell.h"
#import "CMVEventKitShared.h"
#import "CMVFesturesFlowLayout.h"
#import "CMVTournamentCellNew.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "GAI.h"

#define cellIdentifier @"Tournament"
#define IMAGE_INDEX 5
#define TITLE_INDEX 2
#define TEXT_INDEX 4
#define DESCRIPTION_ITEMS  4
#define VE 0
#define CN 1
#define indexForNotes 1


@interface CMVTournamentsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *backGround;
@property(strong,nonatomic)CMVFesturesFlowLayout *flowLayout;
@property(nonatomic)NSInteger currentItem;
@property(nonatomic)NSInteger currentOffice;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *verticalSpaceForTextView;
@end

@implementation CMVTournamentsViewController{
    AAShareBubbles *shareBubbles;
    float radius;
    float bubbleRadius;
}




- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self colorArrowAndlabel];
    self.textView.attributedText= [self formatTextForPokerHour];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"EventBackground.png"]]];
    // Do any additional setup after loading the view.
    self.closeButton.color=[UIColor whiteColor];
    
    radius = 130;
    bubbleRadius = 40;
    // if ([_dataSourceItemsWithRules[@"Type"]  isEqual: @"P"]) {
    if (iPHONE) {
        [self.tableView registerNib:[UINib nibWithNibName:@"TournamentCellNew" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    } else {
        [self.tableView registerNib:[UINib nibWithNibName:@"TournamentCellNewiPAD" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
   
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor clearColor];
    
    
    
    //Setup for collectionView
    self.flowLayout = [[CMVFesturesFlowLayout alloc] init];
    if (iPHONE) {
        [self.flowLayout setItemSize:CGSizeMake(280, 50)];
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BK_date_PokerHour.png"]];
    } else {
        self.collectionView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BK_date_PokerHouriPAD.png"]];
        self.closeButton.hidden = YES;
    }
    
    [self.flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    [self.flowLayout setMinimumInteritemSpacing:0.0f];
    [self.flowLayout setMinimumLineSpacing:0.0f];
    [self.collectionView setCollectionViewLayout:self.flowLayout];
    // }
}

-(void)viewWillLayoutSubviews {
 
    if ([_dataSourceItemsWithRules.Type  isEqual: @"C"]) {
        if (iPHONE) {
            self.verticalSpaceForTextView.constant = 60;
        } else {
            self.verticalSpaceForTextView.constant = 80;
        }
        self.arrowSx.hidden = YES;
        self.collectionView.hidden = YES;
        self.tableView.hidden = YES;
        self.backGround.hidden =YES;
        self.textView.contentOffset=CGPointZero;
    } else {
        if (iPHONE) {
            self.verticalSpaceForTextView.constant = 339;
        } else {
            self.verticalSpaceForTextView.constant = 534;
        }
        self.arrowSx.hidden = NO;
        self.collectionView.hidden = NO;
         self.tableView.hidden = NO;
        self.backGround.hidden =NO;
        self.textView.contentOffset=CGPointZero;
    }
}



- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([_dataSourceItemsWithRules.Type  isEqual: @"P"]) {
    if (self.dataSourceItems ) {
        NSIndexPath *myIndex = [NSIndexPath indexPathForItem:0 inSection:0];
        [self.collectionView scrollToItemAtIndexPath:myIndex atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    }
    }
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"TournamentDetailsCN";
    } else {
        value=@"TournamentDetailsVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
  
}

-(void)viewWillAppear:(BOOL)animated {
    self.currentItem = 0;
    self.titleView.text=_dataSourceItemsWithRules.TournamentName;
    [self colorArrowAndlabel];
    self.arrowDx.hidden = YES;
    self.textView.attributedText= [self formatTextForPokerHour];
    if ([_dataSourceItemsWithRules.Type  isEqual: @"P"]) {
        [self.tableView reloadData];
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

-(NSMutableAttributedString *)formatTextForPokerHour {
    NSMutableAttributedString *formattedText = [[NSMutableAttributedString alloc] init];
    
    NSDictionary *firstAttributes = [self firstAttributes];
    NSDictionary *secondAttributes = [self secondAttributes];
    
     NSArray *arrayText =_dataSourceItemsWithRules.TournamentsRules;
    

    //Append Tournament Descriptions
    NSString *textDescription=[NSString stringWithFormat:@"%@%@",_dataSourceItemsWithRules.TournamentDescription,@"\n\n"];;
    NSInteger _stringLengthText=[textDescription length];
    NSMutableAttributedString *attMyString3=[[NSMutableAttributedString alloc] initWithString:textDescription];
    [attMyString3 setAttributes:secondAttributes range:NSMakeRange(0, _stringLengthText)];
    
    [formattedText appendAttributedString:attMyString3];
    
    //Append Tournament rules
    
    
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

- (CGFloat)textViewHeightForAttributedText:(UITextView *)textView andWidth:(CGFloat)width
{
    CGSize size = [textView sizeThatFits:CGSizeMake(width, FLT_MAX)];
    return size.height;
}

-(void)selectedTournament:(TournamentFireBase *)newTournament {

    self.currentItem = 0;
    if (_currentOffice == CN) {
        self.currentOffice = CN;
        
    } else {
        self.currentOffice = VE;
        
    }
    if (_dataSourceItemsWithRules != newTournament) {
        _dataSourceItemsWithRules = newTournament;
        [self.collectionView reloadData];

        _dataSourceItems=[self preparePokerData:_dataSourceItemsWithRules.TournamentEvent];
        
        self.titleView.text=_dataSourceItemsWithRules.TournamentName;

    }
}

-(NSArray *)preparePokerData:(NSArray *)pokerData {

    NSString *day;
    NSMutableArray *myArray = [[NSMutableArray alloc] init];
    NSMutableArray *dateArray=[[NSMutableArray alloc] init];
    NSMutableArray *mainArray=[[NSMutableArray alloc] init];
    for (id object in pokerData) {
        
        if (!day) {
            day=object[0];

            [myArray addObject:object[0]];
            [dateArray addObject:[object subarrayWithRange:NSMakeRange(1, 4)]];
            
        } else if ([object[0] isEqualToString:@""]) {
            [dateArray addObject:[object subarrayWithRange:NSMakeRange(1, 4)]];
            
            
        } else {
            
            [myArray addObject:[NSArray arrayWithArray:dateArray]];
            [mainArray addObject:[NSArray arrayWithArray:myArray]];
            [myArray removeAllObjects];
            [dateArray removeAllObjects];
            [dateArray addObject:[object subarrayWithRange:NSMakeRange(1, 4)]];
            if (object[0] && ![object[0] isEqualToString:@""]) {
                day= object[0];
            }
            
            [myArray addObject:day];
            
            
        }
        
    }
    [myArray addObject:[NSArray arrayWithArray:dateArray]];
    [mainArray addObject:[NSArray arrayWithArray:myArray]];
    return mainArray;
}

#pragma Collection view delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //if ([[self.dataSourceItemsWithRules lastObject] count] == 1) {
     if ([_dataSourceItemsWithRules.Type  isEqual: @"P"]) {
        if (self.dataSourceItems.count == 1) {
            self.arrowSx.hidden=YES;
        } else {
            self.arrowSx.hidden=NO;
        }

         return self.dataSourceItems.count;
     } else {
         return 0;
     }
    
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
    
    cellLabel.text = [self stringToDate:self.dataSourceItems[indexPath.row][0]];
    
    return cell;
}

- (NSString *)stringToDate:(NSString *)myString {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    // this is imporant - we set our input date format to match our input string
    // if format doesn't match you'll get nil from your string, so be careful
    [dateFormatter setDateFormat:@"dd/MM/yy"];
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
        
        self.textView.attributedText= [self formatTextForPokerHour];
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
    if ([_dataSourceItemsWithRules.Type  isEqual: @"C"]) {
        return 0;
    } else {
        NSArray *items;
        items = self.dataSourceItems[self.currentItem][1];
        
        return items.count;
    }
   
   
   
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMVTournamentCellNew *cell = (CMVTournamentCellNew *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    cell.torneo.text = @"POKER HOUR ON LINE";
    cell.ora.text = [self.dataSourceItems[self.currentItem][1] objectAtIndex:indexPath.item][0];
    cell.round.text = [self.dataSourceItems[self.currentItem][1] objectAtIndex:indexPath.item][1];
    cell.buyin.text = [self.dataSourceItems[self.currentItem][1] objectAtIndex:indexPath.item][2];

    cell.note.text = [self.dataSourceItems[self.currentItem][1] objectAtIndex:indexPath.item][3];
    
    return cell;
}

- (IBAction)done:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)setNavigationPaneBarButtonItem:(UIBarButtonItem *)navigationPaneBarButtonItem
{
    if ((navigationPaneBarButtonItem != _navigationPaneBarButtonItem) || navigationPaneBarButtonItem==nil) {
        if (navigationPaneBarButtonItem)
            [self.toolbar setItems:[NSArray arrayWithObject:navigationPaneBarButtonItem] animated:NO];
        else
            [self.toolbar setItems:nil animated:NO];
        
    }
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
