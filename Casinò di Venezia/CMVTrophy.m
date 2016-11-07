//
//  CMVTrophy.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVTrophy.h"

@implementation CMVTrophy

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
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.21231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.94615 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.32000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60923 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.03846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.38615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06769 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.60154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.94923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.61077 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.77538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.94462 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.74154 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.21231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.94615 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    [bezier3Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.13231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.35692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59846 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.27077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.86615 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70308 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.71846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.86462 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59846 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.85692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.58000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.49385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.16769 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier3Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.13231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier3Path closePath];
    bezier3Path.miterLimit = 4;
    
    [color setFill];
    [bezier3Path fill];
    self.highlitedColor=nil;
}


@end
