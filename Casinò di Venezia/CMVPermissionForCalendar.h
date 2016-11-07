//
//  CMVPermissionForCalendar.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "MZModalViewController.h"
#import "CMVSwipeTableViewCell.h"

@interface CMVPermissionForCalendar : MZModalViewController
@property(strong,nonatomic)CMVSwipeTableViewCell *cell;
@property(strong,nonatomic)NSString *eventName;
@property(strong,nonatomic)NSDate *startDate;
@property(strong,nonatomic)NSDate *endDate;
@property(strong,nonatomic)id controller;
@end
