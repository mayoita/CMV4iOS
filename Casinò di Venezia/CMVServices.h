//
//  CMVServices.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 02/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CMVServices : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *everyDay;
@property (weak, nonatomic) IBOutlet UILabel *fromMestre;
@property (weak, nonatomic) IBOutlet UILabel *fromCaNoghera;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextView *note;
@property (weak, nonatomic) IBOutlet UIView *headerView;

@property (nonatomic, strong) NSMutableArray *times;

@end

