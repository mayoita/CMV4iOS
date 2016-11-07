//
//  CMVAlertForCalendar.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 30/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVAlertForCalendar.h"

@implementation CMVAlertForCalendar

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
    UIImage* image = [UIImage imageNamed: @"Livello-3"];
    
    //// Frames
    CGRect frame = rect;
    
    //// Subframes
    CGRect group = CGRectMake(CGRectGetMinX(frame) - 1, CGRectGetMinY(frame), CGRectGetWidth(frame) + 2, CGRectGetHeight(frame) + 1);
    
    
    //// Group
    {
        //// Rectangle Drawing
        CGRect rectangleRect = CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00405 + 0.5), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.00000 + 0.5), floor(CGRectGetWidth(group) * 0.99595 + 0.5) - floor(CGRectGetWidth(group) * 0.00405 + 0.5), floor(CGRectGetHeight(group) * 0.34916 + 0.5) - floor(CGRectGetHeight(group) * 0.00000 + 0.5));
        UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: rectangleRect];
        CGContextSaveGState(context);
        [rectanglePath addClip];
        [image drawInRect: CGRectMake(floor(CGRectGetMinX(rectangleRect) + 0.5), floor(CGRectGetMinY(rectangleRect) + 0.5), image.size.width, image.size.height)];
        CGContextRestoreGState(context);
        
        
        //// Rectangle 2 Drawing
        UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00607) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.57402) + 0.5, floor(CGRectGetWidth(group) * 0.99798) - floor(CGRectGetWidth(group) * 0.00607), floor(CGRectGetHeight(group) * 0.80866) - floor(CGRectGetHeight(group) * 0.57402))];
        [color2 setFill];
        [rectangle2Path fill];
        [color4 setStroke];
        rectangle2Path.lineWidth = 1;
        [rectangle2Path stroke];
        
        
        //// Rectangle 3 Drawing
        UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00202) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.80307) + 0.5, floor(CGRectGetWidth(group) * 0.99393) - floor(CGRectGetWidth(group) * 0.00202), floor(CGRectGetHeight(group) * 0.99860) - floor(CGRectGetHeight(group) * 0.80307))];
        [color2 setFill];
        [rectangle3Path fill];
        
        
        //// Rectangle 4 Drawing
        UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.00405 + 0.5), CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.80447 + 0.5), floor(CGRectGetWidth(group) * 0.99595 + 0.5) - floor(CGRectGetWidth(group) * 0.00405 + 0.5), floor(CGRectGetHeight(group) * 0.81006 + 0.5) - floor(CGRectGetHeight(group) * 0.80447 + 0.5))];
        [color3 setFill];
        [rectangle4Path fill];
        
        
        //// Oval Drawing
        UIBezierPath* ovalPath = [UIBezierPath bezierPathWithOvalInRect: CGRectMake(CGRectGetMinX(group) + floor(CGRectGetWidth(group) * 0.33401) + 0.5, CGRectGetMinY(group) + floor(CGRectGetHeight(group) * 0.23603) + 0.5, floor(CGRectGetWidth(group) * 0.66194) - floor(CGRectGetWidth(group) * 0.33401), floor(CGRectGetHeight(group) * 0.46229) - floor(CGRectGetHeight(group) * 0.23603))];
        [color6 setFill];
        [ovalPath fill];
        [color4 setStroke];
        ovalPath.lineWidth = 1;
        [ovalPath stroke];
        
        
        //// Forma 1 Drawing
        UIBezierPath* forma1Path = [UIBezierPath bezierPath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43711 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.43354 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.44356 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44068 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44356 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.44356 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43711 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.44356 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44068 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.43354 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54035 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54392 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54035 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54392 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27959 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53678 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27514 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.27713 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54035 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29986 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53678 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30185 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61133 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41760 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.61133 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40165 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58822 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41760 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.50809 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53120 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.41760 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.50809 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40165 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.50809 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36232 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53120 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.61133 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58822 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.61133 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36232 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.59842 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.59842 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36725 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58106 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52099 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53836 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52099 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36725 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40869 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.52099 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39671 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.53836 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40869 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.59842 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58106 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.40869 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.59842 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39671 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.45647 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45647 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45647 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45647 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45647 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.43066 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49518 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49518 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.46937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49518 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49518 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.35527 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.46937 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.37308 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41775 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38110 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.41775 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31966 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.31966 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33747 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.57261 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.33747 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.57261 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30274 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55864 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.57261 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29733 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.56636 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55326 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55326 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54035 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55326 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54747 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.52745 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.53323 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.52745 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.52745 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45002 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.45002 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.43711 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.45002 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.44423 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.42420 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29740 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.42999 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30630 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.42420 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30231 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.42420 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.41883 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.40485 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.30274 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41111 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29295 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.40485 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.29733 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.40485 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38110 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41883 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.40485 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38649 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41111 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49518 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.49518 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.41883 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.41775 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38110 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.41824 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.41775 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38156 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50809 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.32856 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.50809 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.53390 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.34637 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [forma1Path moveToPoint: CGPointMake(CGRectGetMinX(group) + 0.57907 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36863 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55326 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36418 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.55971 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36617 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.55682 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36418 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36863 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54969 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36418 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.36617 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38644 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.55326 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.54680 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38890 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.54969 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addLineToPoint: CGPointMake(CGRectGetMinX(group) + 0.57907 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.58552 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38644 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58263 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.39089 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58552 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38890 * CGRectGetHeight(group))];
        [forma1Path addCurveToPoint: CGPointMake(CGRectGetMinX(group) + 0.57907 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group)) controlPoint1: CGPointMake(CGRectGetMinX(group) + 0.58552 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38397 * CGRectGetHeight(group)) controlPoint2: CGPointMake(CGRectGetMinX(group) + 0.58263 * CGRectGetWidth(group), CGRectGetMinY(group) + 0.38198 * CGRectGetHeight(group))];
        [forma1Path closePath];
        [color4 setFill];
        [forma1Path fill];
    }
}

@end
