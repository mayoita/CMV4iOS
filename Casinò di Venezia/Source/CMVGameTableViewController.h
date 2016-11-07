//
//  CMVGameTableViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 02/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVGameViewController.h"
#import "CMVSharedGameViewController.h"
#import "CMVMainTabbarController.h"
#import "CMVSingleGameViewController.h"
#import "TTScrollSlidingPagesController.h"


@interface CMVGameTableViewController : CMVSharedGameViewController <CenterButtonDelegate>
@property (strong,nonatomic) NSMutableArray *filteredGameArray;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;
@property (nonatomic,strong) CMVSingleGameViewController *singleGameDelegate;
@property(strong,nonatomic)TTScrollSlidingPagesController *myScrollSliding;
-(void)setOffice;
@end
