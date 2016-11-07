//
//  CMVLogInViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 11/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSwipeViewController.h"


@interface CMVLogInViewController : CMVSwipeViewController <NSURLConnectionDelegate>
@property (nonatomic, strong) IBOutlet UILabel *welcomeLabel;
@property (nonatomic, strong) IBOutlet UILabel *birthdayLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *vip;

@property (nonatomic, strong) NSArray *rowTitleArray;
@property (nonatomic, strong) NSMutableArray *rowDataArray;
@property (nonatomic, strong) NSMutableData *imageData;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UIImageView *badge;



@end
