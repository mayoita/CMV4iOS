//
//  CMVCloseButton.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 04/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVCloseButton.h"

@implementation CMVCloseButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _color=[UIColor colorWithRed: 0.886 green: 0 blue: 0 alpha: 1];
    }
    return self;
}

-(UIColor *)color {
    if (!_color) {
        _color=[UIColor colorWithRed: 0.886 green: 0 blue: 0 alpha: 1];
    }
    return _color;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //// Color Declarations
    //UIColor* color = [UIColor colorWithRed: 0.886 green: 0 blue: 0 alpha: 1];
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Oval Drawing
    UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(frame) + 4.5, CGRectGetMinY(frame) + 4.5, CGRectGetWidth(frame) - 9, CGRectGetHeight(frame) - 9)];
    [self.color setStroke];
    ovalPath.lineWidth = 1;
    [ovalPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63732 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28521 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50541 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.49226 * CGRectGetHeight(frame))];
    [bezier2Path addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.35915 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72183 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezier2Path fill];
    [self.color setStroke];
    bezier2Path.lineWidth = 1;
    [bezier2Path stroke];
    
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(CGRectGetMinX(frame) + 0.63732 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.72183 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.50541 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.51478 * CGRectGetHeight(frame))];
    [bezierPath addLineToPoint: CGPointMake(CGRectGetMinX(frame) + 0.35915 * CGRectGetWidth(frame), CGRectGetMinY(frame) + 0.28521 * CGRectGetHeight(frame))];
    [[UIColor whiteColor] setFill];
    [bezierPath fill];
    [self.color setStroke];
    bezierPath.lineWidth = 1;
    [bezierPath stroke];
}


@end
