//
//  CMVLogIn.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 07/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVLogIn.h"

@implementation CMVLogIn

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
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.39538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24154 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.12923 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58462 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.52308 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.50769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59385 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.51385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60000 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.53846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.58462 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.53231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.60000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.53846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.59385 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.53846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.12923 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.65077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24154 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.66154 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24615 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.65385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24462 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.65846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24615 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.67231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.66615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24615 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.66923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24462 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.67231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22000 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.67846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.23538 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.67846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22615 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.53385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.08154 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.51231 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.08154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.52769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.07538 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.51846 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.07538 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.37385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22000 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.37385 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.36769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.22615 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.36769 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.23538 * CGRectGetHeight(frame))];
    [bezierPath addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.39538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24154 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.38000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24769 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.38923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.24769 * CGRectGetHeight(frame))];
    [bezierPath closePath];
    bezierPath.miterLimit = 4;
    
    [color setFill];
    [bezierPath fill];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.64615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36923 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.63692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.63077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36000 * CGRectGetHeight(frame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.64615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.63077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.37846 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.63692 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.81538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.81538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93846 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.93846 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.23077 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.41538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36923 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.40923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.38462 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.41538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.37846 * CGRectGetHeight(frame))];
    [bezier2Path addCurveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.40000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame)) controlPoint1: CGPointMake(CGRectGetMinX(frame) + 0.41538 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.36000 * CGRectGetHeight(frame)) controlPoint2: CGPointMake(CGRectGetMinX(frame) + 0.40923 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.20000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.20000 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96923 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.84615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.96923 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.84615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.64615 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.35385 * CGRectGetHeight(frame))];
    [bezier2Path closePath];
    bezier2Path.miterLimit = 4;
    
    [color setFill];
    [bezier2Path fill];
    self.highlitedColor=nil;
}


@end
