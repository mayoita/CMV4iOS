//
//  CMVBackButton.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/07/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVBackButton.h"

@implementation CMVBackButton

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
    UIColor* color7 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* ovale = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.3];
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 3.5, CGRectGetMinY(frame) + 3, CGRectGetWidth(frame) - 8.5, CGRectGetHeight(frame) - 8)];
    [ovale setFill];
    [ovalPath fill];
    
    
    //// Livello 2 Drawing
    UIBezierPath* livello2Path = [UIBezierPath bezierPath];
    [livello2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.54499 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35450 * CGRectGetHeight(frame))];
    [livello2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.68318 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.49386 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.62131 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35450 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.68318 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.41690 * CGRectGetHeight(frame))];
    [livello2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.54499 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63323 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.68318 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.57083 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.62131 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63323 * CGRectGetHeight(frame))];
    [livello2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.54499 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35450 * CGRectGetHeight(frame))];
    [livello2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.30078 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35450 * CGRectGetHeight(frame))];
    [livello2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.54499 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63323 * CGRectGetHeight(frame))];
    [livello2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.44296 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63323 * CGRectGetHeight(frame))];
    [livello2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.30078 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35450 * CGRectGetHeight(frame))];
    [livello2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40779 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.46242 * CGRectGetHeight(frame))];
    [livello2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.30078 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35450 * CGRectGetHeight(frame))];
    [livello2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40430 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.25010 * CGRectGetHeight(frame))];
    livello2Path.miterLimit = 5.5;
    
    livello2Path.lineCapStyle = kCGLineCapRound;
    
    [color7 setStroke];
    livello2Path.lineWidth = 1;
    [livello2Path stroke];
}


@end
