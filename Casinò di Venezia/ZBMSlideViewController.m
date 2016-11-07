//
//  ZBMSlideViewController.m
//  ZerobaseMobile
//
//  Created by Massimo Moro on 10/06/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import "ZBMSlideViewController.h"


@implementation ZBMSlideViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	

    
    UIStoryboard *storyboard;
    
    if (iPHONE) {
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
    } else if (iPAD) {
        storyboard = [UIStoryboard storyboardWithName:@"Main_iPad" bundle:nil];
    }
    
    self.topViewController = [storyboard instantiateViewControllerWithIdentifier:@"Main"];
    
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}


@end
