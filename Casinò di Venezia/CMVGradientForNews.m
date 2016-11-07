//
//  CMVGradientForNews.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVGradientForNews.h"

@implementation CMVGradientForNews

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed:0.000 green:0.000 blue:0.008 alpha:1.000];
    UIColor* color3 = [UIColor colorWithRed: 0.435 green: 0 blue: 0.008 alpha: 0];
    
    //// Gradient Declarations
    NSArray* gradientColors = [NSArray arrayWithObjects:
                               (id)color2.CGColor,
                               (id)[UIColor colorWithRed:0.000 green:0.000 blue:0.008 alpha:0.500].CGColor,
                               (id)color3.CGColor,
                               (id)[UIColor colorWithRed: 0.435 green: 0 blue: 0.008 alpha: 0].CGColor,
                               (id)color3.CGColor,
                               (id)[UIColor colorWithRed:0.000 green:0.000 blue:0.008 alpha:0.500].CGColor,
                               (id)color2.CGColor, nil];
    CGFloat gradientLocations[] = {0, 0.01, 0.03, 0.45, 0.97, 0.99, 1};
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)gradientColors, gradientLocations);
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rectangle Drawing
    CGRect rectangleRect = CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame) - 0.5);
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
    CGContextSaveGState(context);
    [rectanglePath addClip];
    CGContextDrawLinearGradient(context, gradient,
                                CGPointMake(CGRectGetMinX(rectangleRect), CGRectGetMidY(rectangleRect)),
                                CGPointMake(CGRectGetMaxX(rectangleRect), CGRectGetMidY(rectangleRect)),
                                0);
    CGContextRestoreGState(context);
    
    
    //// Cleanup
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
}


@end
