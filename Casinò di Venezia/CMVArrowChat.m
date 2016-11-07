//
//  CMVArrowChat.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVArrowChat.h"

@implementation CMVArrowChat


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91667 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28125 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63889 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28437 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63889 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.99375 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.41667 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.99375 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.41667 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28437 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.14288 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28437 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.52778 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 2.5)];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91667 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28125 * CGRectGetHeight(frame))];
    [bezierPath closePath];
    [[UIColor whiteColor] setFill];
    [bezierPath fill];
}


@end
