//
//  CMVSingleGameViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 12/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVTable.h"
#import "CMVGameSplitViewController.h"
#import "CMVArrow.h"
#import "CMVArrowSx.h"
#import <AVFoundation/AVFoundation.h>
#import "CMVShadovImage.h"

@interface CMVSingleGameViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SubstitutableDetailViewController, AVSpeechSynthesizerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (strong,nonatomic)NSArray *dataForGame;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet CMVArrowSx *ArrowSx;
@property (weak, nonatomic) IBOutlet CMVArrow *ArrowDx;

@property (weak, nonatomic) IBOutlet UITextView *textView;

/// SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UILabel *gameName;
@property (nonatomic)NSInteger indexForGame;
@property (weak, nonatomic) IBOutlet UILabel *noImage;

@property (weak, nonatomic) IBOutlet UIButton *readDescription;
@property (nonatomic)BOOL talking;
@property (weak, nonatomic) IBOutlet CMVShadovImage *myShadowImage;


-(void)openLargeImage;
-(void)setUpGame;
@end
