//
//  CMVTable.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVTable.h"

@implementation CMVTable

-(void)drawRect:(CGRect)rect {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* blue = BRAND_YELLOW_COLOR;
    
    //// Shadow Declarations
    UIColor* shadow = [UIColor blackColor];
    CGSize shadowOffset = CGSizeMake(-1.1, -0.1);
    CGFloat shadowBlurRadius = 1;
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 1.5, CGRectGetWidth(frame) - 3, CGRectGetHeight(frame) - 3) cornerRadius: 5];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [blue setStroke];
    roundedRectanglePath.lineWidth = 1;
    [roundedRectanglePath stroke];
    CGContextRestoreGState(context);
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11650 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.20874 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.88350 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.20874 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezier2Path fill];
    [blue setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11650 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35437 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.88350 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35437 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezierPath fill];
    [blue setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11650 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.88350 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezier3Path fill];
    [blue setStroke];
    bezier3Path.lineWidth = 1;
    [bezier3Path stroke];
    
    
    //// Bezier 4 Drawing
    UIBezierPath* bezier4Path = [UIBezierPath bezierPath];
    [bezier4Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11650 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.64563 * CGRectGetHeight(frame))];
    [bezier4Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.88350 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.64563 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezier4Path fill];
    [blue setStroke];
    bezier4Path.lineWidth = 1;
    [bezier4Path stroke];
    
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
    [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11650 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79126 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.88350 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79126 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezier5Path fill];
    [blue setStroke];
    bezier5Path.lineWidth = 1;
    [bezier5Path stroke];

}

@end
