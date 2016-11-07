//
//  CMVStaticGameCell.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 02/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMVStaticGameCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *gameTitle;
@property (weak, nonatomic) IBOutlet UILabel *gameTitleInside;

@property (weak, nonatomic) IBOutlet UIImageView *gameImage;
@property (weak, nonatomic) IBOutlet UIView *arrowSx;
@property (weak, nonatomic) IBOutlet UIView *arrowDx;
@end
