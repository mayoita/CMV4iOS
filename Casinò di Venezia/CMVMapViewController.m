//
//  CMVMapViewController.m
//  CMV
//
//  Created by Massimo Moro on 20/04/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import "CMVMapViewController.h"
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>
#import "JPSThumbnailAnnotation.h"
#import "CMVMainTabbarController.h"
#import "CMVAppDelegate.h"
#import "CMVInfoViewController.h"
#import "CMVMainTabbarController.h"



@interface CMVMapViewController ()

@property (strong, nonatomic) CLLocation *location;
@property (strong, nonatomic)UIView *backGroundViewSegmented;
@property(strong,nonatomic)CMVMainTabbarController *tabbarCenter;

@property (weak, nonatomic) IBOutlet UILabel *mapLabel;
@property (weak, nonatomic) IBOutlet UIButton *timeButton;
@property (weak, nonatomic) IBOutlet UIButton *infoButton;

@end

@implementation CMVMapViewController

@synthesize locationManager = _locationManager;
static NSString *RPSlidingCellIdentifier = @"CMVRPSlidingCellIdentifier";
CLLocationCoordinate2D siteCoordinate;
MKRoute *routeDetails;

- (void)viewDidLoad
{
    [super viewDidLoad];
    //[self requestWhenInUseAuthorization];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidEnterBackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationDidBecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
    
    self.directionsButton.layer.cornerRadius=5;
    self.directionsButton.layer.borderWidth=1.0f;
    self.directionsButton.layer.borderColor=[UIColor colorWithRed:21.0/255.0 green:122/255.0 blue:251/255.0 alpha:1].CGColor;
    
//    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
//        [self addBackgroundViewBelowSegmentedControl:self.segemntedControl ];
//    }
    
	[self convenienceStartUpdateLocation];
    
    
    self.mapView.delegate = self;
    self.mapView.mapType = MKMapTypeStandard;
    
    // Annotations
    [self.mapView addAnnotations:[self generateAnnotations]];
    self.mapView.userLocation.title=NSLocalizedString(@"I'm Here", @"");
    [self drawDirections];
    
    //Center button delegate
    self.tabbarCenter = (CMVMainTabbarController *)self.tabBarController;
    [self.tabbarCenter setCenterButtonDelegate:self];
    if (UIDeviceOrientationIsLandscape(self.interfaceOrientation)) {
        [self updateConstraints];
    }
    
   
}

// MKMapViewDelegate Methods
- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView
{
    // Check authorization status (with class method)
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // User has never been asked to decide on location authorization
    if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"Requesting when in use auth");
        [self.locationManager requestWhenInUseAuthorization];
    }
    // User has denied location use (either for this app or for all apps
    else if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"Location services denied");
        // Alert the user and send them to the settings to turn on location
        
    }
}

-(void)convenienceStartUpdateLocation {
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
        [self requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
}

- (void)requestWhenInUseAuthorization
{
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    // If the status is denied or only granted for when in use, display an alert
    if (status == kCLAuthorizationStatusNotDetermined || status == kCLAuthorizationStatusDenied) {
        NSString *title;
        title = (status == kCLAuthorizationStatusDenied) ? @"Location services are off" : NSLocalizedString(@"Location services", @"WhenInUseTitle");
        NSString *message = NSLocalizedString(@"Location services are on", @"WhenInUsedMessage");
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                            message:message
                                                           delegate:self
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:@"Cancel", nil];
        [alertView show];
    }
    // The user has not enabled any location services. Request background authorization.
    else if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestAlwaysAuthorization];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 1) {
        // Send the user to the Settings for this app
        NSURL *settingsURL = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
        [[UIApplication sharedApplication] openURL:settingsURL];
    }
}

/**
 Return a location manager -- create one if necessary.
 */
