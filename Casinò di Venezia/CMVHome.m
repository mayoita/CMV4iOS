//
//  CMVHome.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 07/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVHome.h"

@implementation CMVHome

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
    //// Color Declarations
    UIColor *color=[[UIColor alloc] init];
    //// Color Declarations
    if (!self.highlitedColor) {
        color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    } else {
        color = self.highlitedColor;
    }
    
    //// Frames
    CGRect frame = rect;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + 4, CGRectGetMinY(frame) + 2, CGRectGetWidth(frame) - 5, CGRectGetHeight(frame) - 5);
    
    
    //// Group
    {
        //// Bezier Drawing
        UIBezierPath* bezierPath = [UIBezierPath bezierPath];
        [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.97167 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50351 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.05789 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.02833 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50351 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.00500 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.47895 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.01228 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.99500 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.47895 * CGRectGetHeight(group))];
        [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.97167 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50351 * CGRectGetHeight(group))];
        [bezierPath closePath];
        bezierPath.miterLimit = 4;
        
        [color setFill];
        [bezierPath fill];
        
        
        //// Bezier 2 Drawing
        UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.88333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.51404 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.15263 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.11667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.51404 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.11667 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.88333 * CGRectGetWidth(group), CGRectGetMinY(group) + 1.00000 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.88333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.51404 * CGRectGetHeight(group))];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.38333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.38333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.64912 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.54386 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.38333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.59123 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.42833 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.54386 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.51667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.54386 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.64912 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.57167 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.54386 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.61667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.59123 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.61667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path closePath];
        [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.65000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.65000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.64912 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.51667 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50877 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.65000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.57193 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.59000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50877 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.48333 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50877 * CGRectGetHeight(group))];
        [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.35000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.64912 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.50877 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.35000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.57193 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.35000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.15000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.15000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52982 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.20000 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.85000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.52982 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.85000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.65000 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.96491 * CGRectGetHeight(group))];
        [bezier2Path closePath];
        bezier2Path.miterLimit = 4;
        
        [color setFill];
        [bezier2Path fill];
        self.highlitedColor=nil;
    }
}


@end
