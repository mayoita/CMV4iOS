//
//  CMVMailChimp.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 27/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChimpKit.h"
#import "CMVSwipeViewController.h"

@interface CMVMailChimp : CMVSwipeViewController<ChimpKitRequestDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *myName;
@property (weak, nonatomic) IBOutlet UITextField *myEmail;
@property (weak, nonatomic) IBOutlet UITextField *myLastName;
@property (weak, nonatomic) IBOutlet UILabel *labelEmail;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelLast;
@property (weak, nonatomic) IBOutlet UILabel *labelYes;
@property (weak, nonatomic) IBOutlet UILabel *labelConfirm;
@property (weak, nonatomic) IBOutlet UILabel *labelAllow;

@end
