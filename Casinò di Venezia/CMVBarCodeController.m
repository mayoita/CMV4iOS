//
//  CMVBarCodeController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 10/10/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVBarCodeController.h"
#import "CMVCloseButton.h"
#import "CMVConstants.h"

@interface CMVBarCodeController ()
@property (weak, nonatomic) IBOutlet CMVCloseButton *close;

@end

@implementation CMVBarCodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.close.color = [UIColor blackColor];
    // Do any additional setup after loading the view.
    UILabel* label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height-120, 50.0)];
    [label setText:NSLocalizedString(@"ENTRY ALLOWED TO ADULTS OVER THE AGE OF EIGTHEEN, ONLY ON PRESENTATION OF A VALID PHOTO IDENTITY CARD", nil)];
    label.font=GOTHAM_BOOK(10);
    label.textAlignment=NSTextAlignmentCenter;
    label.minimumScaleFactor=5;
    label.adjustsFontSizeToFitWidth=YES;
    label.numberOfLines=0;
    [label setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    label.center=CGPointMake(20, self.view.center.y);
    [self.view addSubview:label];
    
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height-120, 50.0)];
    [label2 setText:NSLocalizedString(@"FREE ENTRY TICKET", nil)];
    label2.font=GOTHAM_Medium(25);
    label2.textAlignment=NSTextAlignmentCenter;
    label2.minimumScaleFactor=5;
    label2.adjustsFontSizeToFitWidth=YES;
    label2.numberOfLines=0;
    [label2 setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    label2.center=CGPointMake(self.view.frame.size.width- 35, self.view.center.y);
    [self.view addSubview:label2];
    
    UILabel* label3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.height-120, 50.0)];
    [label3 setText:@"WFB519--2S10936"];
    label3.font=GOTHAM_Medium(20);
    label3.textAlignment=NSTextAlignmentCenter;
    label3.minimumScaleFactor=5;
    label3.adjustsFontSizeToFitWidth=YES;
    label3.numberOfLines=0;
    [label3 setTransform:CGAffineTransformMakeRotation(M_PI / 2)];
    label3.center=CGPointMake(45, self.view.center.y);
    [self.view addSubview:label3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)done:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
   
}

@end
