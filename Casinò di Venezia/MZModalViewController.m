//
//  MZModalViewController.m
//  Xcode5Example
//
//  Created by Michał Zaborowski on 13.08.2013.
//  Copyright (c) 2013 Michał Zaborowski. All rights reserved.
//

#import "MZModalViewController.h"

@interface MZModalViewController ()

@end

@implementation MZModalViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    
	
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"RestaurantInfoCN";
    } else {
        value=@"RestaurantInfoVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

}

@end
