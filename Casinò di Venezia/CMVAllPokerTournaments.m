//
//  CMVAllPokerTournaments.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVAllPokerTournaments.h"

@interface CMVAllPokerTournaments ()

@end

@implementation CMVAllPokerTournaments


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textView.text=NSLocalizedString(@"The Casinò di Venezia provides opportunities for taking part in national and international competitions.\nThe venue at Ca' Vendramin Calergi, for example, stages the Italian Chemin de Fer Championships (12 rounds a year), the prize winning contests of Chemin de Fer (6 galas a year) and French Roulette tournaments (5 matches a year).\n\nCa' Noghera, on the other hand, stages Texas Hold ’em Poker tournaments every day with online qualifications.\nIn both venues, moreover, it is possible to take part in the Texas Hold ’em Poker international championships that take place regularly at least once a month.", nil);
    self.textView.textColor=[UIColor whiteColor];
    self.textView.font = GOTHAM_Medium(15);
	// Do any additional setup after loading the view.
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
