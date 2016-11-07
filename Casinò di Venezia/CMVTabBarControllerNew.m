//
//  CMVTabBarControllerNew.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 23/09/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVTabBarControllerNew.h"
#import "UIViewController+ECSlidingViewController.h"
#import "METransitions.h"

@interface CMVTabBarControllerNew ()
@property (nonatomic, strong) METransitions *transitions;
@property (nonatomic, strong) UIPanGestureRecognizer *dynamicTransitionPanGesture;
@end

@implementation CMVTabBarControllerNew

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *imageForiOsVersionCA;
    UIImage *imageForiOsVersionVE;
    
    if (iPAD & SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        imageForiOsVersionCA=[UIImage imageNamed:@"CMV_CA_iOS7_button_centerV.png"];
        imageForiOsVersionVE=[UIImage imageNamed:@"CMV_VE_iOS7_button_centerR.png"];
    } else {
        imageForiOsVersionCA=[UIImage imageNamed:@"CMV_CA_button_centerV.png"];
        imageForiOsVersionVE=[UIImage imageNamed:@"CMV_VE_button_centerR.png"];
    }
    
    self.delegate=self;
    
    for (UITabBarItem *item in self.tabBar.items)  {
        item.titlePositionAdjustment = UIOffsetMake(0, -15.0);
        
    }
    
    //Sliding feature set up
    self.view.layer.shadowOpacity=0.75f;
    self.view.layer.shadowRadius=10.0f;
    self.view.layer.shadowColor=[UIColor blackColor].CGColor;
    
    
    NSDictionary *transitionData = self.transitions.all[1];
    id<ECSlidingViewControllerDelegate> transition = transitionData[@"transition"];
    if (transition == (id)[NSNull null]) {
        self.slidingViewController.delegate = nil;
    } else {
        self.slidingViewController.delegate = transition;
    }
    NSString *transitionName = transitionData[@"name"];
    if ([transitionName isEqualToString:METransitionNameDynamic]) {
        self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGestureCustom;
        self.slidingViewController.customAnchoredGestures = @[self.dynamicTransitionPanGesture];
        [self.view removeGestureRecognizer:self.slidingViewController.panGesture];
        [self.view addGestureRecognizer:self.dynamicTransitionPanGesture];
    } else {
        self.slidingViewController.topViewAnchoredGesture = ECSlidingViewControllerAnchoredGestureTapping | ECSlidingViewControllerAnchoredGesturePanning;
        self.slidingViewController.customAnchoredGestures = @[];
        [self.view removeGestureRecognizer:self.dynamicTransitionPanGesture];
        [self.view addGestureRecognizer:self.slidingViewController.panGesture];
    }
    
    CMVDataClass *site=[CMVDataClass getInstance];
    if (site.location == VENEZIA) {
        
        [self addCenterButtonWithImage:imageForiOsVersionCA
                        highlightImage:[UIImage imageNamed:@"hood-CMV_CA_button_center_matte.png"]
                                target:self
                                action:@selector(centerButtonAction:)];
    } else {
        
        [self addCenterButtonWithImage:imageForiOsVersionVE
                        highlightImage:[UIImage imageNamed:@"hood-CMV_VE_button_center_matte.png"]
                                target:self
                                action:@selector(centerButtonAction:)];
    }
}

#pragma mark - Properties

- (METransitions *)transitions {
    if (_transitions) return _transitions;
    
    _transitions = [[METransitions alloc] init];
    
    return _transitions;
}

- (UIPanGestureRecognizer *)dynamicTransitionPanGesture {
    if (_dynamicTransitionPanGesture) return _dynamicTransitionPanGesture;
    
    _dynamicTransitionPanGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.transitions.dynamicTransition action:@selector(handlePanGesture:)];
    
    return _dynamicTransitionPanGesture;
}

// Create a custom UIButton and add it to the center of tab bar
- (void)addCenterButtonWithImage:(UIImage *)buttonImage highlightImage:(UIImage *)highlightImage target:(id)target action:(SEL)action
{
    UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    button.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin;
    button.frame = CGRectMake(0.0, 0.0, buttonImage.size.width, buttonImage.size.height);
    [button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [button setBackgroundImage:highlightImage forState:UIControlStateHighlighted];
    
    
    CGFloat heightDifference = buttonImage.size.height - self.tabBar.frame.size.height;
    if (heightDifference < 0) {
        button.center = self.tabBar.center;
    } else {
        CGPoint center = self.tabBar.center;
        center.y = center.y - heightDifference/2.0 + CenterButtonOffset;
        button.center = center;
    }
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    self.centerButton = button;
}


//Check and see if the delegate is set, and then if it responds to the selector.
//Once this is checked, the method is call
-(void)centerButtonAction:(UIButton *)sender {
    UIImage *imageForiOsVersionCA;
    UIImage *imageForiOsVersionVE;
    
    if (iPAD & SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")) {
        imageForiOsVersionCA=[UIImage imageNamed:@"CMV_CA_iOS7_button_centerV.png"];
        imageForiOsVersionVE=[UIImage imageNamed:@"CMV_VE_iOS7_button_centerR.png"];
    } else {
        imageForiOsVersionCA=[UIImage imageNamed:@"CMV_CA_button_centerV.png"];
        imageForiOsVersionVE=[UIImage imageNamed:@"CMV_VE_button_centerR.png"];
    }
    
    CMVDataClass *site=[CMVDataClass getInstance];
    if (site.location== VENEZIA) {
        
        [self.centerButton setImage:imageForiOsVersionVE forState:UIControlStateNormal];
        site.location=CANOGHERA;
    } else {
        
        [self.centerButton setImage:imageForiOsVersionCA forState:UIControlStateNormal];
        site.location=VENEZIA;
    }
    
    if (self.centerButtonDelegate && [self.centerButtonDelegate respondsToSelector:@selector(centerButtonAction:)]) {
        [self.centerButtonDelegate centerButtonAction:sender];
    }
    
}

@end
