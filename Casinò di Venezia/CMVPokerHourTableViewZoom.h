//
//  CMVPokerHourTableViewZoom.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "TTUITableViewZoomController.h"
#import "CMVPokerHourMain.h"
#import "CMVMainTabbarController.h"
#import "TTScrollSlidingPagesController.h"


@interface CMVPokerHourTableViewZoom : TTUITableViewZoomController<CMVTableViewCellDelegate, CenterButtonDelegate>
//Old version
//@property (nonatomic,strong) CMVPokerHourMainController *pokerDelegate;
@property (nonatomic,strong) CMVPokerHourMain *pokerDelegate;

@property (nonatomic, strong) NSMutableArray *tournament;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;
@property(strong,nonatomic)TTScrollSlidingPagesController *myScrollSliding;
-(void)setOffice;
@end
