//
//  CMVCellVPC.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 27/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMVCellVPC : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *position;
@property (weak, nonatomic) IBOutlet UILabel *player;

@property (weak, nonatomic) IBOutlet UILabel *point;
@end
