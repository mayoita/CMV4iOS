//
//  CMVSplitTournaments.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 11/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVGameSplitViewController.h"

@interface CMVSplitTournaments : UISplitViewController <UISplitViewControllerDelegate>
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;
// The presently displayed detail view controller.  This is modified by the various
// view controllers in the navigation pane of the split view controller.
@property (nonatomic, assign) IBOutlet UIViewController<SubstitutableDetailViewController> *detailViewController;
@end
