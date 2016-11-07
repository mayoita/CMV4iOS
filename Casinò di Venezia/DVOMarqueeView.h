//
//  DVOMarqueeView.h
//  Diveo
//
//  Created by Mo Bitar on 4/16/14.
//  Copyright (c) 2014 Diveo Co. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DVOMarqueeView : UIView

@property (nonatomic) UIView *viewToScroll;

- (void)beginScrolling;
- (void)stopScrolling;

@property (nonatomic) CGFloat spaceBetweenRepeats;

/** pixels to offset per frame */
@property (nonatomic) CGFloat speed;

/** determines if the viewToScroll is wider than its parent */
- (BOOL)shouldScroll;

@end
