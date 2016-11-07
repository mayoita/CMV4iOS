//
//  CMVNewsletter.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 09/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVSwipeViewController.h"

@interface CMVNewsletter : CMVSwipeViewController
@property (weak, nonatomic) IBOutlet UIWebView *newsletterWebView;

@end
