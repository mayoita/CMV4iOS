//
//  CMVTournamentCellNew.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMVTournamentCellNew : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *torneo;
@property (weak, nonatomic) IBOutlet UILabel *ora;
@property (weak, nonatomic) IBOutlet UILabel *round;
@property (weak, nonatomic) IBOutlet UILabel *buyin;
@property (weak, nonatomic) IBOutlet UILabel *note;
@property (weak, nonatomic) IBOutlet UILabel *noteLabel;
@property (weak, nonatomic) IBOutlet UILabel *buyinLabel;
@property (weak, nonatomic) IBOutlet UILabel *oraLabel;
@property (weak, nonatomic) IBOutlet UILabel *torneoLabel;

@end
