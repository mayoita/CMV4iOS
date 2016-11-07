//
//  ZBMStaticMenu.h
//  ZerobaseMobile
//
//  Created by Massimo Moro on 16/06/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVLogIn.h"
#import "CMVHome.h"
#import "CMVWeb.h"
#import "CMVMail.h"
#import "CMVLike.h"
#import "CMVGame.h"
#import "CMVTrophy.h"


@interface ZBMStaticMenu : UITableViewController 
@property (weak, nonatomic) IBOutlet UILabel *logIn;
@property (weak, nonatomic) IBOutlet UILabel *home;
@property (weak, nonatomic) IBOutlet UILabel *webSite;
@property (weak, nonatomic) IBOutlet UILabel *newsletter;
@property (weak, nonatomic) IBOutlet UILabel *likeUs;
@property (weak, nonatomic) IBOutlet UILabel *freeEntry;
@property (weak, nonatomic) IBOutlet UILabel *casinoMobile;
@property (weak, nonatomic) IBOutlet UILabel *vpc;
@property (weak, nonatomic) IBOutlet UILabel *mySub;
@property (weak, nonatomic) IBOutlet UILabel *timetab;
@property (weak, nonatomic) IBOutlet UILabel *menu;


@end
