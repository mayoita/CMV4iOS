//
//  CMVAllEventsViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 13/01/15.
//  Copyright (c) 2015 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVGameSplitViewController.h"

@interface CMVAllEventsViewController : UIViewController<SubstitutableDetailViewController>

/// SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *label;

@end
