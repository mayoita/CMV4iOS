//
//  CMVFreeBoat.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 02/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVFreeBoat.h"
#import "UIViewController+ECSlidingViewController.h"

#import "CMVCloseButton.h"
#import "CMVConstants.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "GAI.h"


@interface CMVFreeBoat ()

@property (weak, nonatomic) IBOutlet UILabel *freeBoat;
@property (weak, nonatomic) IBOutlet CMVCloseButton *closeButton;
@end

@implementation CMVFreeBoat

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (iPHONE ) {
        self.freeBoat.font=GOTHAM_XLight(20);
        
    } else {
        self.freeBoat.font=GOTHAM_XLight(30);
        
    }

 
    self.closeButton.color=[UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"FreeBoatInfoCN";
    } else {
        value=@"FreeBoatInfoVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}


- (IBAction)closeController:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
}

- (IBAction)openMenu:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}
@end
