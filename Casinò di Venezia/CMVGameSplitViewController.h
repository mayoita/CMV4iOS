//
//  CMVGameSplitViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 04/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVGameSplitViewController.h"

/*
 CMVGameSplitViewController defines the protocol that detail view controllers must adopt.
 The protocol specifies a property for the bar button item controlling the navigation pane.
 */
@protocol SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;
@end

@interface CMVGameSplitViewController : UISplitViewController <UISplitViewControllerDelegate>



// The presently displayed detail view controller.  This is modified by the various
// view controllers in the navigation pane of the split view controller.
@property (nonatomic, assign) IBOutlet UIViewController<SubstitutableDetailViewController> *detailViewController;

@end
