//
//  CMVPokerHourSlitViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAShareBubbles.h"


@protocol SubstitutableDetailViewControllerPoker
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;
@end

@interface CMVPokerHourSlitViewController : UISplitViewController<UISplitViewControllerDelegate>

@property (nonatomic, assign) IBOutlet UIViewController<SubstitutableDetailViewControllerPoker,AAShareBubblesDelegate> *detailViewController;



@end
