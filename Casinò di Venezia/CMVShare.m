//
//  CMVShare.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 03/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVShare.h"

@implementation CMVShare

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    UIColor* gray = [UIColor colorWithRed: 0.698 green: 0.698 blue: 0.698 alpha: 1];
    
    //// Frames
    CGRect frame = rect;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + 1, CGRectGetMinY(frame) + 1, CGRectGetWidth(frame) - 2, CGRectGetHeight(frame) - 2);
    
    
    //// Group
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.35537 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.20000 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.20000 * CGRectGetHeight(group))];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.00826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98889 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.00826 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.20000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.00199 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98950 * CGRectGetHeight(group))];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.82645 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98889 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.01454 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98828 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.82645 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.98889 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.82645 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.67778 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.74380 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.78889 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.73967 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.87778 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.09091 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.87778 * CGRectGetHeight(group))];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.09091 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31111 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.09091 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.87778 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.08530 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31354 * CGRectGetHeight(group))];
        [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.27273 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31111 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.09652 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30868 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.27273 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31111 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.35537 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.20000 * CGRectGetHeight(group))];
        [bezierPath closePath];
        [gray setFill];
        [bezierPath fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.18595 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75000 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.74793 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.15000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.18595 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75000 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.35916 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.19656 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.74380 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00556 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.99587 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32778 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.74380 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.00556 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.99629 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32995 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.74380 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.65000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.99545 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32561 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.74380 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.65000 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.74380 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.49444 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.18595 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75000 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58642 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44656 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.18595 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.75000 * CGRectGetHeight(group))];
        [bezier2Path closePath];
        [gray setFill];
        [bezier2Path fill];
        [gray setStroke];
        bezier2Path.lineWidth = 0.5;
        [bezier2Path stroke];
    }
}


@end