- (CLLocationManager *)locationManager {
	if ([CLLocationManager locationServicesEnabled]) {
    if (_locationManager != nil) {
		return _locationManager;
	}
	
	_locationManager = [[CLLocationManager alloc] init];
    _locationManager.distanceFilter = kCLHeadingFilterNone;
    _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    _locationManager.delegate = self;
    //_locationManager.purpose = @"Some text.";
	} else {
        UIAlertView *alert= [[UIAlertView alloc]initWithTitle:NSLocalizedString(@"Error", nil) message:NSLocalizedString(@"The location services seems to be disabled from the settings.", nil) delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        alert= nil;
    }
	return _locationManager;
}

-(void)viewWillAppear:(BOOL)animated {
    NSString *value=@"";
    [self.tabbarCenter setCenterButtonDelegate:self];
    CMVDataClass *site=[CMVDataClass getInstance];
    if (site.location == VENEZIA) {
        siteCoordinate = CA_NOGHERA;
        value=@"MapCN";
        self.mapLabel.textColor=BRAND_GREEN_COLOR;
        [self.timeButton setBackgroundImage:[UIImage imageNamed:@"MapGreenButton.png"] forState:UIControlStateNormal];
        [self.infoButton setBackgroundImage:[UIImage imageNamed:@"MapGreenButton.png"] forState:UIControlStateNormal];
    } else {
        siteCoordinate = PALAZZO_LOREDAN_VENDRAMIN;
        value=@"MapVE";
        self.mapLabel.textColor=BRAND_RED_COLOR;
        [self.timeButton setBackgroundImage:[UIImage imageNamed:@"MapRedButton.png"] forState:UIControlStateNormal];
        [self.infoButton setBackgroundImage:[UIImage imageNamed:@"MapRedButton.png"] forState:UIControlStateNormal];
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [self drawDirections];
    [self setZoomRect];
    
}

-(void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated {

   // [self setZoomRect];
}

-(void)willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
    [self updateConstraints];
}

-(void)updateConstraints {
    float orientationContraints;
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        if (self.view.frame.size.width == MAX_WIDTH_LANDSCAPE) {
             orientationContraints =self.view.frame.size.width;
        } else if (UIDeviceOrientationIsLandscape(self.interfaceOrientation)){
            
            orientationContraints =self.view.frame.size.height;
        } else {
            orientationContraints =self.view.frame.size.width;
        }
        
        float constraints =orientationContraints - self.backGroundViewSegmented.bounds.size.width - 20;
        self.backGroundViewSegmented.frame=CGRectMake(constraints, 20, 206, 29);

    }
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    static BOOL firstTime=TRUE;
    if(firstTime) {
        firstTime = FALSE;
        CLLocation *newLocation = [locations lastObject];
        CLLocation *oldLocation;
        if (locations.count > 1) {
            oldLocation = [locations objectAtIndex:locations.count-2];
        } else {
            oldLocation = nil;
        }
   
        MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, 1500, 1500);
    
    
        [self.mapView setRegion:userLocation animated:YES];
}
 
}

-(MKCoordinateRegion)getRegionForBounds:(NSDictionary*)bounds{
    CLLocationCoordinate2D annotationCenter;
    CGFloat southwestLat,southwestLng,northeastLat,northeastLng;
    northeastLat = [[[bounds objectForKey:@"northeast"] objectForKey:@"lat"] floatValue];
    northeastLng = [[[bounds objectForKey:@"northeast"] objectForKey:@"lng"] floatValue];
    
    southwestLat = [[[bounds objectForKey:@"southwest"] objectForKey:@"lat"] floatValue];
    southwestLng = [[[bounds objectForKey:@"southwest"] objectForKey:@"lng"] floatValue];
    
    
    MKCoordinateSpan span;
    span.longitudeDelta =  fabs(northeastLng - southwestLng) ;
	span.latitudeDelta =  fabs(northeastLat - southwestLat);
    annotationCenter.longitude = (northeastLng + southwestLng)/2;
    annotationCenter.latitude = (northeastLat + southwestLat)/2;
    span.longitudeDelta = span.longitudeDelta*1.1;
    span.latitudeDelta = span.latitudeDelta*1.3;
    MKCoordinateRegion region;
	region.center = annotationCenter;
	region.span = span;
    
    return region;
}

