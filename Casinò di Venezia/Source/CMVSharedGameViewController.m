//
//  CMVSharedGameViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSharedGameViewController.h"
#import "CMVStaticGameCell.h"
#import "CMVGameViewController.h"
#import "CMVInfoViewController.h"

#define cellIdentifier @"StaticGame"
#define Picture 1
#define Description 0
#define ROW_HEIGHT 154

@interface CMVSharedGameViewController ()

@end

@implementation CMVSharedGameViewController

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
	
    [self.tableView registerNib:[UINib nibWithNibName:@"CMVStaticGame" bundle:nil]
         forCellReuseIdentifier:cellIdentifier];
    
    // Makes the horizontal row seperator stretch the entire length of the table view
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    //Delegate for iPad split controller
    self.gameDelegate=(CMVGameViewController *)[self.splitViewController.viewControllers lastObject];
    self.tableView.rowHeight = ROW_HEIGHT;
    self.tableView.backgroundColor=[UIColor clearColor];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return ROW_HEIGHT;
}

@end
