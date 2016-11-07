//
//  CMVLogInFieldsBGThree.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 07/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVLogInFieldsBGThree.h"

@implementation CMVLogInFieldsBGThree


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //// Color Declarations
    UIColor* whiteAlfa = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 0.589];
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rounded Rectangle Drawing
    UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + 0.5, CGRectGetWidth(frame) - 3, floor((CGRectGetHeight(frame) - 0.5) * 0.30075 + 0.5)) cornerRadius: 4];
    [whiteAlfa setFill];
    [roundedRectanglePath fill];
    
    
    //// Rounded Rectangle 2 Drawing
    UIBezierPath* roundedRectangle2Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.35075) + 0.5, CGRectGetWidth(frame) - 3, floor(CGRectGetHeight(frame) * 0.64925) - floor(CGRectGetHeight(frame) * 0.35075)) cornerRadius: 4];
    [whiteAlfa setFill];
    [roundedRectangle2Path fill];
    
    
    //// Rounded Rectangle 3 Drawing
    UIBezierPath* roundedRectangle3Path = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(frame) + 1.5, CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 0.5) * 0.69925) + 0.5, CGRectGetWidth(frame) - 3, CGRectGetHeight(frame) - 1 - floor((CGRectGetHeight(frame) - 0.5) * 0.69925)) cornerRadius: 4];
    [whiteAlfa setFill];
    [roundedRectangle3Path fill];
}


@end
