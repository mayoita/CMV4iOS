//
//  CMVMenuRestaurant.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 25/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVMenuRestaurant.h"

@implementation CMVMenuRestaurant

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
    UIColor* color3 = [UIColor colorWithRed: 0 green: 0 blue: 0 alpha: 0.800];
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.700];
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame), CGRectGetWidth(frame), CGRectGetHeight(frame)) cornerRadius: 4];
    [color setFill];
    [roundedRectanglePath fill];
    
    
    //// Livello 1 Drawing
    UIBezierPath* livello1Path = [UIBezierPath bezierPath];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09798 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.13926 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.12901 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.13926 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.12894 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53745 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10830 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50985 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10830 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44086 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.13926 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39946 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.13926 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.12894 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.12894 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33047 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11862 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33047 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.11862 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10830 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.10830 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33047 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09798 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33047 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09798 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.08766 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.08766 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33047 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07734 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.33047 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07734 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06702 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09590 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.05670 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39946 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.08766 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44086 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.08766 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50985 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.06702 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53745 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.05670 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09798 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.05670 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.06695 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame))];
    [livello1Path closePath];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.90299 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.94418 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.93666 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.94418 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.93388 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55125 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91329 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.52365 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91329 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48225 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.94418 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44086 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.94418 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.08210 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.93388 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.05450 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.94418 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.08210 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.94845 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.05351 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86170 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24768 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.87665 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.05096 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.86170 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24768 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86170 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.44086 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89267 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48225 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89267 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.52365 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.87202 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55125 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86170 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.90299 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.86170 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93761 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.86931 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96520 * CGRectGetHeight(frame))];
    [livello1Path closePath];
    [color3 setFill];
    [livello1Path fill];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.33539 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29053 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.33539 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72913 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.24471 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.41165 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.24471 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60802 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66377 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72913 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.42607 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85025 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.57309 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85025 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66377 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29053 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.75445 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60802 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.75445 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.41165 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.33539 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29053 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.57309 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16942 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.42607 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16942 * CGRectGetHeight(frame))];
    [bezierPath closePath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72978 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.20495 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72978 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81471 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.85629 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.37333 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.85629 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.64633 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.27165 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81471 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.60327 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98309 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.39816 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.98309 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.27165 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.20495 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.14514 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.64633 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.14514 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.37333 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72978 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.20495 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.39816 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.03657 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.60327 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.03657 * CGRectGetHeight(frame))];
    [bezierPath closePath];
    [color3 setFill];
    [bezierPath fill];

}


@end
