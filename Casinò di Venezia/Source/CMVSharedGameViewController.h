//
//  CMVSharedGameViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "TTUITableViewZoomController.h"
#import "CMVGameViewController.h"

@interface CMVSharedGameViewController : TTUITableViewZoomController
@property (nonatomic,strong) CMVGameViewController *gameDelegate;

@end
