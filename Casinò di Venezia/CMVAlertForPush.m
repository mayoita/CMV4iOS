//
//  CMVAlertForPush.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 09/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVAlertForPush.h"

@implementation CMVAlertForPush

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.833 green: 0.833 blue: 0.833 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.651 green: 0.153 blue: 0.161 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Image Declarations
    UIImage* image = [UIImage imageNamed: @"iPhoneEvents"];
    
    //// Frames
    CGRect frame = rect;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) - 1, CGRectGetMinY(frame), CGRectGetWidth(frame) + 2, CGRectGetHeight(frame) + 1);
    
    
    //// Group
    {
        //// Rectangle Drawing
        CGRect rectangleRect = CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00407 + 0.5), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.00000 + 0.5), floor(CGRectGetWidth(group) * 0.99797 + 0.5) - floor(CGRectGetWidth(group) * 0.00407 + 0.5), floor(CGRectGetHeight(group) * 0.34950 + 0.5) - floor(CGRectGetHeight(group) * 0.00000 + 0.5));
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
        CGContextSaveGState(context);
        [rectanglePath addClip];
        [image drawInRect: CGRectMake(floor(CGRectGetMinX(rectangleRect) + 0.5), floor(CGRectGetMinY(rectangleRect) + 0.5), image.size.width, image.size.height)];
        CGContextRestoreGState(context);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00305) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.57418) + 0.5, floor(CGRectGetWidth(group) * 1.00000 + 0.5) - floor(CGRectGetWidth(group) * 0.00305) - 0.5, floor(CGRectGetHeight(group) * 0.80813) - floor(CGRectGetHeight(group) * 0.57418))];
        [color2 setFill];
        [rectangle2Path fill];
        [color4 setStroke];
        rectangle2Path.lineWidth = 1;
        [rectangle2Path stroke];
        
        
        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00102) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.80243) + 0.5, floor(CGRectGetWidth(group) * 0.99797 + 0.5) - floor(CGRectGetWidth(group) * 0.00102) - 0.5, floor(CGRectGetHeight(group) * 0.99929) - floor(CGRectGetHeight(group) * 0.80243))];
        [color2 setFill];
        [rectangle3Path fill];
        
        
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00407 + 0.5), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.80456 + 0.5), floor(CGRectGetWidth(group) * 0.99797 + 0.5) - floor(CGRectGetWidth(group) * 0.00407 + 0.5), floor(CGRectGetHeight(group) * 0.81027 + 0.5) - floor(CGRectGetHeight(group) * 0.80456 + 0.5))];
        [color3 setFill];
        [rectangle4Path fill];
        
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.33435) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.23609) + 0.5, floor(CGRectGetWidth(group) * 0.66362) - floor(CGRectGetWidth(group) * 0.33435), floor(CGRectGetHeight(group) * 0.46291) - floor(CGRectGetHeight(group) * 0.23609))];
        [color6 setFill];
        [ovalPath fill];
        [color4 setStroke];
        ovalPath.lineWidth = 1;
        [ovalPath stroke];
        
        
        //// Forma Drawing
        UIBezierPath* formaPath = [UIBezierPath bezierPath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46596 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37811 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.39277 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32203 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.42911 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37455 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.40596 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34341 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.38008 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29810 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.38843 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31500 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.38113 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30692 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43473 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27622 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.39733 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29050 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41476 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28190 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27143 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44531 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27321 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.45582 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27353 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50695 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26869 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47902 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26950 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49462 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26710 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52354 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31930 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51248 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28491 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52291 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29928 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52159 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31930 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.52289 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31930 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52224 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31930 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31861 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51620 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31623 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50878 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31790 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49524 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32272 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50027 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32029 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49696 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32107 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48353 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33981 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49134 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32842 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.48743 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33411 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.44547 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36648 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.46126 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33434 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44591 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35342 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.44644 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36648 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44579 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36648 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44612 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36648 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47767 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35007 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.45213 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35968 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.46437 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35130 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47767 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35075 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47767 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35030 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.47767 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35053 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46596 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37811 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47225 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35576 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.46736 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37057 * CGRectGetHeight(group))];
        [formaPath closePath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48451 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30289 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31109 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47864 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30564 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.46986 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30561 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48255 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31656 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47279 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31292 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.47768 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31474 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50793 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30836 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49352 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31863 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50655 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31341 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48451 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30289 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49982 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30642 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49671 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30300 * CGRectGetHeight(group))];
        [formaPath closePath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41717 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33366 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.45035 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31588 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43701 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33399 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44931 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32844 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.44157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31520 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44816 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31535 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44505 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31518 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43278 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31656 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43932 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31617 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.43552 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31575 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41717 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33366 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.42454 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31900 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41786 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32590 * CGRectGetHeight(group))];
        [formaPath closePath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50890 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32819 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52842 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33161 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51709 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32820 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52244 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33025 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.57136 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34118 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54383 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33510 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55763 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33674 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.60357 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35623 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58300 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34494 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.59340 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35134 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.62602 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37195 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.61112 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35985 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.62576 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36349 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61040 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39247 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.61883 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37744 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.61617 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38604 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55868 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.43145 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.59653 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40793 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58100 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42179 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50988 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.43965 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54788 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.43612 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52911 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.44362 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47865 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38905 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49120 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.43580 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.47181 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41056 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50890 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32819 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.48613 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36554 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49327 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34563 * CGRectGetHeight(group))];
        [formaPath closePath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50793 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36375 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36443 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50655 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36440 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50473 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36441 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36580 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36489 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50207 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36534 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53916 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37811 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51537 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37596 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.51140 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37921 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53916 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37674 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53916 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37765 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53916 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37720 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50793 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36375 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.52993 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36983 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52786 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36365 * CGRectGetHeight(group))];
        [formaPath closePath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55282 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38084 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55087 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38358 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55151 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38214 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38144 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55770 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39042 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55400 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38538 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55507 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38825 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58698 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39520 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.56388 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39550 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.57558 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39547 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58795 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39452 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58730 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39498 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58763 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39475 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58698 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39384 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58763 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39429 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58730 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39406 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55282 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38084 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58345 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38382 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.57168 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38052 * CGRectGetHeight(group))];
        [formaPath closePath];
        [formaPath moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49719 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38905 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53721 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42051 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49648 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40706 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50669 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42763 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56063 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41093 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41841 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55245 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41310 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56063 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41025 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.56063 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41070 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.56063 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41048 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.51671 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40614 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54361 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41052 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52754 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41162 * CGRectGetHeight(group))];
        [formaPath addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49719 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38905 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50934 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40242 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50414 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39160 * CGRectGetHeight(group))];
        [formaPath closePath];
        [color7 setFill];
        [formaPath fill];
    }
}

@end
