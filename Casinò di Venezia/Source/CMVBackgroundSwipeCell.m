//
//  CMVBackgroundSwipeCell.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 03/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVBackgroundSwipeCell.h"

@implementation CMVBackgroundSwipeCell

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
    self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundGame.png"]];
    return self;
}




@end
