//
//  CMVWeb.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVWeb.h"

@implementation CMVWeb

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
    
    
    //// Livello 1 Drawing
    UIBezierPath* livello1Path = [UIBezierPath bezierPath];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49576 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01695 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.97458 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.49576 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.76020 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01695 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.97458 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.23132 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49576 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97458 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.97458 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.76020 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.76020 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97458 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.01695 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.49576 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23132 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97458 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.01695 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.76020 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49576 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01695 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.01695 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.23132 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23132 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01695 * CGRectGetHeight(frame))];
    [livello1Path closePath];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.58475 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95763 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.74576 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.58475 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95763 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.74576 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80437 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.57627 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02542 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.74576 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19563 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.57627 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02542 * CGRectGetHeight(frame))];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.41525 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95763 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.25424 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.41525 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.95763 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.25424 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80437 * CGRectGetHeight(frame))];
    [livello1Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.42373 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02542 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.25424 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.19563 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.42373 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.02542 * CGRectGetHeight(frame))];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.01695 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.97458 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.50000 * CGRectGetHeight(frame))];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07627 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72881 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91525 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72881 * CGRectGetHeight(frame))];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.07627 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26271 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.91525 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26271 * CGRectGetHeight(frame))];
    [livello1Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.01695 * CGRectGetHeight(frame))];
    [livello1Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.97458 * CGRectGetHeight(frame))];
    [color setStroke];
    livello1Path.lineWidth = 1;
    [livello1Path stroke];
    self.highlitedColor=nil;
}


@end
