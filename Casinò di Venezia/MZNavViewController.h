//
//  MZNavViewController.h
//  MZFormSheetControllerExample
//
//  Created by Michał Zaborowski on 09.08.2013.
//  Copyright (c) 2013 Michał Zaborowski. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZNavViewController : UITableViewController
@property (strong,nonatomic)NSArray *dataSourceForFeatures;
@property(strong,nonatomic)NSString *title;
@end
