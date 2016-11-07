//
//  CMVMail.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVMail.h"

@implementation CMVMail

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
    UIColor *color=[[UIColor alloc] init];
    //// Color Declarations
    if (!self.highlitedColor) {
        color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    } else {
        color = self.highlitedColor;
    }

    
    //// Frames
    CGRect frame = rect;
    
    
    //// Group
    {
    }
    
    
    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16129 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16129 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.03077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24194 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.06462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16129 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.03077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19677 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.03077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77419 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.04615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82258 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.03077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79194 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.03692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80806 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.05077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83387 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.04615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82742 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.04769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83065 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83871 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.05385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83710 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.05846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83871 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83871 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85484 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.07385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.84839 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.09077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85484 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85484 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.95385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77419 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.92000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85484 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.95385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81935 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.95385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24194 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16129 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.95385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19677 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.92000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16129 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.64462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50806 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22097 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.92308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24194 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.92154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22742 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.92308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.23387 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.92308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77419 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.92154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78387 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.92308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77742 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.92308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78065 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.64462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50806 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19355 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19839 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.88462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19355 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.89077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19516 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.57846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53226 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53226 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.08769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19839 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19355 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.09385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19516 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.10000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19355 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19355 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24194 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22097 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.23387 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.06308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22742 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.34000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50806 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79516 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77419 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.06308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78871 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78226 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24194 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82258 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.08769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81774 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.10000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82258 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.09385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82097 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.36154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53065 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.39385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.56452 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.59077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.56452 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.62308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53065 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.90615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81129 * CGRectGetHeight(frame))];
    [bezier3Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82258 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.89846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81774 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.88769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82258 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82258 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    bezier3Path.miterLimit = 4;
    
    [color setFill];
    [bezier3Path fill];
    self.highlitedColor=nil;

}


@end
