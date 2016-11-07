//
//  CMVCellServicesTableViewCell.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVCellServicesTableViewCell.h"
#import "CMVShimmerLabel.h"

@implementation CMVCellServicesTableViewCell

- (void)awakeFromNib
{
//    UIImage *myBg=[UIImage imageNamed:@"TimetableCell"];
//    
//    self.backgroundColor=[UIColor colorWithPatternImage:myBg];
        CMVShimmerLabel *labelL=[[CMVShimmerLabel alloc] initWithFrame:self.leftImage.bounds];
        labelL.font=GOTHAM_BOOK(16);
        labelL.textAlignment=NSTextAlignmentCenter;
        labelL.numberOfLines=0;
        labelL.minimumScaleFactor=0.5;
        labelL.adjustsFontSizeToFitWidth = YES;
        self.leftImage.contentView=labelL;
        self.leftLabel.font=GOTHAM_BOOK(18);
        self.rightLabel.font=GOTHAM_BOOK(18);
    
        CMVShimmerLabel *labelR=[[CMVShimmerLabel alloc] initWithFrame:self.leftImage.bounds];
        labelR.font=GOTHAM_BOOK(16);
        labelR.textAlignment=NSTextAlignmentCenter;
        labelR.numberOfLines=0;
        labelR.minimumScaleFactor=0.5;
        labelR.adjustsFontSizeToFitWidth = YES;
    
        self.rightImage.contentView=labelR;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        labelL.textColor=BRAND_GREEN_COLOR;
        labelR.textColor=BRAND_GREEN_COLOR;
    } else {
        labelL.textColor=[UIColor blackColor];
        labelR.textColor=[UIColor blackColor];
    }
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
