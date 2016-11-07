//
//  CMVAllEventsViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 13/01/15.
//  Copyright (c) 2015 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVAllEventsViewController.h"

@interface CMVAllEventsViewController ()

@end

@implementation CMVAllEventsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.label.text=NSLocalizedString(@"EVENTS", nil);
    self.textView.text=NSLocalizedString(@"Live music, concerts, disco club, performances, entertainment, bar area and refreshments ranging from Happy Hours to gala dinners.\nA mix of games and entertainment for special evenings of fun devoted to teaching the game.", nil);
    self.textView.textColor=[UIColor whiteColor];
    self.textView.font = GOTHAM_Medium(15);
    
    if (_navigationPaneBarButtonItem)
        [self.toolbar setItems:[NSArray arrayWithObject:self.navigationPaneBarButtonItem] animated:NO];
    
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

@end
