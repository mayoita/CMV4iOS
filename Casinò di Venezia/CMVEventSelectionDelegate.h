//
//  CMVEventSelectionDelegate.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 05/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMVSwipeTableViewCell.h"
@class Events;
@protocol CMVEventSelectionDelegate <NSObject>
@required
-(void)selectedEvent:(Events *)newEvent;
@end
