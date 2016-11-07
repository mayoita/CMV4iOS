//
//  CMVInfoViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVInfoViewController.h"
#import "CMVStyles.h"
#import "CMVCloseButton.h"

@interface CMVInfoViewController ()
@property (strong, nonatomic)CMVStyles *styles;
@property (weak, nonatomic) IBOutlet CMVCloseButton *closeButton;
@end

@implementation CMVInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    self.styles=[[CMVStyles alloc] init];
    self.info.attributedText=self.infoText;
    self.closeButton.color=[UIColor whiteColor];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSString *value=@"";
    if ([CMVDataClass getInstance].location == VENEZIA) {
        value=@"InfoMapCN";
    } else {
        value=@"InfoMapVE";
    }
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:value];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
 
}

-(void)viewWillAppear:(BOOL)animated {
    self.scrollView.contentOffset=CGPointZero;
}


-(NSMutableAttributedString *)infoText {
   
    NSDictionary *firstAttributes = self.styles.firstAttributes;
    NSDictionary *secondAttributes = self.styles.secondAttributes;
    
    NSString *myString=NSLocalizedString(@"WAYS OF GAINING ADMISSION TO THE CASINO\n\nWith the exception of December 24 and 25 the Casinò di Venezia’s two venues, Ca’ Vendramin Calergi and Ca’ Noghera are open all year round.\nAccess to the Casinò di Venezia’s games rooms is restricted to adults only who are in possession of a valid ID document:\n\nacceptable forms of identification include either an ID Card, a driving licence or a passport.\n\n€5.00 Admission Card (services excluded);\n€10.00 Admission Card: a €10 admission.\n\nThe €10.00 Admission Card includes services:\n- The gift of a non convertible chip or ez-pay ticket worth € 10.00 for use at the gaming tables or on the slot machines;\n- cloakroom;\n- parking (at Ca' Noghera it's free of charge; in Venice there is a 50% discount at the ASM and Garage San Marco from Monday to Friday, but Sundays, public holidays and the day before these are excluded);\n- road shuttle service: Casinò di Ca' Noghera - Venice Piazzale Roma and vice versa; Go to timetables\n- road shuttle service: Mestre Railway Station –Ca’ Noghera Casino and vice versa; Go to timetables\n- waterways shuttle service: Piazzale Roma - Ca' Vendramin Calergi and vice versa. Go to timetables\n\nIf you are staying in a hotel in Venice why not ask for a Free Entry Coupon.\n\nThere’s a gift waiting for everyone who comes to gamble at the Casino on their birthday.\n\nThere are lots of different promotions and special occasions every month for organising a visit to our two venues. Gifts from the Casinò di Venezia’s own branded collections. An offer of drinks and snacks, gambling benefits with slot machine tickets or gaming table chips, free.\nFind out about the promotion of the month.\n\n\nMETHODS OF PAYMENT\n\nFor the purchase of means of gambling, we accept:\n- payment in Italian or foreign currency, up to the maximum limit prescribed by current legislation (during the gambling at tables opening times)\n- payment with the following forms of credit cards: Pagobancomat Cash card; Visa; MasterCard, Maestro, China Union Pay.\nPayment of gambling credits or winnings can be made in cash, within the limits prescribed by law, with non-transferable cheques made payable to the client or in the form of a means of gambling.\n\nEach of the Casinò di Venezia’s venues has cashier and POS/credit card and cash card banking service points.\n\nThe use of cash\nLegislative Decree No. 201 of December 06 2013, published in the Official Gazette (No. 284 of December 06 2011) placed a limit on the use of ready cash for any transactions. As a result of this, therefore, the transfer of cash to and from clients within the gaming house can only be for amounts of less than €1000.00.",@"");
    
    NSInteger _stringLength=[myString length];
    
    NSMutableAttributedString *attMyString=[[NSMutableAttributedString alloc] initWithString:myString];
    [attMyString setAttributes:firstAttributes range:NSMakeRange(0, _stringLength)];
    
    [attMyString setAttributes:secondAttributes range:[myString rangeOfString:NSLocalizedString(@"WAYS OF GAINING ADMISSION TO THE CASINO",@"")]];
    [attMyString setAttributes:secondAttributes range:[myString rangeOfString:NSLocalizedString(@"METHODS OF PAYMENT",@"")]];
  
    
    return attMyString;
}
- (IBAction)backButton:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
}

@end
