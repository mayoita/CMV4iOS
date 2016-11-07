//
//  CMVSwipeTableViewCellController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/10/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSwipeTableViewCellController.h"
#import "CMVSwipeTableViewCell.h"

#import "CMVEventSelectionDelegate.h"
#import "CMVInfoViewController.h"
#import "CMVAllEvents.h"
#import "CMVAppDelegate.h"
#import "CMVEventKitController.h"
#import "CMVSharedClass.h"

#import "CMVEventKitController.h"
#import "CMVLocalize.h"

#import "CMVEventKitShared.h"
//#import "Events.h"
#import "EventsFireBase.h"

#define cellIdentifier @"CustomCell"
#define PARSE_CLASS_NAME @"Events"
#define EVENTS_INDEX 0

#define VE @"VE"
#define CN @"CN"

@interface CMVSwipeTableViewCellController ()

@property (weak, nonatomic) UITableView *tableView;
@property (nonatomic,strong)CMVDataClass *site;
@property(nonatomic)CGFloat rowHeight;

@property (strong, nonatomic) NSMutableDictionary *sections;
@property (strong, nonatomic) NSArray *sortedDays;
@property (strong, nonatomic) NSDateFormatter *sectionDateFormatter;
@property (strong, nonatomic) NSDateFormatter *cellDateFormatter;
@property (nonatomic, strong) NSDateFormatter *dateFormatter;


@end



