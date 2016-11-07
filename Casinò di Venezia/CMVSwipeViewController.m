//
//  CMVSwipeViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 09/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSwipeViewController.h"
#import "UIViewController+ECSlidingViewController.h"

@interface CMVSwipeViewController ()

@end

@implementation CMVSwipeViewController

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
	
    
    self.view.layer.shadowOpacity=0.75f;
    self.view.layer.shadowRadius=10.0f;
    self.view.layer.shadowColor=[UIColor blackColor].CGColor;
    
    [self.view addGestureRecognizer:self.slidingViewController.panGesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
