//
//  CMVGameViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 06/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "KIImagePager.h"
#import "CMVGameSplitViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "iCarousel.h"
#import "CMVEventViewController.h"



@interface CMVGameViewController : UIViewController <SubstitutableDetailViewController, AVSpeechSynthesizerDelegate,iCarouselDataSource, iCarouselDelegate>



@property (weak, nonatomic) IBOutlet UIButton *speechButton;
@property (strong,nonatomic)NSArray *dataForGame;

/// SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;

@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (strong, nonatomic)NSString *descriptionText;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (nonatomic)NSInteger indexForGame;
@property (weak, nonatomic) IBOutlet iCarousel *carousel;

@property (nonatomic,strong) CMVEventViewController *eventDelegate;
@property (nonatomic)BOOL showCarousel;
@end
