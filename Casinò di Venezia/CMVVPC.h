//
//  CMVVPC.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 24/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVSwipeViewController.h"

@interface CMVVPC : CMVSwipeViewController
@property (strong,nonatomic) NSArray *dataSource;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UILabel *euro;
@property (weak, nonatomic) IBOutlet UILabel *standings;
@property (nonatomic, strong) NSMutableArray *winners;

@end
