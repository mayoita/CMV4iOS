//
//  CMVFacebookLike.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 03/06/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVFacebookLike.h"
#import <FBSDKShareKit/FBSDKLikeControl.h>
#import "UIViewController+ECSlidingViewController.h"
#import "CMVGreenButton.h"
#import "CMVAppDelegate.h"
#import "CMVBarCodeController.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

@interface CMVFacebookLike ()
@property (weak, nonatomic) IBOutlet CMVGreenButton *getTicket;
@property(strong, nonatomic)FBSDKLikeControl *myLike;



@end

@implementation CMVFacebookLike

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
    
    UIImage *myGradient = [[UIImage alloc] init];
    if (iPHONE) {
        myGradient = [UIImage imageNamed:@"LogInColorPattern"];
    } else {
        myGradient = [UIImage imageNamed:@"LogInColorPatterniPAD"];
    }
    
    
    [self.getTicket setTitleColor:[UIColor colorWithPatternImage:myGradient] forState:UIControlStateNormal];
    //self.getTicket.enabled = NO;
    // Do any additional setup after loading the view.
  //  [FBSettings enableBetaFeature:FBBetaFeaturesLikeButton];
   // [FBSDKSettings enablePlatformCompatibility:NO];
    
    FBSDKLikeControl *likeView = [[FBSDKLikeControl alloc] init];
    likeView.likeControlStyle = FBSDKLikeControlStyleStandard;
    UILabel *likeLabel = [[likeView subviews] objectAtIndex:1];
    likeLabel.textColor = [UIColor whiteColor];
    if (iPHONE) {
        likeView.frame=CGRectMake(0, 0, 150, 50);
        likeLabel.font = GOTHAM_BOOK(12);
    } else {
        likeView.frame=CGRectMake(0, 0, 250, 100);
        likeLabel.font = GOTHAM_BOOK(20);
    }
  
    likeView.likeControlAuxiliaryPosition = FBSDKLikeControlAuxiliaryPositionBottom;
    likeView.likeControlHorizontalAlignment =FBSDKLikeControlHorizontalAlignmentCenter;
    likeView.center = self.view.center;
    
    likeLabel.textColor = [UIColor whiteColor];
  

    likeView.objectID = @"https://www.facebook.com/casinovenezia/";
    self.myLike= likeView;
    [self.view addSubview:likeView];
    
 
}

-(void)viewDidAppear:(BOOL)animated {
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"FREE_ENTRY_FACEBOOK"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

-(void)getFreeEntryPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"FREE_ENTRY"
                                                          action:@"press"
                                                           label:type
                                                           value:nil] build]];
    
    [tracker set:kGAIScreenName value:nil];
}

-(void)viewDidLayoutSubviews {
    
    if (iPHONE) {
        self.myLike.frame=CGRectMake(0, 0, 150, 50);
    } else {
        self.myLike.frame=CGRectMake(0, 0, 250, 100);
 
    }
    self.myLike.center = self.view.center;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)openMenu:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

-(void)presentBarCode {
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard =appDelegate.storyboard;
    CMVBarCodeController *presentingViewController=  [storyboard instantiateViewControllerWithIdentifier:@"BarCode"];
    [self presentViewController:presentingViewController animated:YES completion:nil];
}
- (IBAction)showBarCode:(id)sender {
   
    UIView *likeLabel = [[self.myLike subviews] objectAtIndex:0];
    UIButton *likebutton=[[likeLabel subviews] objectAtIndex:0];
  
    if ([likebutton.titleLabel.text isEqualToString:@"Like"]) {
        [self getFreeEntryPress:@"FREE_ENTRY_DENIED"];
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Be patient",nil)
                                                         message:NSLocalizedString(@"Please like us on Facebook",nil)
                                                        delegate:self
                                               cancelButtonTitle:NSLocalizedString(@"Ok",nil)
                                               otherButtonTitles: nil];
        [alert show];
    } else {
        [self getFreeEntryPress:@"FREE_ENTRY_SUCCESS"];
        [self presentBarCode];
    }
}

@end
