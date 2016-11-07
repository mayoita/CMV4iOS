//
//  CMVGameTableViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 02/12/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVGameTableViewController.h"
#import "CMVStaticGameCell.h"
#import "CMVGameViewController.h"
#import "CMVInfoViewController.h"
#import "CMVSingleGameViewController.h"
#import "UIViewController+ECSlidingViewController.h"
#import "TTViewController.h"
#import "CMVAppDelegate.h"
#import "CMVGameSplitViewController.h"
#import "CMVSharedClass.h"
#import "CMVTextForGame.h"
#import "CMVBackButton.h"


#define cellIdentifier @"StaticGame"
#define Picture 1
#define Description 0
#define Category 0
#define MaxEdgeLeftTouchZone 20.0f
#define MinEdgeRightTouchZone 300.0f
#define RootForFirstLevel 2
#define OnLine 2
#define VE 2
#define CN 3
#define PARSE_CLASS_NAME @"Events"
#define EVENTS_INDEX 0
#define BackButtonOffset 50
#define BackButtonOffsetSplit 120
#define AspectRatioCell 0.48


@interface CMVGameTableViewController ()

@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong)NSTimer *tapTimer;
@property (nonatomic,strong)CMVDataClass *site;
@property (strong,nonatomic)CMVBackButton *backButton;
@end

@implementation CMVGameTableViewController

int level;
int tapCount;
int tappedRow;
int GameType;
int Office;
float coordY;

CGPoint touchPoint;


-(void)viewDidLoad{
    [super viewDidLoad];
    self.site=[CMVDataClass getInstance];
    level=0;

//    if (iPHONE) {
//    coordY = [UIScreen mainScreen].bounds.size.height > 480.0f ? 395.0f : 303.0f;
//    } else {
//         coordY = [UIScreen mainScreen].bounds.size.height - BackButtonOffset;
//    }
    CMVBackButton *backButton=[[CMVBackButton alloc] initWithFrame:CGRectMake(10, coordY, 50, 50)];
    backButton.backgroundColor=[UIColor clearColor];
    self.backButton=backButton;
    self.backButton.hidden=YES;
     UITapGestureRecognizer *buttonBack = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(buttonBackCaptured:)];
    [backButton addGestureRecognizer:buttonBack];
    [self.view addSubview:backButton];
    
    [self setupDataSource];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    // Initialize the filteredCandyArray with a capacity equal to the dataSource capacity
    _filteredGameArray = [NSMutableArray arrayWithCapacity:[self.dataSource count]];
    
    // Reload the table
    [[self tableView] reloadData];
    
    //trick to recognize touch point in table view cell
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    singleTap.cancelsTouchesInView = NO;
    
    [self.tableView addGestureRecognizer:singleTap];

    [self setOffice];
    
    self.singleGameDelegate=(CMVSingleGameViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"SingleGameViewController"];
  
    
    
    if (iPAD) {
        NSLog(@"Table: %@", self.tableView);
        // on iPad only, don't clear the selection (we are displaying in a split view on iPad)
        self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Game_detail_background_long.png"]];
        self.clearsSelectionOnViewWillAppear = NO;
        // default by selecting the first row
        [self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        // configure our detail view controller
        [self configureDetailItemForRow:0 viewController:self.singleGameDelegate];
        self.mainTabBarController = (CMVMainTabbarController *)self.tabBarController;
        int tabNumber = (int)[self.mainTabBarController selectedIndex];
        
        UISplitViewController *splitVC = [[self navigationController] splitViewController];
        int index = (int)[self.mainTabBarController.viewControllers indexOfObjectIdenticalTo:splitVC];
        
        if ( tabNumber == index || tabNumber == -1) {
            [self.mainTabBarController setCenterButtonDelegate:self];
        }
    }
    

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    self.backButton.frame=CGRectMake(self.backButton.frame.origin.x,  scrollView.contentOffset.y + coordY, self.backButton.frame.size.width, self.backButton.frame.size.height);
}

