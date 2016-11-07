//
//  CMVAllGamesViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 02/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVAllGamesViewController.h"



@interface CMVAllGamesViewController ()

@end

@implementation CMVAllGamesViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.text=NSLocalizedString(@"Experiencing the pleasure of gambling and of the challenge in a refined and intriguing location. This is what the Casinò di Venezia’s two venues have to offer, each complete, but with their own unique character.\nAnd you can play online from your own home.", nil);
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
