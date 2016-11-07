//
//  CMVTimetables.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVTimetables.h"

@implementation CMVTimetables


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIColor *color=[[UIColor alloc] init];
    //// Color Declarations
    if (!self.highlitedColor) {
        color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    } else {
        color = self.highlitedColor;
    }
    

    
    //// Frames
    CGRect frame =rect;
    
    
    //// Group
    {
    }
    
    
    //// Group 2
    {
    }
    
    
    //// Bezier 5 Drawing
    UIBezierPath* bezier5Path = [UIBezierPath bezierPath];
    [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.99538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.91231 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.83231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.74923 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.89231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.86923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.89231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.65231 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36462 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.89231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.48462 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.82154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.39385 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06154 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.06154 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.09231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.92308 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.92308 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83077 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.72000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.72308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.72154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82462 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.81077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.77077 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.75385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.81231 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.78462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.79385 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.97385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93385 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.98462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93846 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.97692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93692 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.98154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93846 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.99538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93385 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.98923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93846 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.99231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93692 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.99538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.91231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 1.00154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.92769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 1.00154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.91846 * CGRectGetHeight(frame))];
    [bezier5Path closePath];
    [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59231 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.65385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.86154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70615 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.76769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80000 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.44615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.54000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.80000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.44615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70615 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.65385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.44615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.47846 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.54000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.86154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.76769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.86154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.47846 * CGRectGetHeight(frame))];
    [bezier5Path closePath];
    [bezier5Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83077 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.89231 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.12308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.89231 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.12308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09231 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.09231 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35692 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.65385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.68000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35538 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.66769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.60154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.55231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.37077 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.51077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40154 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.50923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.41538 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.40615 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.42462 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.47846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.43077 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.42154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53846 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.45077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.46000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.43077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.49692 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53846 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.55385 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.53846 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.54462 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.56923 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.56308 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.56923 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.41692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.56923 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.41538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.41692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.57692 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.41538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58462 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.43077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.67692 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.41538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.62154 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.42154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.65077 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.67692 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.69231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.67692 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.68308 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70769 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70154 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70769 * CGRectGetHeight(frame))];
    [bezier5Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.44462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.70769 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.65385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83077 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.48462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.78154 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.56308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83077 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82769 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.66769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83077 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.68000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82923 * CGRectGetHeight(frame))];
    [bezier5Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.83077 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.69231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.82923 * CGRectGetHeight(frame))];
    [bezier5Path closePath];
    bezier5Path.miterLimit = 4;
    
    [color setFill];
    [bezier5Path fill];
    
    
    //// Bezier 6 Drawing
    UIBezierPath* bezier6Path = [UIBezierPath bezierPath];
    [bezier6Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29231 * CGRectGetHeight(frame))];
    [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.56923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29231 * CGRectGetHeight(frame))];
    [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.58462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.27692 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.57846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29231 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.58462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28615 * CGRectGetHeight(frame))];
    [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.56923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.58462 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.57846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26154 * CGRectGetHeight(frame))];
    [bezier6Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26154 * CGRectGetHeight(frame))];
    [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.27692 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26154 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.26769 * CGRectGetHeight(frame))];
    [bezier6Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.24615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29231 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28615 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.23692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.29231 * CGRectGetHeight(frame))];
    [bezier6Path closePath];
    bezier6Path.miterLimit = 4;
    
    [color setFill];
    [bezier6Path fill];
    self.highlitedColor=nil;
}


@end
