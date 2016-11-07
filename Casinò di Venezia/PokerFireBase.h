//
//  PokerFireBase.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/09/16.
//  Copyright © 2016 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PokerFireBase : NSObject
@property (nonatomic, strong) NSString *TournamentName;
@property (nonatomic, strong) NSDate *StartDate;
@property (nonatomic, strong) NSDate *EndDate;
@property (nonatomic, strong) NSString *PokerData;
@property (nonatomic, strong) NSString *TournamentDate;
@property (nonatomic, strong) NSString *TournamentDescription;
@property (nonatomic, strong) NSString *TournamentEvent;
@property (nonatomic, strong) NSString *TournamentRules;
@property (nonatomic, strong) NSString *office;
@property (nonatomic, strong) NSString *TournamentURL;
@property (nonatomic, strong)UITableView *theTableView;

@end
