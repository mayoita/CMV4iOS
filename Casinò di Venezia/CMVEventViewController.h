//
//  CMVEventViewController.h
//  CMV
//
//  Created by Massimo Moro on 04/04/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVEventSelectionDelegate.h"
#import "CMVShare.h"
#import "AAShareBubbles.h"
#import "CMVSwipeTableViewCell.h"
#import "CMVGameSplitViewController.h"

#import "CMVCloseButton.h"


@class EventsFireBase;

@interface CMVEventViewController : UIViewController <CMVEventSelectionDelegate, AAShareBubblesDelegate,SubstitutableDetailViewController>
@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UILabel *eventDate;

@property (weak, nonatomic) IBOutlet UITextView *eventDescription;

@property (strong, nonatomic) EventsFireBase *event;

@property(strong,nonatomic)CMVSwipeTableViewCell *cell;
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet CMVShare *shareButton;
@property (weak, nonatomic) IBOutlet CMVCloseButton *closeButton;

@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;

@end
