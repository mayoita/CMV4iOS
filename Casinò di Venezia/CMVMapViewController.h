//
//  CMVMapViewController.h
//  CMV
//
//  Created by Massimo Moro on 20/04/13.
//  Copyright (c) 2013 Massimo Moro. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

#import "CMVMainTabbarController.h"



@interface CMVMapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate, CenterButtonDelegate>

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (strong, nonatomic) NSString *allSteps;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *directionsButton;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segemntedControl;

@property (nonatomic, retain) CLLocationManager *locationManager;
@end
