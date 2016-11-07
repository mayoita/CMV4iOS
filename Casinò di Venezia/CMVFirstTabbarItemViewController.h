//
//  CMVFirstTabbarItemViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 18/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVMainTabbarController.h"




@interface CMVFirstTabbarItemViewController : UIViewController <CenterButtonDelegate>
@property (weak, nonatomic) IBOutlet UIButton *openHelp;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;

@property (weak, nonatomic) IBOutlet UILabel *today;

@property (weak, nonatomic) IBOutlet UILabel *vendraminNoghera;


@end
