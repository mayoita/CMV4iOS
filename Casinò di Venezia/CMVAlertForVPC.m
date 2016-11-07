//
//  CMVAlertForVPC.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 21/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVAlertForVPC.h"
@implementation CMVAlertForVPC

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
    //// General Declarations
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    //// Color Declarations
    UIColor* color2 = [UIColor colorWithRed: 0.833 green: 0.833 blue: 0.833 alpha: 1];
    UIColor* color3 = [UIColor colorWithRed: 0.667 green: 0.667 blue: 0.667 alpha: 1];
    UIColor* color4 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    UIColor* color6 = [UIColor colorWithRed: 0.651 green: 0.153 blue: 0.161 alpha: 1];
    UIColor* color7 = [UIColor colorWithRed: 1 green: 1 blue: 1 alpha: 1];
    
    //// Image Declarations
    UIImage* iPhoneVPC = [UIImage imageNamed: @"iPhoneVPC"];
    
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
        [iPhoneVPC drawInRect: CGRectMake(floor(CGRectGetMinX(rectangleRect) + 0.5), floor(CGRectGetMinY(rectangleRect) + 0.5), iPhoneVPC.size.width, iPhoneVPC.size.height)];
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
        
        
        //// Forma 1 Drawing
        UIBezierPath* forma1Path = [UIBezierPath bezierPath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56050 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53454 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55184 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54319 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52111 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28728 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53494 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30547 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53267 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29305 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50948 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28354 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51817 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28581 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.51298 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28426 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49336 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28354 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50490 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28260 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49752 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28314 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46383 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47072 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28570 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.46319 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29738 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43787 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.45517 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44652 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48531 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26546 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43709 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28824 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44940 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27160 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.51485 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26609 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49301 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26415 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50639 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26443 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53275 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27107 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.52062 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26722 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52791 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.26887 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56050 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31968 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55261 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.28014 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.56082 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29636 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43250 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32654 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53275 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32654 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.46591 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32654 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49933 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32654 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.57661 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32965 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54828 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32654 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.56725 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32523 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58556 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33838 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.57942 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33098 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58500 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33615 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58735 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37328 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58796 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34794 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58735 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35851 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58735 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40817 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58735 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38495 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58725 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39339 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56676 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42375 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58739 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41352 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.57576 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42358 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49426 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42438 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54419 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42418 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.51468 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42438 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43160 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42375 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.47296 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42438 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.45338 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42458 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41191 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41129 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.42359 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.42345 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41231 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41399 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41101 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35707 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.40954 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39530 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41101 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37257 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41370 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33651 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41101 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34985 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41005 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34155 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43250 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32654 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41791 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33069 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.42188 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32718 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49694 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35645 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48799 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35894 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49252 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35691 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.49063 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35769 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48173 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36517 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.48507 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36033 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.48319 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36119 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48620 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37826 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.48139 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37060 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.48167 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37486 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.48978 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37951 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.48702 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37887 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.48968 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37861 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49784 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39945 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.49058 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38626 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.48547 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39930 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50858 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37951 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51177 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39961 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50899 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38779 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.51574 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36330 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51731 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37653 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.51719 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37025 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.49694 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35645 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.51249 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35957 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50787 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35673 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [color7 setFill];
        [forma1Path fill];
    }
}


@end
