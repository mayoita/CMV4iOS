//
//  CMVArrowSx.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 15/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVArrowSx.h"

@implementation CMVArrowSx

-(UIColor *)color {
    if (!_color) {
        _color=[UIColor colorWithRed: 0.886 green: 0 blue: 0 alpha: 1];
    }
    return _color;
}

-(void)drawRect:(CGRect)rect {
    //// Color Declarations
    
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86905 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06452 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.15476 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.49194 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86905 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93548 * CGRectGetHeight(frame))];
    [self.color setStroke];
    bezierPath.lineWidth = 2;
    [bezierPath stroke];
}

@end
