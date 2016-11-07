//
//  CMVPokerHourCellNew.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 15/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CMVPokerCellBackgroundGrey.h"

@interface CMVPokerHourCellNew : UITableViewCell
@property (weak, nonatomic) IBOutlet CMVPokerCellBackgroundGrey *torneo;
@property (weak, nonatomic) IBOutlet UILabel *ora;
@property (weak, nonatomic) IBOutlet UILabel *round;
@property (weak, nonatomic) IBOutlet UILabel *buyin;
@property (weak, nonatomic) IBOutlet UILabel *stack;
@property (weak, nonatomic) IBOutlet UILabel *blinds;
@property (weak, nonatomic) IBOutlet UILabel *late;
@property (weak, nonatomic) IBOutlet UILabel *cap;
@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet CMVPokerCellBackgroundGrey *torneoLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyinLabel;
@property (weak, nonatomic) IBOutlet UILabel *stackLabel;
@property (weak, nonatomic) IBOutlet UILabel *blindsLabel;
@property (weak, nonatomic) IBOutlet UILabel *lateLabel;
@property (weak, nonatomic) IBOutlet UILabel *capLabel;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;

@end
