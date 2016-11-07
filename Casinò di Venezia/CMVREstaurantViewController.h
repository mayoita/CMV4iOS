//
//  CMVREstaurantViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 03/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KIImagePager.h"
#import "CMVMainTabbarController.h"

@interface CMVREstaurantViewController : UIViewController <CenterButtonDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property(weak,nonatomic)CMVMainTabbarController *mainTabBarController;

@property (strong,nonatomic)NSArray *dataForGame;

@end
