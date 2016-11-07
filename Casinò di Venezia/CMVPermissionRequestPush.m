//
//  CMVPermissionRequestPush.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 08/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVPermissionRequestPush.h"

@implementation CMVPermissionRequestPush

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
    
    //// Image Declarations
    UIImage* image = [UIImage imageNamed: @"iPadEvents"];
    
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
        
        
        //// Forma 1 Drawing
        UIBezierPath* forma1Path = [UIBezierPath bezierPath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43800 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.43443 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.44447 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44447 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.44447 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43800 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44447 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44157 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43443 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54145 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54503 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54145 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54503 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53788 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54145 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53788 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61257 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41760 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.61257 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40165 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58941 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41760 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50912 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53228 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41760 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50912 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40165 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50912 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36232 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53228 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61257 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58941 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.61257 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36232 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.59964 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.59964 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36725 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58224 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52205 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53946 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52205 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36725 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40869 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.52205 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39671 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53946 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40869 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.59964 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58224 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40869 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.59964 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39671 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.45740 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45740 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45740 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45740 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45740 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43153 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47033 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.47033 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.47033 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.47033 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.47033 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.47033 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41860 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38110 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.41860 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31966 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31966 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33747 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.57378 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33747 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.57378 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30274 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55978 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.57378 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29733 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.56752 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55438 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55438 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54145 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55438 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54859 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53432 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.52852 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45093 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45093 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43800 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.45093 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44514 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.42507 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43087 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.42507 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.42507 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.41968 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.40567 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30274 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41195 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.40567 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29733 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.40567 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38110 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41968 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.40567 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38649 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41195 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49619 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.41968 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41860 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38110 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41910 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41860 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38156 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50912 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50912 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.53499 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58025 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36863 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55438 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36418 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.56085 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36617 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55796 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36418 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36863 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55081 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36418 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36617 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38644 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55438 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54792 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38890 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55081 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.58025 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58671 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38644 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58382 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58671 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38890 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58025 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58671 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38397 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58382 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [color4 setFill];
        [forma1Path fill];
    }
}


@end
