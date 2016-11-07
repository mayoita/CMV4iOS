//
//  CMVBarCode.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVBarCode.h"

@implementation CMVBarCode


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    CGRect frame = rect;
    //// Rectangle Drawing
    UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.00000 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.01058 + 0.5) - floor(CGRectGetHeight(frame) * 0.00000 + 0.5))];
    [UIColor.blackColor setFill];
    [rectanglePath fill];
    
    
    //// Rectangle 2 Drawing
    UIBezierPath* rectangle2Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.10053 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.11111 + 0.5) - floor(CGRectGetHeight(frame) * 0.10053 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle2Path fill];
    
    
    //// Rectangle 3 Drawing
    UIBezierPath* rectangle3Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.13757 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.14815 + 0.5) - floor(CGRectGetHeight(frame) * 0.13757 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle3Path fill];
    
    
    //// Rectangle 4 Drawing
    UIBezierPath* rectangle4Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.20635 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.21693 + 0.5) - floor(CGRectGetHeight(frame) * 0.20635 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle4Path fill];
    
    
    //// Rectangle 5 Drawing
    UIBezierPath* rectangle5Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.23280 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.24339 + 0.5) - floor(CGRectGetHeight(frame) * 0.23280 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle5Path fill];
    
    
    //// Rectangle 6 Drawing
    UIBezierPath* rectangle6Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.33333 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.34392 + 0.5) - floor(CGRectGetHeight(frame) * 0.33333 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle6Path fill];
    
    
    //// Rectangle 7 Drawing
    UIBezierPath* rectangle7Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.38624 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.39683 + 0.5) - floor(CGRectGetHeight(frame) * 0.38624 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle7Path fill];
    
    
    //// Rectangle 8 Drawing
    UIBezierPath* rectangle8Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.42328 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.43386 + 0.5) - floor(CGRectGetHeight(frame) * 0.42328 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle8Path fill];
    
    
    //// Rectangle 9 Drawing
    UIBezierPath* rectangle9Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.48148 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.49206 + 0.5) - floor(CGRectGetHeight(frame) * 0.48148 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle9Path fill];
    
    
    //// Rectangle 10 Drawing
    UIBezierPath* rectangle10Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.52381 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.53439 + 0.5) - floor(CGRectGetHeight(frame) * 0.52381 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle10Path fill];
    
    
    //// Rectangle 11 Drawing
    UIBezierPath* rectangle11Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.58201 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.59259 + 0.5) - floor(CGRectGetHeight(frame) * 0.58201 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle11Path fill];
    
    
    //// Rectangle 12 Drawing
    UIBezierPath* rectangle12Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.68254 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.69312 + 0.5) - floor(CGRectGetHeight(frame) * 0.68254 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle12Path fill];
    
    
    //// Rectangle 13 Drawing
    UIBezierPath* rectangle13Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.82540 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.83598 + 0.5) - floor(CGRectGetHeight(frame) * 0.82540 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle13Path fill];
    
    
    //// Rectangle 14 Drawing
    UIBezierPath* rectangle14Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.91534 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.92593 + 0.5) - floor(CGRectGetHeight(frame) * 0.91534 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle14Path fill];
    
    
    //// Rectangle 15 Drawing
    UIBezierPath* rectangle15Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.93122 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.94180 + 0.5) - floor(CGRectGetHeight(frame) * 0.93122 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle15Path fill];
    
    
    //// Rectangle 16 Drawing
    UIBezierPath* rectangle16Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.98942 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 1.00000 + 0.5) - floor(CGRectGetHeight(frame) * 0.98942 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle16Path fill];
    
    
    //// Rectangle 17 Drawing
    UIBezierPath* rectangle17Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.95767 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.97354 + 0.5) - floor(CGRectGetHeight(frame) * 0.95767 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle17Path fill];
    
    
    //// Rectangle 18 Drawing
    UIBezierPath* rectangle18Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.88889 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.90476 + 0.5) - floor(CGRectGetHeight(frame) * 0.88889 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle18Path fill];
    
    
    //// Rectangle 19 Drawing
    UIBezierPath* rectangle19Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.75661 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.76720 + 0.5) - floor(CGRectGetHeight(frame) * 0.75661 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle19Path fill];
    
    
    //// Rectangle 20 Drawing
    UIBezierPath* rectangle20Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.70899 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.72487 + 0.5) - floor(CGRectGetHeight(frame) * 0.70899 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle20Path fill];
    
    
    //// Rectangle 21 Drawing
    UIBezierPath* rectangle21Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.65608 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.67196 + 0.5) - floor(CGRectGetHeight(frame) * 0.65608 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle21Path fill];
    
    
    //// Rectangle 22 Drawing
    UIBezierPath* rectangle22Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.59788 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.61376 + 0.5) - floor(CGRectGetHeight(frame) * 0.59788 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle22Path fill];
    
    
    //// Rectangle 23 Drawing
    UIBezierPath* rectangle23Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.54497 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.56085 + 0.5) - floor(CGRectGetHeight(frame) * 0.54497 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle23Path fill];
    
    
    //// Rectangle 24 Drawing
    UIBezierPath* rectangle24Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.49735 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.51323 + 0.5) - floor(CGRectGetHeight(frame) * 0.49735 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle24Path fill];
    
    
    //// Rectangle 25 Drawing
    UIBezierPath* rectangle25Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.43915 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.45503 + 0.5) - floor(CGRectGetHeight(frame) * 0.43915 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle25Path fill];
    
    
    //// Rectangle 26 Drawing
    UIBezierPath* rectangle26Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.34921 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.36508 + 0.5) - floor(CGRectGetHeight(frame) * 0.34921 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle26Path fill];
    
    
    //// Rectangle 27 Drawing
    UIBezierPath* rectangle27Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.30688 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.32275 + 0.5) - floor(CGRectGetHeight(frame) * 0.30688 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle27Path fill];
    
    
    //// Rectangle 28 Drawing
    UIBezierPath* rectangle28Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.24868 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.26455 + 0.5) - floor(CGRectGetHeight(frame) * 0.24868 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle28Path fill];
    
    
    //// Rectangle 29 Drawing
    UIBezierPath* rectangle29Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.05820 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.07407 + 0.5) - floor(CGRectGetHeight(frame) * 0.05820 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle29Path fill];
    
    
    //// Rectangle 30 Drawing
    UIBezierPath* rectangle30Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.01587 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.02116 + 0.5) - floor(CGRectGetHeight(frame) * 0.01587 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle30Path fill];
    
    
    //// Rectangle 31 Drawing
    UIBezierPath* rectangle31Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.03175 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.03704 + 0.5) - floor(CGRectGetHeight(frame) * 0.03175 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle31Path fill];
    
    
    //// Rectangle 32 Drawing
    UIBezierPath* rectangle32Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.07937 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.08466 + 0.5) - floor(CGRectGetHeight(frame) * 0.07937 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle32Path fill];
    
    
    //// Rectangle 33 Drawing
    UIBezierPath* rectangle33Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.11640 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.12169 + 0.5) - floor(CGRectGetHeight(frame) * 0.11640 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle33Path fill];
    
    
    //// Rectangle 34 Drawing
    UIBezierPath* rectangle34Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.16402 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.16931 + 0.5) - floor(CGRectGetHeight(frame) * 0.16402 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle34Path fill];
    
    
    //// Rectangle 35 Drawing
    UIBezierPath* rectangle35Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.17460 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.17989 + 0.5) - floor(CGRectGetHeight(frame) * 0.17460 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle35Path fill];
    
    
    //// Rectangle 36 Drawing
    UIBezierPath* rectangle36Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.19577 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.20106 + 0.5) - floor(CGRectGetHeight(frame) * 0.19577 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle36Path fill];
    
    
    //// Rectangle 37 Drawing
    UIBezierPath* rectangle37Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.27513 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.28042 + 0.5) - floor(CGRectGetHeight(frame) * 0.27513 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle37Path fill];
    
    
    //// Rectangle 38 Drawing
    UIBezierPath* rectangle38Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.29101 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.29630 + 0.5) - floor(CGRectGetHeight(frame) * 0.29101 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle38Path fill];
    
    
    //// Rectangle 39 Drawing
    UIBezierPath* rectangle39Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.37566 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.38095 + 0.5) - floor(CGRectGetHeight(frame) * 0.37566 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle39Path fill];
    
    
    //// Rectangle 40 Drawing
    UIBezierPath* rectangle40Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.40741 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.41270 + 0.5) - floor(CGRectGetHeight(frame) * 0.40741 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle40Path fill];
    
    
    //// Rectangle 41 Drawing
    UIBezierPath* rectangle41Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.46561 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.47090 + 0.5) - floor(CGRectGetHeight(frame) * 0.46561 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle41Path fill];
    
    
    //// Rectangle 42 Drawing
    UIBezierPath* rectangle42Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.57143 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.57672 + 0.5) - floor(CGRectGetHeight(frame) * 0.57143 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle42Path fill];
    
    
    //// Rectangle 43 Drawing
    UIBezierPath* rectangle43Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.61905 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.62434 + 0.5) - floor(CGRectGetHeight(frame) * 0.61905 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle43Path fill];
    
    
    //// Rectangle 44 Drawing
    UIBezierPath* rectangle44Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.64021 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.64550 + 0.5) - floor(CGRectGetHeight(frame) * 0.64021 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle44Path fill];
    
    
    //// Rectangle 45 Drawing
    UIBezierPath* rectangle45Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.69841 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.70370 + 0.5) - floor(CGRectGetHeight(frame) * 0.69841 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle45Path fill];
    
    
    //// Rectangle 46 Drawing
    UIBezierPath* rectangle46Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.77778 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.78307 + 0.5) - floor(CGRectGetHeight(frame) * 0.77778 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle46Path fill];
    
    
    //// Rectangle 47 Drawing
    UIBezierPath* rectangle47Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.79365 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.79894 + 0.5) - floor(CGRectGetHeight(frame) * 0.79365 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle47Path fill];
    
    
    //// Rectangle 48 Drawing
    UIBezierPath* rectangle48Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.81481 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.82011 + 0.5) - floor(CGRectGetHeight(frame) * 0.81481 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle48Path fill];
    
    
    //// Rectangle 49 Drawing
    UIBezierPath* rectangle49Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.85185 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.85714 + 0.5) - floor(CGRectGetHeight(frame) * 0.85185 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle49Path fill];
    
    
    //// Rectangle 50 Drawing
    UIBezierPath* rectangle50Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.87302 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.87831 + 0.5) - floor(CGRectGetHeight(frame) * 0.87302 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle50Path fill];
    
    
    //// Rectangle 51 Drawing
    UIBezierPath* rectangle51Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.97884 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.98413 + 0.5) - floor(CGRectGetHeight(frame) * 0.97884 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle51Path fill];
    
    
    //// Rectangle 52 Drawing
    UIBezierPath* rectangle52Path = [UIBezierPath bezierPathWithRect: CGRectMake(CGRectGetMinX(frame), CGRectGetMinY(frame) + floor(CGRectGetHeight(frame) * 0.73016 + 0.5), CGRectGetWidth(frame), floor(CGRectGetHeight(frame) * 0.75132 + 0.5) - floor(CGRectGetHeight(frame) * 0.73016 + 0.5))];
    [UIColor.blackColor setFill];
    [rectangle52Path fill];
}


@end
