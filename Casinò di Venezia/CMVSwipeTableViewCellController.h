//
//  CMVSwipeTableViewCellController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/10/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CMVSwipeTableViewCell.h"
#import "CMVEventSelectionDelegate.h"
#import "CMVEventViewController.h"
#import "TTUITableViewZoomController.h"
#import "CMVMainTabbarController.h"
#import "CMVEventKitController.h"
#import "TTScrollSlidingPagesController.h"



@interface CMVSwipeTableViewCellController : TTUITableViewZoomController <CMVTableViewCellDelegate, CenterButtonDelegate>

@property (nonatomic,strong) CMVEventViewController *eventDelegate;
/// SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;

@property (nonatomic, strong) NSMutableArray *events;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;
@property(strong,nonatomic)TTScrollSlidingPagesController *myScrollSliding;
-(void)setOffice;
@end
