//
//  CMVPokerHourSlitViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVPokerHourSlitViewController.h"


#import "CMVAllPokerTournaments.h"

@interface CMVPokerHourSlitViewController ()

@property (nonatomic, retain) UIBarButtonItem *navigationPaneButtonItem;
@property (nonatomic, retain) UIPopoverController *navigationPopoverController;

@end

@implementation CMVPokerHourSlitViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    
    CMVAllPokerTournaments *secondVC = [storyboard instantiateViewControllerWithIdentifier:@"AllPokerTournaments"];
    self.detailViewController=secondVC;
    
    
    self.delegate=self;
}

- (void)setDetailViewController:(UIViewController<SubstitutableDetailViewControllerPoker,AAShareBubblesDelegate> *)detailViewController
{

    self.detailViewController.navigationPaneBarButtonItem = nil;
    
    _detailViewController = detailViewController;

    UIViewController *navigationViewController = [self.viewControllers objectAtIndex:0];
    NSArray *viewControllers = [[NSArray alloc] initWithObjects:navigationViewController, _detailViewController, nil];
    self.viewControllers = viewControllers;
    
    _detailViewController.navigationPaneBarButtonItem = self.navigationPaneButtonItem;

    if (self.navigationPopoverController)
        [self.navigationPopoverController dismissPopoverAnimated:YES];
}

#pragma mark -
#pragma mark UISplitViewDelegate

- (BOOL)splitViewController:(UISplitViewController *)svc
   shouldHideViewController:(UIViewController *)vc
              inOrientation:(UIInterfaceOrientation)orientation
{
    return UIInterfaceOrientationIsPortrait(orientation);
}

- (void)splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{

    barButtonItem.title = NSLocalizedString(@"POKER HOUR",nil);
    
    self.navigationPaneButtonItem = barButtonItem;
    self.navigationPopoverController = pc;
    
    // Tell the detail view controller to show the navigation button.
    self.detailViewController.navigationPaneBarButtonItem = barButtonItem;
}

- (void)splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationPaneButtonItem = nil;
    self.navigationPopoverController = nil;
    
    // Tell the detail view controller to remove the navigation button.
    self.detailViewController.navigationPaneBarButtonItem = nil;
 
}

@end
