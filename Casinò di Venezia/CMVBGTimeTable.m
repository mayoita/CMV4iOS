//
//  CMVBGTimeTable.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVBGTimeTable.h"

@implementation CMVBGTimeTable


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //// General Declarations
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* gradientColor = [UIColor colorWithRed: 0.401 green: 0.401 blue: 0.401 alpha: 1];
    UIColor* gradientColor2 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 1];
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)gradientColor.CGColor,
                               (id)[UIColor colorWithRed: 0.201 green: 0.201 blue: 0.201 alpha: 1].CGColor,
                               (id)gradientColor2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.32, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame))];
    [color setFill];
    [rectanglePath fill];
    
    
    //// Rectangle 2 Drawing
    CGRect rectangle2Rect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 1, floor((CGRectGetWidth(frame)) * 0.49691) + 0.5, CGRectGetHeight(frame) - 2);
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: rectangle2Rect];
    CGContextSaveGState(context);
    [rectangle2Path addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(rectangle2Rect), CGRectGetMinY(rectangle2Rect)),
                                CGPointMake(CGRectGetMidX(rectangle2Rect), CGRectGetMaxY(rectangle2Rect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Rectangle 3 Drawing
    CGRect rectangle3Rect = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame)) * 0.50000 + 0.5), CGRectGetMinY(frame) + 1, CGRectGetWidth(frame) - floor((CGRectGetWidth(frame)) * 0.50000 + 0.5), CGRectGetHeight(frame) - 2);
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: rectangle3Rect];
    CGContextSaveGState(context);
    [rectangle3Path addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMidX(rectangle3Rect), CGRectGetMinY(rectangle3Rect)),
                                CGPointMake(CGRectGetMidX(rectangle3Rect), CGRectGetMaxY(rectangle3Rect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
