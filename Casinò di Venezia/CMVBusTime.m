//
//  CMVBusTime.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVBusTime.h"

@implementation CMVBusTime

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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 0.114 blue: 0.114 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = [UIColor blackColor];
    CGSize shadowOffset = CGSizeMake(1.1, 1.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Frames
    CGRect frame = rect;
    
    //// Subframes
    CGRect frame2 = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 15) * 0.00000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 18) * 0.47059 + 0.5), 15, 18);
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMaxX(frame) - 5, CGRectGetMinY(frame) + 8.5)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 5, CGRectGetMaxY(frame) - 9.5)];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 9, CGRectGetMaxY(frame) - 5.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 5, CGRectGetMaxY(frame) - 7.29) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 6.79, CGRectGetMaxY(frame) - 5.5)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 14.5, CGRectGetMaxY(frame) - 5.5)];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMaxY(frame) - 9.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 12.29, CGRectGetMaxY(frame) - 5.5) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMaxY(frame) - 7.29)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 10.5, CGRectGetMinY(frame2) + 14.32)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 1.5, CGRectGetMinY(frame2) + 8.5)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame2) + 10.5, CGRectGetMinY(frame2) + 2.68)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMinY(frame) + 8.5)];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 14.5, CGRectGetMinY(frame) + 4.5) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 10.5, CGRectGetMinY(frame) + 6.29) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 12.29, CGRectGetMinY(frame) + 4.5)];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMaxX(frame) - 9, CGRectGetMinY(frame) + 4.5)];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMaxX(frame) - 5, CGRectGetMinY(frame) + 8.5) controlPoint1: CGPointMake(CGRectGetMaxX(frame) - 6.79, CGRectGetMinY(frame) + 4.5) controlPoint2: CGPointMake(CGRectGetMaxX(frame) - 5, CGRectGetMinY(frame) + 6.29)];
    [bezier2Path closePath];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color setFill];
    [bezier2Path fill];
    CGContextRestoreGState(context);
}


@end
