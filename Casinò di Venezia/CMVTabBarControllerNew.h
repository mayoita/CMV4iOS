//
//  CMVTabBarControllerNew.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 23/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol CenterButtonDelegate;

@interface CMVTabBarControllerNew : UITabBarController<UITabBarControllerDelegate>

// To check if it's possible to put inside .m interface
@property(nonatomic, strong) UIButton *centerButton;
@property(nonatomic,weak) id  <CenterButtonDelegate> centerButtonDelegate;

-(void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage target:(id)target action:(SEL)action;
@end

@protocol CenterButtonDelegate <NSObject>
@optional
- (void)centerButtonAction:(UIButton *)sender;

@end
