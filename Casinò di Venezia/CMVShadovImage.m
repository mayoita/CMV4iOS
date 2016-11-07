//
//  CMVShadovImage.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 22/07/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVShadovImage.h"

@implementation CMVShadovImage

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    
    return self;
}
-(id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    self.backgroundColor=[UIColor clearColor];
//    UIImageView* image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTabBar.png"]];
//    self.myImage=image;
//
//    image.frame = CGRectMake(self.bounds.origin.x + 7,self.frame.origin.y -1, self.frame.size.width -13, self.frame.size.height -16);
//    
//    [self addSubview:image];
 
    return self;
}
- (void)drawRect:(CGRect)rect {
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Shadow Declarations
    UIColor* shadow = [UIColor blackColor];
    CGSize shadowOffset = CGSizeMake(0.1, 4.1);
    CGFloat shadowBlurRadius = 5;
    
    //// Frames
    CGRect frame = rect;
    
    
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame) + 3.5, CGRectGetMinY(frame) - 0.5, CGRectGetWidth(frame) - 6, CGRectGetHeight(frame) - 8)];
    CGContextSaveGState(context);
    CGContextSetShadowWithColor(context, shadowOffset, shadowBlurRadius, shadow.CGColor);
    [color2 setFill];
    [rectanglePath fill];
    CGContextRestoreGState(context);

}

@end
