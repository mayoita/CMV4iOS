//
//  CMVMenuRestaurantViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 25/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RPSlidingMenu.h"

@interface CMVMenuRestaurantViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *chiefImage;
@property (weak, nonatomic) IBOutlet UILabel *chiefName;
@property (weak, nonatomic) IBOutlet UILabel *fromTo;
@property(nonatomic)int office;
@end