-(void)setZoomRect {

    CLLocation *newLocation=self.locationManager.location;
    
    CLLocationCoordinate2D annotationCenter;
    CGFloat southwestLat,southwestLng,northeastLat,northeastLng;
    northeastLat = newLocation.coordinate.latitude;
    northeastLng = newLocation.coordinate.longitude;
    
    southwestLat = siteCoordinate.latitude;
    southwestLng = siteCoordinate.longitude;
    
    MKCoordinateSpan span;
    span.longitudeDelta =  fabs(northeastLng - southwestLng) ;
	span.latitudeDelta =  fabs(northeastLat - southwestLat);
    
    annotationCenter.longitude = (northeastLng + southwestLng)/2;
    annotationCenter.latitude = (northeastLat + southwestLat)/2;
    span.longitudeDelta = span.longitudeDelta*1.1;
    span.latitudeDelta = span.latitudeDelta*1.3;
    MKCoordinateRegion region;
	region.center = annotationCenter;
	region.span = span;
    
    [self.mapView setRegion:region animated:YES];
    
}

- (IBAction)openInfo:(id)sender {
    CMVInfoViewController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"InfoViewController"];
    [self presentViewController:modal animated:YES completion:^{
        
    }];
}

- (IBAction)getDirections:(id)sender {
    [self getDirectionsButtonPress:@"GetDirections"];
    [self directions];
}
-(void)getDirectionsButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    if (type) {
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"DIRECTION"
                                                              action:@"press"
                                                               label:type
                                                               value:nil] build]];
    } else {

        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"DIRECTION"
                                                              action:@"press"
                                                               label:type
                                                               value:nil] build]];
    }
    [tracker set:kGAIScreenName value:nil];
}

-(void)directions {
    Class mapItemClass = [MKMapItem class];
    CMVDataClass *site=[CMVDataClass getInstance];
    if (mapItemClass && [mapItemClass respondsToSelector:@selector(openMapsWithItems:launchOptions:)])
    {
        // Create an MKMapItem to pass to the Maps app
        if (site.location == VENEZIA) {
            CLLocationCoordinate2D coordinate = PALAZZO_LOREDAN_VENDRAMIN;
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                           addressDictionary:nil];
            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
            [mapItem setName:@"My Place"];
            // Set the directions mode to "Walking"
            // Can use MKLaunchOptionsDirectionsModeDriving instead
            NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving};
            // Get the "Current User Location" MKMapItem
            MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
            // Pass the current location and destination map items to the Maps app
            // Set the direction mode in the launchOptions dictionary
            [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                           launchOptions:launchOptions];
        } else {
            CLLocationCoordinate2D coordinate = CA_NOGHERA;
            MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:coordinate
                                                           addressDictionary:nil];
            MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:placemark];
            [mapItem setName:@"My Place"];
            // Set the directions mode to "Walking"
            // Can use MKLaunchOptionsDirectionsModeDriving instead
            NSDictionary *launchOptions = @{MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeWalking};
            // Get the "Current User Location" MKMapItem
            MKMapItem *currentLocationMapItem = [MKMapItem mapItemForCurrentLocation];
            // Pass the current location and destination map items to the Maps app
            // Set the direction mode in the launchOptions dictionary
            [MKMapItem openMapsWithItems:@[currentLocationMapItem, mapItem]
                           launchOptions:launchOptions];
        }
        
        
    }
}

-(void)drawDirections {
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        MKDirectionsRequest *directionsRequest = [[MKDirectionsRequest alloc] init];
        MKPlacemark *placemark = [[MKPlacemark alloc] initWithCoordinate:siteCoordinate
                                                       addressDictionary:nil];
        [directionsRequest setSource:[MKMapItem mapItemForCurrentLocation]];
        [directionsRequest setDestination:[[MKMapItem alloc] initWithPlacemark:placemark]];
        directionsRequest.transportType = MKDirectionsTransportTypeAutomobile;
        MKDirections *directions = [[MKDirections alloc] initWithRequest:directionsRequest];
        [directions calculateDirectionsWithCompletionHandler:^(MKDirectionsResponse *response, NSError *error) {
            [self clearDirections];
            if (error) {
                NSLog(@"Error %@", error.description);
            } else {
                routeDetails = response.routes.lastObject;
                [self.mapView addOverlay:routeDetails.polyline];
                if (HTShouldUseMetricSystemForDistance()) {
                    self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f Km", routeDetails.distance/1000];
                } else {
                    self.distanceLabel.text = [NSString stringWithFormat:@"%0.1f Miles", routeDetails.distance/1609.344];
                }
                self.allSteps = @"";
                for (int i = 0; i < routeDetails.steps.count; i++) {
                    MKRouteStep *step = [routeDetails.steps objectAtIndex:i];
                    NSString *newStep = step.instructions;
                    self.allSteps = [self.allSteps stringByAppendingString:newStep];
                    self.allSteps = [self.allSteps stringByAppendingString:@"\n\n"];
                    
                }
            }
            
        }];
    } 
}

