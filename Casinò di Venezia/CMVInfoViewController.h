//
//  CMVInfoViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UINavigationController+MHDismissModalView.h"

@interface CMVInfoViewController : UIViewController
@property(nonatomic,strong) UIView *oldView;
@property(nonatomic,strong) UIImageView *bluredView;
@property(nonatomic,strong) UIImage *screenShotImage;
@property (weak, nonatomic) IBOutlet UITextView *info;
@property (weak, nonatomic) IBOutlet UITextView *scrollView;


@end
