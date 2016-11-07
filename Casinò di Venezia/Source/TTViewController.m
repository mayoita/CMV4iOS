//
//  TTViewController.m
//  UIScrollViewSlidingPages
//
//  Created by Thomas Thorpe on 27/03/2013.
//  Copyright (c) 2013 Thomas Thorpe. All rights reserved.
//

#import "TTViewController.h"
#import "TTScrollSlidingPagesController.h"
#import "CMVSwipeTableViewCellController.h"
#import "CMVGameTableViewController.h"
#import "CMVPokerHourTableViewZoom.h"
#import "CMVTournamentsViewZoomController.h"
#import "TTSlidingPage.h"
#import "TTSlidingPageTitle.h"



@interface TTViewController ()
    @property (strong, nonatomic) TTScrollSlidingPagesController *slider;
@end

@implementation TTViewController

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
    
    //initial setup of the TTScrollSlidingPagesController. 
    self.slider = [[TTScrollSlidingPagesController alloc] init];


    
    //set properties to customiser the slider. Make sure you set these BEFORE you access any other properties on the slider, such as the view or the datasource. Best to do it immediately after calling the init method.
    //self.slider.hideStatusBarWhenScrolling = YES;
    //slider.titleScrollerHidden = YES;
    //slider.titleScrollerHeight = 100;
    //slider.titleScrollerItemWidth=60;
    //slider.titleScrollerBackgroundColour = [UIColor darkGrayColor];
    //slider.disableTitleScrollerShadow = YES;
    //slider.disableUIPageControl = YES;
    //slider.initialPageNumber = 1;
    //slider.pagingEnabled = NO;
    //slider.zoomOutAnimationDisabled = YES;
#pragma StatusBar setting
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7){
        self.slider.hideStatusBarWhenScrolling = NO;//this property normally only makes sense on iOS7+. See the documentation in TTScrollSlidingPagesController.h. If you wanted to use it in iOS6 you'd have to make sure the status bar overlapped the TTScrollSlidingPagesController.
    }
    
    //set the datasource.
    self.slider.dataSource = self;
    
    //add the slider's view to this view as a subview, and add the viewcontroller to this viewcontrollers child collection (so that it gets retained and stays in memory! And gets all relevant events in the view controller lifecycle)
    //Adjustment for iOS 6.0 Status bar
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        self.slider.view.frame = self.view.frame;
    } else {
        self.slider.view.frame = CGRectMake(self.view.frame.origin.x, 0, self.view.frame.size.width, self.view.frame.size.height);
    }
    [self.view addSubview:self.slider.view];
    [self addChildViewController:self.slider];
    
}

#pragma mark TTSlidingPagesDataSource methods
-(int)numberOfPagesForSlidingPagesViewController:(TTScrollSlidingPagesController *)source{
    return 4; //just return 7 pages as an example
}

-(TTSlidingPage *)pageForSlidingPagesViewController:(TTScrollSlidingPagesController*)source atIndex:(int)index{
    UIViewController *viewController;
   
    switch (index) {
        case 0:{
            
            
            CMVSwipeTableViewCellController *helpViewController =[[CMVSwipeTableViewCellController alloc] init];
            if ([self.tabBarController isKindOfClass:[CMVMainTabbarController class]]) {
                helpViewController.mainTabBarController=(CMVMainTabbarController *)self.tabBarController;
                viewController=helpViewController;
            }
        }
            
 
            break;
        case 1: {
            
            CMVGameTableViewController *helpViewController =[[CMVGameTableViewController alloc] init];
            if ([self.tabBarController isKindOfClass:[CMVMainTabbarController class]]) {
                helpViewController.mainTabBarController=(CMVMainTabbarController *)self.tabBarController;
                viewController=helpViewController;
            }
            
    
        }
            break;
        case 2:{
            
            
            CMVPokerHourTableViewZoom *helpViewController =[[CMVPokerHourTableViewZoom alloc] init];
            if ([self.tabBarController isKindOfClass:[CMVMainTabbarController class]]) {
                helpViewController.mainTabBarController=(CMVMainTabbarController *)self.tabBarController;
                viewController=helpViewController;
            }
        }
            
            break;
        case 3: {
            
            
            CMVTournamentsViewZoomController *helpViewController =[[CMVTournamentsViewZoomController alloc] init];
            if ([self.tabBarController isKindOfClass:[CMVMainTabbarController class]]) {
                helpViewController.mainTabBarController=(CMVMainTabbarController *)self.tabBarController;
                viewController=helpViewController;
            }
        }
            break;
            
        default:
            break;
    }
    
    return [[TTSlidingPage alloc] initWithContentViewController:viewController];
}

-(TTSlidingPageTitle *)titleForSlidingPagesViewController:(TTScrollSlidingPagesController *)source atIndex:(int)index{
    TTSlidingPageTitle *title;
    
        switch (index) {
            case 0:
                title = [[TTSlidingPageTitle alloc] initWithHeaderText:NSLocalizedString(@"Events",@"")];
                break;
            case 1:
                title = [[TTSlidingPageTitle alloc] initWithHeaderText:@"CASINÒ"];
                break;
            case 2:
                title = [[TTSlidingPageTitle alloc] initWithHeaderText:NSLocalizedString(@"Poker hour",@"")];
                break;
            case 3:
                title = [[TTSlidingPageTitle alloc] initWithHeaderText:NSLocalizedString(@"Tournaments",@"")];
                break;
            case 4:
                title = [[TTSlidingPageTitle alloc] initWithHeaderText:@"Another Page"];
                break;
            default:
                title = [[TTSlidingPageTitle alloc] initWithHeaderText:[NSString stringWithFormat:@"Page %d", index+1]];
                break;
        }
        
    
    return title;
}


////The below method in the datasource might get removed from the control some time in the future as it doesn't work that well with the headers if the width is small.
//-(int)widthForPageOnSlidingPagesViewController:(TTScrollSlidingPagesController *)source atIndex:(int)index
//{
//    if (index ==3){
//        return 130;
//    } else {
//        return self.view.frame.size.width;
//    }
//}

@end
