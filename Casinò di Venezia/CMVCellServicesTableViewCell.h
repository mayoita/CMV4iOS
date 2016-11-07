//
//  CMVCellServicesTableViewCell.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 17/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBShimmeringView.h"
#import "CMVShimmerLabel.h"

@interface CMVCellServicesTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftTextLabel;
@property (weak, nonatomic) IBOutlet FBShimmeringView *leftImage;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightTextLabel;
@property (weak, nonatomic) IBOutlet FBShimmeringView *rightImage;



@end
