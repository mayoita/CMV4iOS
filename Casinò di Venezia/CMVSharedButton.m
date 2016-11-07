//
//  CMVSharedButton.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 09/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSharedButton.h"

@implementation CMVSharedButton

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
    UIColor* forma1Color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Forma 1 Drawing
    UIBezierPath* forma1Path = [UIBezierPath bezierPath];
    [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.84244 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02727 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.70182 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16993 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.76478 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02727 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.70182 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09117 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.70737 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.20932 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.70182 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.18360 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.70383 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19680 * CGRectGetHeight(frame))];
    [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.29628 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38412 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.17451 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31259 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.27198 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.34141 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.22659 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31259 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.03390 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.45524 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.09688 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31259 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.03390 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.37648 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.17451 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59790 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.03390 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53403 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.09688 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59790 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.27744 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55222 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.21520 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59790 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.25176 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58026 * CGRectGetHeight(frame))];
    [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.54232 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.74537 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.52605 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81187 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.53197 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.76524 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.52605 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78784 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66667 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95455 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.52605 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.89067 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.58903 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95455 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.80728 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81187 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.74430 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95455 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.80728 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.89067 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66667 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.66923 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.80728 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.73311 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.74430 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.66923 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.56260 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.71620 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.62537 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.66923 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.58833 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.68743 * CGRectGetHeight(frame))];
    [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.29807 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.52337 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.31513 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.45524 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.30895 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50312 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.31513 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.47992 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.30988 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.41702 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.31513 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44199 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.31321 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.42921 * CGRectGetHeight(frame))];
    [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72127 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24208 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.84244 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31261 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.74569 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28422 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.79075 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31261 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.98305 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16993 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.92009 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.31261 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.98305 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24873 * CGRectGetHeight(frame))];
    [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.84244 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02727 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.98305 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09117 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.92009 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02727 * CGRectGetHeight(frame))];
    [forma1Path closePath];
    [forma1Color setFill];
    [forma1Path fill];
}


@end
