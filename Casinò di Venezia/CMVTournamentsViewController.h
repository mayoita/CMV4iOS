//
//  CMVTournamentsViewController.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 14/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMVSwipeTableViewCell.h"
#import "CMVGameSplitViewController.h"
#import "CMVCloseButton.h"
#import "CMVShare.h"
#import "AAShareBubbles.h"
#import "CMVArrowSx.h"
#import "CMVArrow.h"
#import "CMVSharedButton.h"
#import "TournamentFireBase.h"


@interface CMVTournamentsViewController : UIViewController <SubstitutableDetailViewController,AAShareBubblesDelegate,UITableViewDataSource, UITableViewDelegate>
@property(strong,nonatomic)CMVSwipeTableViewCell *cell;
@property (strong,nonatomic)NSArray *dataSourceItems;
@property (strong,nonatomic)TournamentFireBase *dataSourceItemsWithRules;

@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UITextView *textView;

/// SubstitutableDetailViewController
@property (nonatomic, strong) UIBarButtonItem *navigationPaneBarButtonItem;

@property (strong, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet CMVCloseButton *closeButton;
@property (weak, nonatomic) IBOutlet CMVSharedButton *shareButton;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet CMVArrowSx *arrowSx;
@property (weak, nonatomic) IBOutlet CMVArrow *arrowDx;

@property (weak, nonatomic) IBOutlet UILabel *nomeTorneo;
@property (weak, nonatomic) IBOutlet UITextView *noteGenerali;
-(void)selectedTournament:(TournamentFireBase *)newTournament;

@end