-(void)viewWillAppear:(BOOL)animated {
    UIDeviceOrientation  orientation = [[UIDevice currentDevice] orientation];
    BOOL inLandscape = UIDeviceOrientationIsLandscape(orientation);
    if (inLandscape ) {
        coordY =self.view.frame.size.height - BackButtonOffsetSplit;
    } else {
        if (iPAD) {
            if (self.view.bounds.origin.y == 0) {
                coordY =self.view.frame.size.height - BackButtonOffset;
            } else {
                coordY =self.view.frame.size.height - BackButtonOffset+self.view.bounds.origin.y;
            }
        } else {
       coordY =self.view.frame.size.height - BackButtonOffset;
        }
    }

    self.backButton.frame = CGRectMake(self.backButton.frame.origin.x, coordY, self.backButton.frame.size.width,self.backButton.frame.size.height);
}



-(void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {

    coordY =self.view.frame.size.height - BackButtonOffsetSplit;
    self.backButton.frame = CGRectMake(self.backButton.frame.origin.x, coordY, self.backButton.frame.size.width,self.backButton.frame.size.height);
}

-(void)viewDidAppear:(BOOL)animated {
    
    if (iPAD) {
        [self.mainTabBarController setCenterButtonDelegate:self];
    }
    [self setOffice];
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture {
    
    touchPoint=[gesture locationInView:self.tableView];

}

- (void)buttonBackCaptured:(UITapGestureRecognizer *)gesture {
    
    if (level >0) {
        level-=1;
        [self.tableView reloadData];
    }
    
}

-(void)setupDataSource {
    NSString *plistName = [NSString stringWithFormat:@"GameDBase"];
    NSArray *contentArray = [[NSMutableArray alloc] initWithContentsOfFile:
                             [[NSBundle mainBundle] pathForResource:plistName
                                                             ofType:@"plist"]];
    self.dataSource = contentArray;
    
    
}

#pragma mark Content Filtering

- (void)filterContentForGame:(int)levelOne levelTwo:(int)levelTwo levelThree:(int)levelThree
{
    // Remove all objects from the filtered search array
	[self.filteredGameArray removeAllObjects];
    
	// Filter the array
    _filteredGameArray = [NSMutableArray arrayWithArray:self.dataSource[levelOne][levelTwo][levelThree]];
  
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    if (level == 0) {
    return self.dataSource.count;
    } else {
        return self.filteredGameArray.count;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.view.frame.size.width*AspectRatioCell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CMVStaticGameCell *cell = (CMVStaticGameCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.arrowSx.hidden=YES;
    if (level == 0) {
        self.backButton.hidden=YES;
        cell.gameTitle.text =[self.dataSource objectAtIndex:indexPath.item][Category][Description];
        cell.gameTitleInside.text =[self.dataSource objectAtIndex:indexPath.item][Category][Description];
        cell.gameTitleInside.font=[UIFont fontWithName:@"Gotham-XLight" size:15];

        cell.gameImage.image=[UIImage imageNamed:[self.dataSource objectAtIndex:indexPath.item][Category][Picture]];
        //cell.arrowSx.hidden=YES;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    } else {
        self.backButton.hidden=NO;
        cell.gameTitle.text =[self.filteredGameArray objectAtIndex:indexPath.item][Description];
        cell.gameTitleInside.text =[self.filteredGameArray objectAtIndex:indexPath.item][Description];
        cell.gameTitleInside.font=[UIFont fontWithName:@"Gotham-XLight" size:15];
        cell.gameImage.image=[UIImage imageNamed:[self.filteredGameArray objectAtIndex:indexPath.item][Picture]];
        //cell.arrowSx.hidden=NO;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard =appDelegate.storyboard;
    
    
    // Get a reference to the DetailViewManager.
    // DetailViewManager is the delegate of our split view.
    CMVGameSplitViewController *detailViewManager = (CMVGameSplitViewController *)self.splitViewController.delegate;
    
    if (level ==0 && indexPath.row == 2) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.clickandplay.it"]];
    } else {
        if (touchPoint.x < MaxEdgeLeftTouchZone) {
//            if (level >0) {
//                level-=1;
//                [self.tableView reloadData];
//            }
            
        } else if (touchPoint.x > MinEdgeRightTouchZone || level < 1) {
            if (level < 1) {
                level+=1;
                GameType=indexPath.row;
                [self setOffice];
                    [self filterContentForGame:indexPath.row levelTwo:0 levelThree:Office];
                
            }
            
        } else {
            switch (GameType) {
                case 0: {
                    if (iPHONE) {
                        CMVSingleGameViewController *presentingViewController=  [storyboard instantiateViewControllerWithIdentifier:@"SingleGameViewController"];
                        
                        [presentingViewController setDataForGame:self.filteredGameArray[indexPath.row][RootForFirstLevel]];
                        
                        [self presentViewController:presentingViewController animated:YES completion:nil];
                         presentingViewController.gameName.text=self.filteredGameArray[indexPath.row][0];
                       
                        
                    } else {
                       
                       CMVSingleGameViewController *presentingViewController=  [storyboard instantiateViewControllerWithIdentifier:@"SingleGameViewController"];
                        

                        [self configureDetailItemForRow:indexPath.row viewController:presentingViewController];

                        detailViewManager.detailViewController = presentingViewController;
                        
                    }
                    
                }
                    break;
                case 1: {
                    if (iPHONE) {
                        CMVGameViewController *presentingViewController = [storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
                        
                        [presentingViewController setDataForGame:self.filteredGameArray[indexPath.row][RootForFirstLevel]];
                        presentingViewController.descriptionText=self.filteredGameArray[indexPath.row][0];
                        //if WHAT'S NEW show Carousel
                        if (indexPath.row == 1) {
                            presentingViewController.showCarousel=YES;
                        }
                        [self presentViewController:presentingViewController animated:YES completion:nil];
                    } else {
                        CMVGameViewController *presentingViewController=  [storyboard instantiateViewControllerWithIdentifier:@"GameViewController"];
                        if (indexPath.row == 1) {
                            presentingViewController.showCarousel=YES;
                        }
                        presentingViewController.descriptionText=self.filteredGameArray[indexPath.row][0];
                        [presentingViewController setDataForGame:self.filteredGameArray[indexPath.row][RootForFirstLevel]];
                        
                        
                        detailViewManager.detailViewController = presentingViewController;
                    }
                    
                }
                    break;
                case 2: {
                    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.clickandplay.it"]];
                }
                    break;
                default:
                    break;
            }
        }
    
    }
}



#pragma mark - Center button delegate
-(void)centerButtonAction:(UIButton *)sender {
  
    [self setOffice];

}

-(void)setOffice {
    if (self.site.location == VENEZIA) {
        Office=CN;
        [self filterContentForGame:GameType levelTwo:0 levelThree:CN];
        [self.myScrollSliding changeTextColor:BRAND_GREEN_COLOR];
       
        self.tabBarController.tabBar.tintColor=BRAND_GREEN_COLOR;

        
    } else {
        Office=VE;
        [self filterContentForGame:GameType levelTwo:0 levelThree:VE];
        [self.myScrollSliding changeTextColor:[UIColor redColor]];
        self.tabBarController.tabBar.tintColor=BRAND_RED_COLOR;

        
    }
}



#pragma Detail viewcontroller

- (void)configureDetailItemForRow:(NSUInteger)row viewController:(CMVSingleGameViewController *)viewController
{
    
    if (viewController) {
        [viewController setDataForGame:self.filteredGameArray[row][RootForFirstLevel]];
        [viewController setUpGame];
    }

}


@end
