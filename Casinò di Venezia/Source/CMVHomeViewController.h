//
//  CMVHomeViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 23/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVMainTabbarController.h"

@interface CMVHomeViewController : UIViewController<CenterButtonDelegate>
@property (weak, nonatomic) IBOutlet UIButton *openHelp;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;

@property (weak, nonatomic) IBOutlet UILabel *today;

@end