@implementation CMVSwipeTableViewCellController {
    NSDate *today;
    NSDate *nextDay;
    BOOL dayFound;
    NSMutableArray *storage;
    NSString *Office;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Sets up the date formatter.
    self.dateFormatter = [NSDateFormatter new];
    self.dateFormatter.dateStyle = kCFDateFormatterShortStyle;
    self.dateFormatter.timeStyle = kCFDateFormatterShortStyle;
    self.dateFormatter.locale = [NSLocale currentLocale];
    [self.dateFormatter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [self.dateFormatter setDateFormat:@"dd/MM/yyyy"];
    dayFound = FALSE;
    today = [self dateAtBeginningOfDayForDate:[self dateAtBeginningOfDayForDate:[NSDate date]]];
    
    if (iPAD) {
        self.rowHeight=203;
    } else {
        self.rowHeight=(203*self.view.frame.size.width)/320;
    }

    self.view.backgroundColor = [UIColor clearColor];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    self.site=[CMVDataClass getInstance];

    
   [self.tableView registerNib:[UINib nibWithNibName:@"CMVCellView" bundle:nil] forCellReuseIdentifier:cellIdentifier];
    //Standard image size is 203x320
    self.tableView.rowHeight = self.rowHeight;
   
    
    // Makes the horizontal row seperator stretch the entire length of the table view
    if ([self.tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        self.tableView.separatorInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    
    //Delegate for iPad split controller
    self.eventDelegate=(CMVEventViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"EventDetails"];
    //for iPhone
    if (!self.eventDelegate) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main_iPhone" bundle:nil];
        CMVEventViewController *eventDetail = [storyboard instantiateViewControllerWithIdentifier:@"EventViewControlleriPhone"];
        self.eventDelegate=eventDetail;
    }
  
    [self setOffice];
    
    
    
    if (iPAD) {
        self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundGame.png"]];
 
        // on iPad only, don't clear the selection (we are displaying in a split view on iPad)
        self.clearsSelectionOnViewWillAppear = NO;    
        self.mainTabBarController = (CMVMainTabbarController *)self.tabBarController;
        int tabNumber = (int)[self.mainTabBarController selectedIndex];
        
        UISplitViewController *splitVC = [[self navigationController] splitViewController];
        int index = (int)[self.mainTabBarController.viewControllers indexOfObjectIdenticalTo:splitVC];
        
        if ( tabNumber == index || tabNumber == -1) {
            [self.mainTabBarController setCenterButtonDelegate:self];
        }
    }
    

    
}


- (NSDate *)dateAtBeginningOfDayForDate:(NSDate *)inputDate
{
    // Use the user's current calendar and time zone
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
    [calendar setTimeZone:timeZone];
    
    // Selectively convert the date components (year, month, day) of the input date
    NSDateComponents *dateComps = [calendar components:NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:inputDate];
    
    // Set the time components manually
    [dateComps setHour:0];
    [dateComps setMinute:0];
    [dateComps setSecond:0];
    
    // Convert back
    NSDate *beginningOfDay = [calendar dateFromComponents:dateComps];
    return beginningOfDay;
}

- (NSDate *)dateByAddingYears:(NSInteger)numberOfYears toDate:(NSDate *)inputDate
{
    // Use the user's current calendar
    NSCalendar *calendar = [NSCalendar currentCalendar];
    
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setYear:numberOfYears];
    
    NSDate *newDate = [calendar dateByAddingComponents:dateComps toDate:inputDate options:0];
    return newDate;
}

-(void)createDateSort {
    
    self.sectionDateFormatter = [[NSDateFormatter alloc] init];
    [self.sectionDateFormatter setDateStyle:NSDateFormatterLongStyle];
    [self.sectionDateFormatter setTimeStyle:NSDateFormatterNoStyle];
    
    self.cellDateFormatter = [[NSDateFormatter alloc] init];
    [self.cellDateFormatter setDateStyle:NSDateFormatterNoStyle];
    [self.cellDateFormatter setTimeStyle:NSDateFormatterShortStyle];
    
    NSDate *now = [NSDate date];

  
    for (EventsFireBase *event in _events)
    {
        // Reduce event start date to date components (year, month, day)
        NSDate *dateRepresentingThisDay = [self dateAtBeginningOfDayForDate:event.StartDate];
        
        // If we don't yet have an array to hold the events for this day, create one
        NSMutableArray *eventsOnThisDay = [self.sections objectForKey:dateRepresentingThisDay];
        if (eventsOnThisDay == nil) {
            eventsOnThisDay = [NSMutableArray array];
            
            // Use the reduced date as dictionary key to later retrieve the event list this day
            [_sections setObject:eventsOnThisDay forKey:dateRepresentingThisDay];
        }
        
        // Add the event to the list for this day
        [eventsOnThisDay addObject:event];
    }
    
    // Create a sorted list of days
    NSArray *unsortedDays = [self.sections allKeys];
  //  self.sortedDays = [unsortedDays sortedArrayUsingSelector:@selector(compare:)];
    NSSortDescriptor *sortOrder = [NSSortDescriptor sortDescriptorWithKey: @"self" ascending: NO];
   // [unsortedDays sortedArrayUsingDescriptors:[NSArray arrayWithObject: sortOrder]];
    
    self.sortedDays = [unsortedDays sortedArrayUsingDescriptors:[NSArray arrayWithObject: sortOrder]];
    nextDay= [self nextDay];
}

-(NSDate *)nextDay {
    NSDate *min=today;
    for (NSDate *date in self.sortedDays) {
        
        if (date > today) {
            min = date;
        }
    }
    return min;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (iPHONE) {
     
      
//        CGRect sectionRect = [self.tableView rectForSection:3];
//        sectionRect.size.height = self.tableView.frame.size.height;
//        [self.tableView scrollRectToVisible:sectionRect animated:YES];
    }
    
    if (iPAD) {
        [self.mainTabBarController setCenterButtonDelegate:self];
    }
        [self setOffice];
}






#pragma mark - Center button delegate
-(void)centerButtonAction:(UIButton *)sender {
    
    [self setOffice];
}

-(void)setOffice {
    
   
    if (self.site.location == VENEZIA) {
        Office=CN;
        _sections=nil;
        dayFound=FALSE;
        self.events=[self inOffice:Office];
        [self.tableView reloadData];
        [self.myScrollSliding changeTextColor:BRAND_GREEN_COLOR];
        self.tabBarController.tabBar.tintColor=BRAND_GREEN_COLOR;
    } else {
        Office=VE;
        _sections=nil;
        dayFound=FALSE;
        self.events=[self inOffice:Office];
        [self.tableView reloadData];
        [self.myScrollSliding changeTextColor:[UIColor redColor]];
        self.tabBarController.tabBar.tintColor=BRAND_RED_COLOR;
    }
}

-(NSMutableArray *)inOffice:(NSString *)theOffice{
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"office == %@", theOffice];
    NSMutableArray *helper=[appDelegate.storage filteredArrayUsingPredicate:pred].mutableCopy;
    
    return helper;
    
}

