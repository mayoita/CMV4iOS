//
//  CMVTournamentsViewZoomController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "TTUITableViewZoomController.h"
#import "CMVSwipeTableViewCell.h"
#import "CMVTournamentsViewController.h"
#import "CMVMainTabbarController.h"
#import "TTScrollSlidingPagesController.h"

@interface CMVTournamentsViewZoomController : TTUITableViewZoomController<CMVTableViewCellDelegate, CenterButtonDelegate>

/// SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;

@property (nonatomic,strong) CMVTournamentsViewController *tournamentDelegate;
@property (nonatomic, strong) NSMutableArray *tournament;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;
@property(strong,nonatomic)TTScrollSlidingPagesController *myScrollSliding;
-(void)setOffice;
@end
