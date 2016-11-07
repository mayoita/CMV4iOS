//
//  CMVAllPokerTournaments.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVPokerHourSlitViewController.h"
#import "AAShareBubbles.h"

@interface CMVAllPokerTournaments : UIViewController<SubstitutableDetailViewControllerPoker,AAShareBubblesDelegate>

@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UITextView *textView;

@end
