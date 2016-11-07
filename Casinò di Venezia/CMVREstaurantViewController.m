//
//  CMVREstaurantViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 03/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVREstaurantViewController.h"
#import "MZFormSheetController.h"
#import "MZModalViewController.h"
#import "CMVMenuRestaurantViewController.h"
#import "CMVStyles.h"


#define VE 0
#define CN 1
#define restaurantText 0
#define restaurantPhoto 1
#define aspectRatioImage 0.66


@interface CMVREstaurantViewController () <KIImagePagerDelegate, KIImagePagerDataSource> {
     IBOutlet KIImagePager *_imagePager;
}
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong)CMVDataClass *site;
@property(strong, nonatomic)NSMutableAttributedString *infoText;
@property (strong, nonatomic)CMVStyles *styles;
@property (weak, nonatomic) IBOutlet UILabel *restaurantLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageHeight;

@end

@implementation CMVREstaurantViewController

int Office;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.imageHeight.constant= self.view.frame.size.width*aspectRatioImage;
        self.styles=[[CMVStyles alloc] init];
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.edgesForExtendedLayout = UIRectEdgeAll;
        self.textView.contentInset = UIEdgeInsetsMake(0., 0., CGRectGetHeight(self.tabBarController.tabBar.frame), 0);
    }
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"EventBackground.png"]]];
    self.site=[CMVDataClass getInstance];
    [self setOffice];
    
    //[self attributedTextVE];
    //[self attributedTextCNInfo];
    self.mainTabBarController = (CMVMainTabbarController *)self.tabBarController;
    [self.mainTabBarController setCenterButtonDelegate:self];
}
-(void)viewWillLayoutSubviews {
    self.textView.contentOffset=CGPointZero;
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setGAIView];
    
    [self.mainTabBarController setCenterButtonDelegate:self];
    _imagePager.pageControl.currentPageIndicatorTintColor = [UIColor lightGrayColor];
    _imagePager.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    
    _imagePager.slideshowTimeInterval = 0.0f;
    [self setOffice];
}

-(void)setGAIView {
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"RestaurantCN";
    } else {
        value=@"RestaurantVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (UIViewContentMode) contentModeForImage:(NSUInteger)image
{
    return UIViewContentModeScaleAspectFill;
}

#pragma mark - KIImagePager DataSource
-(void)setupDataSource {
    NSString *plistName = [NSString stringWithFormat:@"Restaurant"];
    NSArray *contentArray = [[NSMutableArray alloc] initWithContentsOfFile:
                             [[NSBundle mainBundle] pathForResource:plistName
                                                             ofType:@"plist"]];
    self.dataSource = contentArray[Office];
   // self.textView.text=self.dataSource[restaurantText];
    [_imagePager reloadData];
    
}
- (NSArray *) arrayWithImages
{
    NSMutableArray *photo=[[NSMutableArray alloc] init];
    for (int i = 0; i < [self.dataSource[restaurantPhoto] count]; i++) {
        UIImage *photoName=[UIImage imageNamed:self.dataSource[restaurantPhoto][i]];
        [photo addObject:photoName];
    }
    return photo;
}

#pragma mark - Center button delegate
-(void)centerButtonAction:(UIButton *)sender {
    [self setGAIView];
    [self setOffice];
    
}

-(void)setOffice {
    if (self.site.location == VENEZIA) {
        Office=CN;
        [self setupDataSource];
        [self attributedTextCN];
        [self attributedTextCNInfo];
        self.restaurantLabel.text =NSLocalizedString(@"MARCO POLO RESTAURANT", nil);
        self.tabBarController.tabBar.tintColor=BRAND_GREEN_COLOR;
    } else {
        Office=VE;
        [self setupDataSource];
        [self attributedTextVE];
        [self attributedTextVEInfo];
        self.restaurantLabel.text =NSLocalizedString(@"WAGNER RESTAURANT",nil);
        self.tabBarController.tabBar.tintColor=BRAND_RED_COLOR;
    }
}

-(void)attributedTextVE {

    
    NSDictionary *firstAttributes = [self.styles secondAttributes];
    NSDictionary *secondAttributes = [self.styles firstAttributes];
    
    NSString *restaurantVE=NSLocalizedString(@"WAGNER RESTAURANT\n\nDedicated to the great composer who lived in Venice in the historical palazzo that today houses the city's casino, this restaurant is a unique privilege for visitors to the gaming house. Situated on the first floor of Ca' Vendramin Calergi, the Wagner Restaurant offers the exclusive pleasure of refined dining. 150 places in 3 superb settings, the Sala Palma, Sala Gialla and Sala Rossa, splendidly decorated with paintings by Palma il Giovane and frescoes by Gian Battista Crosato. Timeless delicacies and traditional Venetian fish specialities. Special events and music by the great composers are an added treat for our guests.",@"");
    
  
    
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:restaurantVE];
    
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"WAGNER RESTAURANT",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Dedicated to the great composer who lived in Venice in the historical palazzo that today houses the city's casino, this restaurant is a unique privilege for visitors to the gaming house. Situated on the first floor of Ca' Vendramin Calergi, the Wagner Restaurant offers the exclusive pleasure of refined dining. 150 places in 3 superb settings, the Sala Palma, Sala Gialla and Sala Rossa, splendidly decorated with paintings by Palma il Giovane and frescoes by Gian Battista Crosato. Timeless delicacies and traditional Venetian fish specialities. Special events and music by the great composers are an added treat for our guests.",@"")]];
   
    
    self.textView.attributedText=attString;
}