-(NSMutableDictionary *)sections {
    if (_sections) {
        return _sections;
    }
    if (_events.count > 0) {
        _sections=[NSMutableDictionary dictionary];
        [self createDateSort];
    }
    
    
    return _sections;
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return [self.sections count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSDate *dateRepresentingThisDay = [self.sortedDays objectAtIndex:section];
    NSArray *eventsOnThisDay = [self.sections objectForKey:dateRepresentingThisDay];
    return [eventsOnThisDay count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDate *dateRepresentingThisDay = [self.sortedDays objectAtIndex:section];
    return [self.sectionDateFormatter stringFromDate:dateRepresentingThisDay];
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.rowHeight;
}

-(void) tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    CGRect sectionRect = [tableView rectForSection:1];
//    sectionRect.size.height = tableView.frame.size.height;
//    [tableView scrollRectToVisible:sectionRect animated:YES];
    int lastRow =((NSIndexPath*)[[tableView indexPathsForVisibleRows] lastObject]).row;
    if([indexPath row] == 5){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:2 inSection:0];
        [self.tableView scrollToRowAtIndexPath:indexPath
                              atScrollPosition:UITableViewScrollPositionTop
                                      animated:YES];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    CMVSwipeTableViewCell *cell = (CMVSwipeTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
  
    if (self.events.count != 0) {
    //Cell set up
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        NSString *formatString = [NSDateFormatter dateFormatFromTemplate:@"EEEE dd, MMMM" options:0
                                                                  locale:[NSLocale currentLocale]];
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:formatString];
    }
    
    NSDate *dateRepresentingThisDay = [self.sortedDays objectAtIndex:indexPath.section];
    NSArray *eventsOnThisDay = [self.sections objectForKey:dateRepresentingThisDay];
        
        if (dateRepresentingThisDay == today || dateRepresentingThisDay == nextDay) {
            if (!dayFound) {
                [tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
                dayFound =TRUE;
            }
        }
    EventsFireBase *event=[eventsOnThisDay objectAtIndex:indexPath.row];
        event.theTableView = tableView;
   
    cell.labelDescription.hidden = YES;
    cell.readDescriptionS.hidden =YES;
    cell.eventStartDate.text=[formatter stringFromDate:event.StartDate];
    cell.startDate=event.StartDate;
    cell.endDate=event.EndDate;
    cell.eventEndDate.text=[formatter stringFromDate:event.EndDate];
    [self localizeMemo:cell event:event];
    cell.eventURL=event.URL;
    cell.picture.image = [UIImage imageNamed:@"Test.png"];
    cell.talking=NO;
    [cell.picture setImage:event.ImageName];

    cell.delegate = self;
    }
   
    
    return cell;
}

-(void)tapTableViewCell:(CMVSwipeTableViewCell *)cell {
    
    [self tableView:self.tableView didSelectRowAtIndexPath:[self.tableView indexPathForCell:cell]];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    UIStoryboard *storyboard =appDelegate.storyboard;
    CMVAllEvents *detailViewManager = (CMVAllEvents *)self.splitViewController.delegate;
    
    CMVSwipeTableViewCell *cell = (CMVSwipeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
   
    
    
    if (iPHONE) {
        CMVEventViewController *eventClass=[storyboard instantiateViewControllerWithIdentifier:@"EventViewControlleriPhone"];
        [self configureDetailItemForRow:indexPath viewController:eventClass withCell:cell];
        [self presentViewController:eventClass animated:YES completion:nil];
        
    } else {
        CMVEventViewController *presentingViewController=  [storyboard instantiateViewControllerWithIdentifier:@"EventDetails"];
        CMVSwipeTableViewCell *cell = (CMVSwipeTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
        [self configureDetailItemForRow:indexPath viewController:presentingViewController withCell:cell];
        
        
        detailViewManager.detailViewController = presentingViewController;
    }
}

- (void)configureDetailItemForRow:(NSIndexPath *)indexPath viewController:(CMVEventViewController *)viewController withCell:cell {
    
    if ([_events count] != 0) {
        NSDate *dateRepresentingThisDay = [self.sortedDays objectAtIndex:indexPath.section];
        NSArray *eventsOnThisDay = [self.sections objectForKey:dateRepresentingThisDay];
        Events *selectedEvent=[eventsOnThisDay objectAtIndex:indexPath.row];
       // Events *selectedEvent = [_events objectAtIndex:row];
        [viewController selectedEvent:selectedEvent];
//        if (_eventDelegate) {
//            [_eventDelegate selectedEvent:selectedEvent];
//            _eventDelegate.cell=cell;
//        }
    }
}


-(void)localizeMemo:(CMVSwipeTableViewCell *)cell event:(EventsFireBase *)event {
    cell.eventName.text =event.Name;
    cell.eventDescription.text=event.Description;
    switch ([CMVLocalize myDeviceLocaleIs]) {
        case IT :
            if (event.memoIT) {
                cell.eventMemo=event.memoIT;
                cell.readDescriptionS.hidden =NO;
            }
            if (event.NameIT) {
                cell.eventName.text = event.NameIT;
            }
            if (event.DescriptionIT) {
                cell.eventDescription.text = event.DescriptionIT;
                
            }
            break;
        case DE :
            if (event.memoDE) {
                cell.eventMemo=event.memoDE;
                cell.readDescriptionS.hidden =NO;
            }
            if (event.NameDE) {
                cell.eventName.text = event.NameDE;
            }
            if (event.DescriptionDE) {
                cell.eventDescription.text = event.DescriptionDE;
               
            }
            break;
        case FR :
            if (event.memoFR) {
                cell.eventMemo=event.memoFR;
                cell.readDescriptionS.hidden =NO;
            }
            if (event.NameFR) {
                cell.eventName.text = event.NameFR;
            }
            if (event.DescriptionFR) {
                cell.eventDescription.text = event.DescriptionFR;
                
            }
            break;
        case ES :
            if (event.memoES) {
                cell.eventMemo=event.memoES;
                cell.readDescriptionS.hidden =NO;
            }
            if (event.NameES) {
                cell.eventName.text = event.NameES;
            }
            if (event.DescriptionES) {
                cell.eventDescription.text = event.DescriptionES;
                
            }
            break;
        case RU  :
            if (event.memoRU) {
                cell.eventMemo=event.memoRU;
                cell.readDescriptionS.hidden =NO;
            }
            if (event.NameRU) {
                cell.eventName.text = event.NameRU;
            }
            if (event.DescriptionRU) {
                cell.eventDescription.text = event.DescriptionRU;
                
            }
            break;
        case ZH:
            if (event.memoZH) {
                cell.eventMemo=event.memoZH;
                cell.readDescriptionS.hidden =NO;
            }
            if (event.NameZH) {
                cell.eventName.text = event.NameZH;
            }
            if (event.DescriptionZH) {
                cell.eventDescription.text = event.DescriptionZH;
                
            }
            break;
        case EN:
            if (event.memo) {
                cell.eventMemo=event.memo;
                cell.readDescriptionS.hidden =NO;
            }
            cell.eventMemo=event.memo;
            if (event.Name) {
                cell.eventName.text = event.Name;
            }
            if (event.Description) {
                cell.eventDescription.text = event.Description;
                
            }
            break;
            
        default:
            cell.eventMemo=event.memo;
            cell.eventName.text =event.Name;
            cell.eventDescription.text=event.Description;
            
            break;
    }
}


#pragma mark - SWTableViewDelegate

- (void)swippableTableViewCell:(CMVSwipeTableViewCell *)cell
didTriggerRightUtilityButtonWithIndex:(NSInteger)index {
    
    
    switch (index) {
        case 0:
            [self shareButtonPress:@"TwitterSharingEvents"];
            [self initWithSocial:SLServiceTypeTwitter andCell:cell];
            break;
        case 1:
        {
            [self shareButtonPress:@"FacebookSharingEvents"];
            [self initWithSocial:SLServiceTypeFacebook andCell:cell];
            break;
        }
        case 2: {
            [self shareButtonPress:@"CalendarSharingEvents"];
            CMVEventKitShared *eks=[[CMVEventKitShared alloc] init];
            [eks setUpEvent:cell];
        }
            break;
        default:
            break;
    }
    
}
-(void)shareButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    
    if (![type  isEqual: @"CalendarSharingEvents"]) {
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"SHARING"
                                                              action:@"press"
                                                               label:type
                                                               value:nil] build]];
    } else {
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"REMINDER"
                                                          action:@"press"
                                                           label:type
                                                           value:nil] build]];
    }
    [tracker set:kGAIScreenName value:nil];
}
-(void)initWithSocial:(NSString *)service andCell:(CMVSwipeTableViewCell *)cell {
    if (![SLComposeViewController isAvailableForServiceType:service])
    {
        [self showUnavailableAlertForServiceType:service];
    }
    else
    {
        SLComposeViewController *composeViewController = [SLComposeViewController composeViewControllerForServiceType:service];
        [composeViewController addImage:cell.picture.image];
        [composeViewController addURL:[NSURL URLWithString:cell.eventURL]];
        NSString *initalTextString = cell.eventDescription.text;
        [composeViewController setInitialText:initalTextString];
        
        composeViewController.completionHandler = ^(SLComposeViewControllerResult result) {
            switch(result) {
                    //  This means the user cancelled without sending the Tweet
                case SLComposeViewControllerResultCancelled:
                    NSLog(@"Cancelled");
                    break;
                    //  This means the user hit 'Send'
                case SLComposeViewControllerResultDone:
                    [self shareButtonPress:service];
                    break;
            }
            
            //  dismiss the Tweet Sheet
            dispatch_async(dispatch_get_main_queue(), ^{
                [self dismissViewControllerAnimated:NO completion:^{
                    NSLog(@"Tweet Sheet has been dismissed.");
                }];
            });
        };
        
        [self presentViewController:composeViewController animated:YES completion:nil];
    }
}

- (void)showUnavailableAlertForServiceType:(NSString *)serviceType
{
    NSString *serviceName = @"";
    
    if (serviceType == SLServiceTypeFacebook)
    {
        serviceName = @"Facebook";
    }
    else if (serviceType == SLServiceTypeTwitter)
    {
        serviceName = @"Twitter";
    }
    
    UIAlertView *alertView = [[UIAlertView alloc]
                              initWithTitle:@"Account"
                              message:[NSString stringWithFormat:@"Please go to the device settings and add a %@ account in order to share through that service", serviceName]
                              delegate:nil
                              cancelButtonTitle:@"Close"
                              otherButtonTitles:nil];
    [alertView show];
}




- (BOOL)tableView:(UITableView *)tableView
canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return NO;
}



@end
