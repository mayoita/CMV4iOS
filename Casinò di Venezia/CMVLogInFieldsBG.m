//
//  CMVLogInFieldsBG.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVLogInFieldsBG.h"

@implementation CMVLogInFieldsBG


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    //// Color Declarations
    UIColor* whiteAlfa = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.589];
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 1.5, CGRectGetWidth(frame) - 3, floor((CGRectGetHeight(frame) - 1.5) * 0.44444 + 0.5)) cornerRadius: 4];
    [whiteAlfa setFill];
    [roundedRectanglePath fill];
    
    
    //// Rounded Rectangle 2 Drawing
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 2) * 0.55056) + 0.5, CGRectGetWidth(frame) - 3, CGRectGetHeight(frame) - 2.5 - floor((CGRectGetHeight(frame) - 2) * 0.55056)) cornerRadius: 4];
    [whiteAlfa setFill];
    [roundedRectangle2Path fill];
}


@end