-(void)attributedTextCN {
    
    NSDictionary *firstAttributes = [self.styles secondAttributes];
    NSDictionary *secondAttributes = [self.styles firstAttributes];
    
    NSString *restaurantVE=NSLocalizedString(@"MARCO POLO RESTAURANT\n\nIdeal for a meal, even a quick one, it offers a creatively trendy cuisine that includes Mediterranean and Venetian meat and fish dishes, in a sophisticated and glamorous setting. The kitchen is open between 7.00 pm and midnight.\n\nLA PROSCIUTTERIA\n\nProducts of the highest quality and selected wines for a meal break in pursuit of good taste.\n\nLA PIZZERIA\n\nThe wood oven produces fanciful, smouldering delicacies to suit all tastes.",@"");
    
        NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:restaurantVE];
        [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"MARCO POLO RESTAURANT",@"")]];
    
        [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Ideal for a meal, even a quick one, it offers a creatively trendy cuisine that includes Mediterranean and Venetian meat and fish dishes, in a sophisticated and glamorous setting. The kitchen is open between 7.00 pm and midnight.",@"")]];
    
        [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"LA PROSCIUTTERIA",@"")]];
    
        [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Products of the highest quality and selected wines for a meal break in pursuit of good taste.",@"")]];
    

        [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"LA PIZZERIA",@"")]];
    
        [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"The wood oven produces fanciful, smouldering delicacies to suit all tastes.",@"")]];
    
    
    self.textView.attributedText=attString;
}

-(void)attributedTextVEInfo {
    
    NSDictionary *firstAttributes =[self.styles firstAttributesInfo];
    NSDictionary *secondAttributes = [self.styles secondAttributesInfo];
    
    NSString *restaurantVE=NSLocalizedString(@"tel. +39 -(0)41-5297230 (from 9.30 am - 5.30 pm)\ntel. +39 -(0)41-5297201 (7.30 pm - midnight)\n\nOpening times: 7.30 pm - midnight\nClosed: December 24 and 25\n\nCredit cards: Amex, Visa, Mastercard, Diners",@"");
    
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:restaurantVE];
    
    NSArray *results = [self rangesOfString:@"tel." inString:restaurantVE];
    
    int i;
    for (i = 0; i < [results count]; i++) {
        [attString setAttributes:firstAttributes range:[[results objectAtIndex:i] rangeValue]];
    }
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"+39 -(0)41-5297230 (from 9.30 am - 5.30 pm)",@"")]];
    
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"+39 -(0)41-5297201 (7.30 pm - midnight)",@"")]];
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Opening times:",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@" 7.30 pm - midnight",@"")]];
    
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Closed:",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"December 24 and 25",@"")]];
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Credit cards:",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:@"Amex, Visa, Mastercard, Diners"]];
    
    
    self.infoText=attString;
    
}

