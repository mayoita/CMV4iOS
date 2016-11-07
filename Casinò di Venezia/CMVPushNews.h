//
//  CMVPushNews.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 25/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVSwipeViewController.h"

@interface CMVPushNews : CMVSwipeViewController
@property (weak, nonatomic) IBOutlet UISwitch *events;
@property (weak, nonatomic) IBOutlet UISwitch *slot;
@property (weak, nonatomic) IBOutlet UISwitch *poker;
@property (weak, nonatomic) IBOutlet UILabel *eventsLabel;
@property (weak, nonatomic) IBOutlet UILabel *slotLabel;
@property (weak, nonatomic) IBOutlet UILabel *pokerLabel;

@end