BOOL HTShouldUseMetricSystem()
{
    return [(NSNumber *)[[NSLocale currentLocale] objectForKey:NSLocaleUsesMetricSystem] boolValue];
}

BOOL HTShouldUseMetricSystemForDistance()
{
    // Force imperial units in Great Britain
    BOOL shouldForceImperial = [[[NSLocale currentLocale] objectForKey:NSLocaleCountryCode] isEqualToString:@"GB"];
    
    BOOL shouldUseMetric = (HTShouldUseMetricSystem() && !shouldForceImperial);
    return shouldUseMetric;
}

-(void)clearDirections {
   
    self.distanceLabel.text = nil;
    [self.mapView removeOverlay:routeDetails.polyline];
}

-(MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
    MKPolylineRenderer  * routeLineRenderer = [[MKPolylineRenderer alloc] initWithPolyline:routeDetails.polyline];
    CMVDataClass *site=[CMVDataClass getInstance];
    if (site.location == VENEZIA) {
    routeLineRenderer.strokeColor = BRAND_GREEN_COLOR;
    } else {
        routeLineRenderer.strokeColor = [UIColor redColor];
    }
    routeLineRenderer.lineWidth = 5;
    return routeLineRenderer;
}

- (NSArray *)generateAnnotations {
    NSMutableArray *annotations = [[NSMutableArray alloc] initWithCapacity:2];
    
    // Venezia
    JPSThumbnail *venezia = [[JPSThumbnail alloc] init];
    venezia.image = [UIImage imageNamed:@"VeneziaThumbnail.jpg"];
    venezia.title = @"Casinò di Venezia";
    venezia.subtitle = @"Cà Vendramin Calergi";
    venezia.coordinate = PALAZZO_LOREDAN_VENDRAMIN;
    venezia.disclosureBlock = ^{ NSLog(@"selected Venezia"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:venezia]];
    
    // CaNoghera
    JPSThumbnail *caNoghera = [[JPSThumbnail alloc] init];
    caNoghera.image = [UIImage imageNamed:@"CaNogheraThumbnail.jpg"];
    caNoghera.title = @"Casinò di Venezia";
    caNoghera.subtitle = @"Cà Noghera";
    caNoghera.coordinate = CA_NOGHERA;
    caNoghera.disclosureBlock = ^{ NSLog(@"selected Cà Noghera"); };
    
    [annotations addObject:[[JPSThumbnailAnnotation alloc] initWithThumbnail:caNoghera]];
    
    
    
    return annotations;
}


#pragma mark - MKMapViewDelegate

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didSelectAnnotationViewInMap:mapView];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view {
    if ([view conformsToProtocol:@protocol(JPSThumbnailAnnotationViewProtocol)]) {
        [((NSObject<JPSThumbnailAnnotationViewProtocol> *)view) didDeselectAnnotationViewInMap:mapView];
    }
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
    if ([annotation conformsToProtocol:@protocol(JPSThumbnailAnnotationProtocol)]) {
        return [((NSObject<JPSThumbnailAnnotationProtocol> *)annotation) annotationViewInMap:mapView];
    }
    return nil;
}

