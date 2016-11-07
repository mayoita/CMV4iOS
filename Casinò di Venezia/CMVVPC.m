//
//  CMVVPC.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 24/01/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVVPC.h"
#import "UIViewController+ECSlidingViewController.h"
#import "CMVCellVPC.h"
#import "CMVAppDelegate.h"
#import "CMVSetUpCurrency.h"


#define cellIdentifier @"VPCCell"
#define subArrayWithEuro 0
#define subArrayWithPlayer 1
#define players 0
#define points 1
#define rates 0.7240;

@interface CMVVPC ()
@property (strong, nonatomic)UIRefreshControl *refreshControl;
@property(strong,nonatomic)CMVSetUpCurrency *checkCurrency;
@end

@implementation CMVVPC
static NSNumberFormatter *sUserVisibleDateFormatter = nil;
@synthesize winners=_winners;


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

    
    UIRefreshControl *refresh = [[UIRefreshControl alloc] init];
    self.refreshControl=refresh;
    refresh.attributedTitle = [[NSAttributedString alloc] initWithString:@"Pull to Refresh"];
    
    [self.tableView addSubview:refresh];
    
    [refresh addTarget:self action:@selector(reloadTableData) forControlEvents:UIControlEventValueChanged];
    
	
    if (iPHONE) {
        [self.tableView registerNib:[UINib nibWithNibName:@"VPCCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    } else {
        [self.tableView registerNib:[UINib nibWithNibName:@"VPCCelliPad" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    }
    self.checkCurrency=[[CMVSetUpCurrency alloc] init];
    self.euro.text=[self getPrize];
    [self.checkCurrency exchangeRates];
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"VPCStandings"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

-(NSString *)getPrize {
    static NSString *prize=@"";
  //  AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
    
 //   [[dynamoDBObjectMapper load:[VPCPrize class] hashKey:@"1" rangeKey:nil]
 //    continueWithBlock:^id(AWSTask *task) {
 //        if (task.error) {
 //            NSLog(@"The request failed. Error: [%@]", task.error);
 //        }
 //        if (task.exception) {
 //            NSLog(@"The request failed. Exception: [%@]", task.exception);
 //        }
  //       if (task.result) {
  //           dispatch_async(dispatch_get_main_queue(), ^{
 //            VPCPrize *prize = task.result;
  //           self.euro.text=prize.Prize;
  //           self.euro.text=[self.checkCurrency setupCurrency:self.euro.text];
  //          NSString *complete = [NSString stringWithFormat:NSLocalizedString(@"Classifica \"Venice Poker Championship\" conclusa al  %@",nil),
   //                                prize.Date];
    //         self.standings.text=complete;
   //          });
   //      }
   //      return nil;
   //  }];
    
    return prize;
}

- (void)reloadTableData {
    
    [self.tableView reloadData];
    [self.refreshControl endRefreshing];
    
}


- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"Request for exchange rates failed!");
}

-(NSMutableArray *)winners {
    if (!_winners) {
        _winners = [NSMutableArray array];
   //     AWSDynamoDBObjectMapper *dynamoDBObjectMapper = [AWSDynamoDBObjectMapper defaultDynamoDBObjectMapper];
        
        //DynamoScan
     //   AWSDynamoDBScanExpression *scanExpression = [AWSDynamoDBScanExpression new];
     //   scanExpression.limit = @50;
        
     //   [[dynamoDBObjectMapper scan:[VPC class]
     //                    expression:scanExpression]
    //     continueWithBlock:^id(AWSTask *task) {
    //         if (task.error) {
    //             NSLog(@"The request failed. Error: [%@]", task.error);
     //        }
     //        if (task.exception) {
     //            NSLog(@"The request failed. Exception: [%@]", task.exception);
      //       }
      //       if (task.result) {
      //           AWSDynamoDBPaginatedOutput *paginatedOutput = task.result;
      //           if ([_winners count] == 0) {
      //           for (VPC *event in paginatedOutput.items) {
                     
     //                [_winners addObject:event];
                     
      //           }
      //               NSSortDescriptor *sortDescriptor;
       //              sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"Points"
       //                                                           ascending:NO];
       //              NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
       //              NSArray *sortedArray = [_winners sortedArrayUsingDescriptors:sortDescriptors];
       //              _winners = sortedArray;
       //              [self.tableView reloadData];
       //          }
       //      }
      //       return nil;
      //   }];
 
    }
    
    return _winners;
}

-(void)orderWinnersArray {
    
}


#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.winners count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
   CMVCellVPC *cell = (CMVCellVPC *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
  //  VPC *object=self.winners[indexPath.row];
    
    
    cell.position.text=[NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
    
 //   cell.player.text=object.Name;
    
 //   cell.point.text=object.Points; //[self userVisibleNumberString:object[@"Points"]];
    
    return cell;
}

- (NSString *)userVisibleNumberString:(NSString *)numberString {

    // If the number formatters aren't already set up, create them and cache them for reuse.
    static NSNumberFormatter *numberFormatter = nil;
    if (numberFormatter == nil) {
        numberFormatter = [[NSNumberFormatter alloc] init];
        //NSLocale *enUSPOSIXLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
         NSLocale *locale = [NSLocale currentLocale];
        
        [numberFormatter setLocale:locale];
        [numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];
    
    }

    
    NSString *userVisiblenumerString =[numberFormatter stringFromNumber:[NSNumber numberWithInt:[numberString intValue]]];

    return userVisiblenumerString;
}
- (IBAction)openMenu:(id)sender {
   [self.slidingViewController anchorTopViewToRightAnimated:YES];
}



@end