-(void)attributedTextCNInfo {
    NSDictionary *firstAttributes =[self.styles firstAttributesInfo];
    NSDictionary *secondAttributes = [self.styles secondAttributesInfo];
    
    NSString *restaurantVE=NSLocalizedString(@"tel. +39 -(0)41-5415923 (from 9.30 am - 5.30 pm)\ntel. +39 -(0)41-2695826 (from 7.00 pm - midnight)\n\nOpening times: 7.30 pm - midnight\nClosed: December 24 and 25\n\nCredit cards: Amex, Visa, Mastercard, Diners",@"");
    
    NSMutableAttributedString *attString=[[NSMutableAttributedString alloc] initWithString:restaurantVE];
 
    NSArray *results = [self rangesOfString:@"tel." inString:restaurantVE];
    
    int i;
    for (i = 0; i < [results count]; i++) {
        [attString setAttributes:firstAttributes range:[[results objectAtIndex:i] rangeValue]];
    }
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"+39 -(0)41-5415923 (from 9.30 am - 5.30 pm)",@"")]];
    
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"+39 -(0)41-2695826 (from 7.00 pm - midnight)",@"")]];
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Opening times:",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"7.30 pm - midnight",@"")]];
    
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Closed:",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"December 24 and 25",@"")]];
    [attString setAttributes:firstAttributes range:[restaurantVE rangeOfString:NSLocalizedString(@"Credit cards:",@"")]];
    
    [attString setAttributes:secondAttributes range:[restaurantVE rangeOfString:@"Amex, Visa, Mastercard, Diners"]];
    
    
    self.infoText=attString;
    
}

- (NSArray *)rangesOfString:(NSString *)searchString inString:(NSString *)str {
    NSMutableArray *results = [NSMutableArray array];
    NSRange searchRange = NSMakeRange(0, [str length]);
    NSRange range;
    while ((range = [str rangeOfString:searchString options:0 range:searchRange]).location != NSNotFound) {
        [results addObject:[NSValue valueWithRange:range]];
        searchRange = NSMakeRange(NSMaxRange(range), [str length] - NSMaxRange(range));
    }
    return results;
}

- (IBAction)info:(id)sender {
    MZModalViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"modal"];
    
    
    MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:vc];
    
    [[MZFormSheetBackgroundWindow appearance] setBackgroundBlurEffect:YES];
    [[MZFormSheetBackgroundWindow appearance] setBlurRadius:5.0];
    [[MZFormSheetBackgroundWindow appearance] setBackgroundColor:[UIColor clearColor]];
    
    formSheet.transitionStyle = MZFormSheetTransitionStyleSlideFromTop;
    formSheet.shadowRadius = 2.0;
    formSheet.shadowOpacity = 0.3;
    formSheet.shouldDismissOnBackgroundViewTap = YES;
    //formSheet.shouldCenterVerticallyWhenKeyboardAppears = YES;
    formSheet.cornerRadius=0;
    if (iPAD) {
        formSheet.presentedFormSheetSize = CGSizeMake(640, 400);
    }
    
    [formSheet presentAnimated:YES completionHandler:^(UIViewController *presentedFSViewController) {
        vc.textView.attributedText=self.infoText;
    }];
}

- (IBAction)openMenuRestaurant:(id)sender {
    CMVMenuRestaurantViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"MenuRestaurant"];
    modal.office=Office;
    [self presentViewController:modal animated:YES completion:^{
        
    }];
}

@end