#pragma mark - Center button delegate
-(void)centerButtonAction:(UIButton *)sender {
    NSString *value=@"";
    CMVDataClass *site=[CMVDataClass getInstance];
    if (site.location == VENEZIA) {
        siteCoordinate = CA_NOGHERA;
        value=@"MapCN";
        self.tabBarController.tabBar.tintColor=BRAND_GREEN_COLOR;
        self.mapLabel.textColor = BRAND_GREEN_COLOR;
        [self.timeButton setBackgroundImage:[UIImage imageNamed:@"MapGreenButton.png"] forState:UIControlStateNormal];
        [self.infoButton setBackgroundImage:[UIImage imageNamed:@"MapGreenButton.png"] forState:UIControlStateNormal];
    } else {
        siteCoordinate = PALAZZO_LOREDAN_VENDRAMIN;
        value=@"MapVE";
        self.tabBarController.tabBar.tintColor=BRAND_RED_COLOR;
        self.mapLabel.textColor = BRAND_RED_COLOR;
        [self.timeButton setBackgroundImage:[UIImage imageNamed:@"MapRedButton.png"] forState:UIControlStateNormal];
        [self.infoButton setBackgroundImage:[UIImage imageNamed:@"MapRedButton.png"] forState:UIControlStateNormal];
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    [self drawDirections];
    [self setZoomRect];
}

- (IBAction)setMapType:(UISegmentedControl *)sender {
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.mapView.mapType = MKMapTypeStandard;
            self.distanceLabel.textColor=[UIColor blackColor];
            break;
        case 1:
            self.mapView.mapType = MKMapTypeSatellite;
            self.distanceLabel.textColor=[UIColor whiteColor];
            break;
        case 2:
            self.mapView.mapType = MKMapTypeHybrid;
            self.distanceLabel.textColor=[UIColor whiteColor];
            break;
        default:
            break;
    }
}

#pragma  mark Background view for segmnted control
- (UIView *)addBackgroundViewBelowSegmentedControl:(UISegmentedControl *)segmentedControl {
    CGFloat autosizedWidth = CGRectGetWidth(segmentedControl.bounds);
    autosizedWidth -= (segmentedControl.numberOfSegments - 1); // ignore the 1pt. borders between segments
    
    NSInteger numberOfAutosizedSegmentes = 0;
    NSMutableArray *segmentWidths = [NSMutableArray arrayWithCapacity:segmentedControl.numberOfSegments];
    for (NSInteger i = 0; i < segmentedControl.numberOfSegments; i++) {
        CGFloat width = [segmentedControl widthForSegmentAtIndex:i];
        if (width == 0.0f) {
            // auto sized
            numberOfAutosizedSegmentes++;
            [segmentWidths addObject:[NSNull null]];
        }
        else {
            // manually sized
            autosizedWidth -= width;
            [segmentWidths addObject:@(width)];
        }
    }
    
    CGFloat autoWidth = floorf(autosizedWidth/(float)numberOfAutosizedSegmentes);
    CGFloat realWidth = (segmentedControl.numberOfSegments-1);      // add all the 1pt. borders between the segments
    for (NSInteger i = 0; i < [segmentWidths count]; i++) {
        id width = segmentWidths[i];
        if (width == [NSNull null]) {
            realWidth += autoWidth;
        }
        else {
            realWidth += [width floatValue];
        }
    }
    
    CGRect whiteViewFrame = segmentedControl.frame;
    whiteViewFrame.size.width = realWidth;
    
    UIView *whiteView = [[UIView alloc] initWithFrame:whiteViewFrame];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius = 5.0f;
    whiteView.alpha=0.8f;
    self.backGroundViewSegmented=whiteView;
    [self.view insertSubview:whiteView belowSubview:segmentedControl];
    return whiteView;
}

- (IBAction)openTimetables:(id)sender {
    UITabBarController *modal = [self.storyboard instantiateViewControllerWithIdentifier:@"TimeTables"];
    [self presentViewController:modal animated:YES completion:^{
        
    }];
}




#pragma mark - UIAplicatin notifications

- (void)applicationDidEnterBackground:(NSNotification *) notification
{
    [self.locationManager stopUpdatingLocation];
}

- (void)applicationDidBecomeActive:(NSNotification *) notification
{
    [self.locationManager stopUpdatingLocation];
}

@end
