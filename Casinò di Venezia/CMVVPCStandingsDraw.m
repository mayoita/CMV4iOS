//
//  CMVVPCStandingsDraw.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 09/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVVPCStandingsDraw.h"

@implementation CMVVPCStandingsDraw


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
-(void)drawTextInRect:(CGRect)rect {
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* gradient2Color = [UIColor colorWithRed: 0.886 green: 0.886 blue: 0.886 alpha: 1];
    UIColor* gradient2Color2 = [UIColor colorWithRed: 0.573 green: 0.573 blue: 0.569 alpha: 1];
    
    //// Gradient Declarations
    NSArray* gradient2Colors = [NSArray arrayWithObjects:
                                (id)gradient2Color.CGColor,
                                (id)gradient2Color2.CGColor, nil];
    CGFloat gradient2Locations[] = {0, 1};
    CGGradientRef gradient2 = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradient2Colors, gradient2Locations);
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame))];
    [color setFill];
    [rectanglePath fill];
    
    
    //// Rectangle 2 Drawing
    CGRect rectangle2Rect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + 1, CGRectGetWidth(frame) - 1, CGRectGetHeight(frame) - 2);
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: rectangle2Rect];
    CGContextSaveGState(context);
    [rectangle2Path addClip];
    CGContextDrawLinearGradient(context, gradient2,
                                CGPointMake(CGRectGetMidX(rectangle2Rect), CGRectGetMinY(rectangle2Rect)),
                                CGPointMake(CGRectGetMidX(rectangle2Rect), CGRectGetMaxY(rectangle2Rect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient2);
    CGColorSpaceRelease(colorSpace);
    
    UIEdgeInsets insets = {0, 3, 0, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];
}


@end
