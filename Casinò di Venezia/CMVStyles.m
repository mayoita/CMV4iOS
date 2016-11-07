//
//  CMVStyles.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVStyles.h"

@implementation CMVStyles
-(NSDictionary *)firstAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: [UIColor whiteColor],
                 NSFontAttributeName:GOTHAM_Medium(14),
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
        //TODO: 
    
    } else {
        return @{NSForegroundColorAttributeName: [UIColor whiteColor],
                 NSFontAttributeName:GOTHAM_Medium(18),
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    }
    
}

-(NSDictionary *)secondAttributes {
    NSMutableParagraphStyle *mutParaStyleCenter=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleCenter setAlignment:NSTextAlignmentJustified];
    
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowBlurRadius:1.0];
    [shadowDic setShadowColor:[UIColor blackColor]];
    [shadowDic setShadowOffset:CGSizeMake(0, 1)];
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: BRAND_YELLOW_COLOR,
                 NSFontAttributeName:GOTHAM_Medium(18),
                 NSShadowAttributeName:shadowDic,
                 NSParagraphStyleAttributeName:mutParaStyleCenter};
    } else {
        return @{NSForegroundColorAttributeName: BRAND_YELLOW_COLOR,
                 NSFontAttributeName:GOTHAM_Medium(22),
                 NSShadowAttributeName:shadowDic,
                 NSParagraphStyleAttributeName:mutParaStyleCenter};
    }
    
    
}

-(NSDictionary *)thirdAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: [UIColor redColor],
                 NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT size:GAME_TEXT_SIZE],
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    } else {
        return @{NSForegroundColorAttributeName: [UIColor redColor],
                 NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT_IPAD size:GAME_TEXT_SIZE_IPAD],
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    }
    
}

-(NSDictionary *)fourthAttributes {
    NSMutableParagraphStyle *mutParaStyleJustified=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleJustified setAlignment:NSTextAlignmentJustified];
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT size:GAME_TEXT_SIZE],
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    } else {
        return @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName:[UIFont fontWithName:GAME_TEXT_FONT_IPAD size:GAME_TEXT_SIZE_IPAD],
                 NSParagraphStyleAttributeName:mutParaStyleJustified};
    }
    
}

-(NSDictionary *)firstAttributesInfo {
    NSMutableParagraphStyle *mutParaStyleLeft=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleLeft setAlignment:NSTextAlignmentLeft];
    
    NSShadow *shadowDic=[[NSShadow alloc] init];
    [shadowDic setShadowBlurRadius:1.0];
    [shadowDic setShadowColor:[UIColor blackColor]];
    [shadowDic setShadowOffset:CGSizeMake(0, 1)];
    
   
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName:[UIFont fontWithName:RESTAURANT_INFO_FONT_LABEL size:RESTAURANT_INFO_SIZE_LABEL],
                 NSParagraphStyleAttributeName:mutParaStyleLeft};
    } else {
        return @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName:[UIFont fontWithName:RESTAURANT_INFO_FONT_LABEL_IPAD size:RESTAURANT_INFO_SIZE_LABEL_IPAD],
                 NSParagraphStyleAttributeName:mutParaStyleLeft};
    }
}



-(NSDictionary *)secondAttributesInfo {
    NSMutableParagraphStyle *mutParaStyleLeft=[[NSMutableParagraphStyle alloc] init];
    [mutParaStyleLeft setAlignment:NSTextAlignmentLeft];
    
    
    if (iPHONE) {
        return @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName:[UIFont fontWithName:RESTAURANT_INFO_FONT_TEXT size:RESTAURANT_INFO_SIZE_TEXT],
                 NSParagraphStyleAttributeName:mutParaStyleLeft};
    } else {
        return @{NSForegroundColorAttributeName: [UIColor blackColor],
                 NSFontAttributeName:[UIFont fontWithName:RESTAURANT_INFO_FONT_TEXT_IPAD size:RESTAURANT_INFO_SIZE_TEXT_IPAD],
                 NSParagraphStyleAttributeName:mutParaStyleLeft};
    }
}
@end
