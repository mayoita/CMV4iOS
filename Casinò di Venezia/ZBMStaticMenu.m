//
//  ZBMStaticMenu.m
//  ZerobaseMobile
//
//  Created by Massimo Moro on 16/06/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import "ZBMStaticMenu.h"
#import "UIViewController+ECSlidingViewController.h"

#import "CMVSharedPropertyButton.h"
//#import "GAIDictionaryBuilder.h"
#import "CMVPermissionForVPCStandingsViewController.h"
#import "MZFormSheetController.h"
#import "Firebase.h"

@interface ZBMStaticMenu ()
@end

@implementation ZBMStaticMenu
#define SECTION_PATIENT   0
#define SECTION_MAIN  1

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
 
	[self checkLogIn];

        self.home.font=GOTHAM_XLight(18);
        self.likeUs.text=NSLocalizedString(@"LIKE US ON FACEBOOK", nil);
        self.mySub.text=NSLocalizedString(@"MY SUBSCRIPTION", nil);
        self.timetab.text=NSLocalizedString(@"TIMETABLES", nil);
        self.home.text=NSLocalizedString(@"HOME", nil);
        self.logIn.text=NSLocalizedString(@"LOG IN", nil);
        self.QRCode.text=NSLocalizedString(@"PROMOTIONS", nil);
        self.newsletter.text=NSLocalizedString(@"NEWSLETTER", nil);
        self.freeEntry.text=NSLocalizedString(@"(and get your free entry)", nil);
        self.likeUs.minimumScaleFactor=0.5;
        self.likeUs.adjustsFontSizeToFitWidth=YES;
        self.freeEntry.minimumScaleFactor=0.5;
        self.freeEntry.adjustsFontSizeToFitWidth=YES;
        self.mySub.font=GOTHAM_XLight(18);
        self.likeUs.font=GOTHAM_XLight(18);
        self.freeEntry.font=GOTHAM_XLight(12);
        self.casinoMobile.font=GOTHAM_XLight(18);
        self.vpc.font=GOTHAM_XLight(18);
        self.logIn.font=GOTHAM_XLight(18);
        self.mySub.font=GOTHAM_XLight(18);
        self.timetab.font=GOTHAM_XLight(18);
        self.newsletter.font=GOTHAM_XLight(18);
        self.menu.font=GOTHAM_XLight(20);
        self.QRCode.font=GOTHAM_XLight(18);


    UIImageView *tempImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MenuCellView.png"]];
    [tempImageView setFrame:self.tableView.frame];
    
    self.tableView.backgroundView = tempImageView;
    
}
-(void)viewDidAppear:(BOOL)animated {
    [self checkLogIn];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Menu"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

}
-(void)checkLogIn {
    FIRUser *user = [FIRAuth auth].currentUser;
    BOOL isAnonymous = user.isAnonymous;
 //   if (!isAnonymous){
 //       self.logIn.text=NSLocalizedString(@"Log Out", nil);
 //   } else {
        self.logIn.text=NSLocalizedString(@"Log In", nil);
  //  }
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     ; *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */

    UITableViewCell *theCellClicked = [self.tableView cellForRowAtIndexPath:indexPath];
    NSString *identifier = theCellClicked.reuseIdentifier;
    CMVSharedPropertyButton *imageButton = (CMVSharedPropertyButton *)[theCellClicked viewWithTag:111];
    FIRUser *user = [FIRAuth auth].currentUser;
    BOOL isAnonymous = user.isAnonymous;
    imageButton.highlitedColor=[UIColor redColor];
    if (identifier != nil) {
        if ([identifier isEqual: @"CasinoMobile"]) {
            
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/it/artist/casino-di-venezia-meeting/id637648046"]];
        }else if ([identifier isEqual: @"VPC"]) {
            if (isAnonymous) {
                //UIStoryboard    *st = [UIStoryboard storyboardWithName:[[NSBundle mainBundle].infoDictionary objectForKey:@"UIMainStoryboardFile"] bundle:[NSBundle mainBundle]];
                UIStoryboard    *st;
                if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPad) { // is iPad
                    st = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:Nil];
                } else {
                    st = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:Nil];
                }
                CMVPermissionForVPCStandingsViewController *vc = [st instantiateViewControllerWithIdentifier:@"VPCAlert"];
                
               
                MZFormSheetController *formSheet = [[MZFormSheetController alloc] initWithViewController:vc];
                
                [[MZFormSheetBackgroundWindow appearance] setBackgroundBlurEffect:YES];
                [[MZFormSheetBackgroundWindow appearance] setBlurRadius:5.0];
                [[MZFormSheetBackgroundWindow appearance]setBackgroundColor:([UIColor clearColor])];
                
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
                [self presentSlidingViewController:identifier];
            }
        } else {
            
            [self presentSlidingViewController:identifier];
        }
    }
    
    
    
}

-(void)presentSlidingViewController:(NSString *)identifier {
    
    self.slidingViewController.topViewController = [self.storyboard instantiateViewControllerWithIdentifier:identifier];

    [self.slidingViewController resetTopViewAnimated:YES];
}

@end
