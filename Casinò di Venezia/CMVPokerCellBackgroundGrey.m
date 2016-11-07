//
//  CMVPokerCellBackgroundGrey.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 01/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVPokerCellBackgroundGrey.h"

@implementation CMVPokerCellBackgroundGrey


-(void)drawTextInRect:(CGRect)rect {

        //// General Declarations
        CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
        CGContextRef context = UIGraphicsGetCurrentContext();
    
        //// Color Declarations
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
        CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame));
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
        CGContextSaveGState(context);
        [rectanglePath addClip];
        CGContextDrawLinearGradient(context, gradient2,
                                    CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMinY(rectangleRect)),
                                    CGPointMake(CGRectGetMidX(rectangleRect), CGRectGetMaxY(rectangleRect)),
                                    0);
        CGContextRestoreGState(context);
        
        
        //// Cleanup
        CGGradientRelease(gradient2);
        CGColorSpaceRelease(colorSpace);
    
    UIEdgeInsets insets = {0, 5, 0, 0};
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, insets)];

}
@end
