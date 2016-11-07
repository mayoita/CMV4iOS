//
//  CMVGame.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVGame.h"

@implementation CMVGame

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
    
    
    //// Bezier 11 Drawing
    UIBezierPath* bezier11Path = [UIBezierPath bezierPath];
    [bezier11Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.07258 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.28132 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.85443 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.45275 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.68384 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.56379 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.91129 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.68153 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.84964 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.56703 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.63172 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.76923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.61514 * CGRectGetHeight(frame))];
    [bezier11Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.07258 * CGRectGetHeight(frame))];
    [bezier11Path closePath];
    [color setStroke];
    bezier11Path.lineWidth = 1;
    [bezier11Path stroke];

    self.highlitedColor=nil;



}


@end
