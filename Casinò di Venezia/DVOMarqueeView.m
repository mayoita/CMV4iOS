//
//  DVOMarqueeView.m
//  Diveo
//
//  Created by Mo Bitar on 4/16/14.
//  Copyright (c) 2014 Diveo Co. All rights reserved.
//

#import "DVOMarqueeView.h"

@interface DVOMarqueeView ()

@property (nonatomic) UIView *snapshot1;
@property (nonatomic) UIView *snapshot2;

@end

@implementation DVOMarqueeView
{
    CADisplayLink *displayLink;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;
        _spaceBetweenRepeats = 5;
        _speed = 0.7;
    }
    return self;
}

- (void)setViewToScroll:(UIView *)viewToScroll
{
    [self.snapshot1 removeFromSuperview];
    [self.snapshot2 removeFromSuperview];
    
    _viewToScroll = viewToScroll;
    
    viewToScroll.hidden = NO;
    [self addSubview:viewToScroll];
    
    self.snapshot1 = [viewToScroll snapshotViewAfterScreenUpdates:YES];
    self.snapshot2 = [viewToScroll snapshotViewAfterScreenUpdates:YES];
    
    [self addSubview:self.snapshot1];
    [self addSubview:self.snapshot2];
    
    CGRect trailingRect = self.snapshot2.frame;
    trailingRect.origin.x = CGRectGetMaxX(self.snapshot1.frame) + self.spaceBetweenRepeats;
    self.snapshot2.frame = trailingRect;
    
    self.viewToScroll.hidden = YES;
}

- (BOOL)shouldScroll
{
    if(CGRectGetWidth(self.viewToScroll.frame) > CGRectGetWidth(self.frame)) {
        return YES;
    }
    
    return NO;
}

- (void)beginScrolling
{
    if(displayLink) {
        return;
    }
    
    displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(timerDidFire:)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

- (void)stopScrolling
{
    [displayLink invalidate];
    displayLink = nil;
}

- (void)timerDidFire:(NSTimer *)timer
{
    [self offsetViews];
}

- (UIView *)leadingSnapshot
{
    if(CGRectGetMinX(self.snapshot1.frame) < CGRectGetMinX(self.snapshot2.frame)) {
        return self.snapshot1;
    } else {
        return self.snapshot2;
    }
}

- (UIView *)trailingSnapshot
{
    if(CGRectGetMinX(self.snapshot1.frame) > CGRectGetMinX(self.snapshot2.frame)) {
        return self.snapshot1;
    } else {
        return self.snapshot2;
    }
}

- (void)offsetViews
{
    CGFloat const offsetAmount = - self.speed;
    
    UIView *leadingSnapshot = [self leadingSnapshot];
    UIView *trailingSnapshot = [self trailingSnapshot];
    
    CGRect leadingRect = leadingSnapshot.frame;
    CGRect trailingRect = trailingSnapshot.frame;
    CGFloat leadingMaxX = CGRectGetMaxX(leadingRect);
    if(leadingMaxX < 0) {
        // send to end
        leadingRect.origin.x = CGRectGetMaxX(trailingRect) + self.spaceBetweenRepeats;
    } else {
        leadingRect.origin.x += offsetAmount;
    }
    
    trailingRect.origin.x += offsetAmount;
    
    leadingSnapshot.frame = leadingRect;
    trailingSnapshot.frame = trailingRect;
}

@end
