//
//  CMVMenuButton.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 04/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVMenuButton.h"

@implementation CMVMenuButton

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
    UIColor* color = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Frames
    CGRect frame = rect;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) + floor((CGRectGetWidth(frame) - 25) * 0.00000 + 0.5), CGRectGetMinY(frame) + floor((CGRectGetHeight(frame) - 20) * 0.00000 + 0.5), 25, 20);
    
    
    //// Group
    {
        //// Rectangle Drawing
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + 0.5, CGRectGetMinY(group) + CGRectGetHeight(group) - 20, 24, 4)];
        [color setFill];
        [rectanglePath fill];
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + 0.5, CGRectGetMinY(group) + CGRectGetHeight(group) - 12, 24, 4)];
        [color setFill];
        [rectangle2Path fill];
        
        
        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + 0.5, CGRectGetMinY(group) + CGRectGetHeight(group) - 4, 24, 4)];
        [color setFill];
        [rectangle3Path fill];
    }
}


@end
