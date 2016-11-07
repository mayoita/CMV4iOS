//
//  CMVMainTabbarController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 24/10/13.
//  Copyright (c) 2013 Casinò di Venezia SPA.  All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CenterButtonDelegate;

@interface CMVMainTabbarController : UITabBarController<UITabBarControllerDelegate>

    // To check if it's possible to put inside .m interface
    @property(nonatomic, strong) UIButton *centerButton;
    @property(nonatomic,weak) id  <CenterButtonDelegate> centerButtonDelegate;

    -(void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage target:(id)target action:(SEL)action;
    @end

@protocol CenterButtonDelegate <NSObject>
    @optional
    - (void)centerButtonAction:(UIButton *)sender;

@end

