//
//  CMVNewsletter.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 09/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVNewsletter.h"
#import "ECSlidingViewController.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"

@interface CMVNewsletter ()

@end

@implementation CMVNewsletter

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"Subscribe" withExtension:@"html"];

    [self.newsletterWebView loadRequest:[NSURLRequest requestWithURL:url]];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Newsletter"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];

}

- (IBAction)openMenu:(id)sender {
    // [self.slidingViewController anchorTopViewTo:ECRight];
}

@end
