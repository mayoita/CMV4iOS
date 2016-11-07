//
//  CMVMailChimp.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 27/05/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVMailChimp.h"
#import "CMVAppDelegate.h"
#import "UIViewController+ECSlidingViewController.h"

@interface CMVMailChimp ()

@property (weak, nonatomic) IBOutlet UISwitch *newsletter;
@property (weak, nonatomic) IBOutlet UISwitch *confirm;
@property (weak, nonatomic) IBOutlet UISwitch *allow;
@property (nonatomic, assign) id currentResponder;
@property (weak, nonatomic) IBOutlet UIButton *subscribe;
@property (weak, nonatomic) IBOutlet UIButton *unsubscribe;
@property (weak, nonatomic) IBOutlet UILabel *newsletterLabel;

@end

@implementation CMVMailChimp

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
    _myEmail.delegate=self;
 //   identityManager = [AWSIdentityManager sharedInstance];
//    if (identityManager.userName) {
 //       AWSCognito *syncClient = [AWSCognito defaultCognito];
        
 //       AWSCognitoDataset *dataset = [syncClient openOrCreateDataset:@"myDataset"];
 //       self.myName.text=[identityManager.userName componentsSeparatedByString:@" "][0];
 //       self.myLastName.text=[identityManager.userName componentsSeparatedByString:@" "][1];
 //       if ([dataset stringForKey:@"email"]) {
 //           self.myEmail.text =[dataset stringForKey:@"email"];
//        } else {
//            self.myEmail.text = identityManager.userEmail;
 //           [dataset setString:identityManager.userEmail forKey:@"email"];
//        }

//    }
   
    
    [self.myName resignFirstResponder];
    
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(resignOnTap:)];
    [singleTap setNumberOfTapsRequired:1];
    [singleTap setNumberOfTouchesRequired:1];
    [self.view addGestureRecognizer:singleTap];
    [[ChimpKit sharedKit] callApiMethod:@"lists/list"
							 withParams:nil
				   andCompletionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
					   NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
					   NSLog(@"Here are my lists: %@", responseString);
				   }];

}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Newsletter"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (iPHONE) {
        
        UIImage *myGradient = [UIImage imageNamed:@"LogInColorPattern17"];
         UIImage *myGradient2 = [UIImage imageNamed:@"LogInColorPattern"];
        [self.subscribe setTitleColor:[UIColor colorWithPatternImage:myGradient] forState:UIControlStateNormal];
        [self.unsubscribe setTitleColor:[UIColor colorWithPatternImage:myGradient] forState:UIControlStateNormal];
        self.newsletterLabel.textColor   = [UIColor colorWithPatternImage:myGradient2];
    } else {
        UIImage *myGradient = [UIImage imageNamed:@"LogInColorPattern"];
        UIImage *myGradient2 = [UIImage imageNamed:@"LogInColorPattern35"];
        [self.subscribe setTitleColor:[UIColor colorWithPatternImage:myGradient] forState:UIControlStateNormal];
        [self.unsubscribe setTitleColor:[UIColor colorWithPatternImage:myGradient] forState:UIControlStateNormal];
        self.newsletterLabel.textColor   = [UIColor colorWithPatternImage:myGradient2];
    }

}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    self.currentResponder = textField;
}

//Implement resignOnTap:

- (void)resignOnTap:(id)iSender {
    [self.currentResponder resignFirstResponder];
}

- (IBAction)subscribe:(id)sender {
    if (!self.newsletter.on || !self.confirm.on || !self.allow.on) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Please note",nil)
                                                         message:NSLocalizedString(@"You must confirm all three switch to receive the newsletter",nil)
                                                        delegate:self
                                               cancelButtonTitle:NSLocalizedString(@"Ok",nil)
                                               otherButtonTitles: nil];
        
        [alert show];
    } else if (![self validateEmailWithString:self.myEmail.text]) {
       
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Be patient",nil)
                                                         message:NSLocalizedString(@"Please enter a valid e-mail",nil)
                                                        delegate:self
                                               cancelButtonTitle:NSLocalizedString(@"Ok",nil)
                                               otherButtonTitles: nil];
        
        [alert show];
    } else if ([self.myName.text isEqual:@""] || [self.myLastName.text isEqual:@""]){
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Be patient",nil)
                                                         message:NSLocalizedString(@"Please enter a valid first name and last name",nil)
                                                        delegate:self
                                               cancelButtonTitle:NSLocalizedString(@"Ok",nil)
                                               otherButtonTitles: nil];
        [alert show];
    } else {
        
        [self setMailChimp];
    }
    
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    _subscribe.enabled=YES;
    _unsubscribe.enabled=YES;
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (BOOL)validateEmailWithString:(NSString*)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setMailChimp {
    //We can set ChimpKit's timeout globally
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    NSString *displayName=[preferredLang substringToIndex:2];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = MAILCHIMP_LIST_ID;
    params[@"merge_vars"]=@{@"FNAME":self.myName.text,
                            @"LNAME":self.myLastName.text,
                            @"NEWSLETTER":@"Si",
                            @"MAGGIORE":@"Si",
                            @"CONSENSO":@"Si"};
    params[@"email"] = @{@"email": self.myEmail.text};
    params[@"double_optin"] = DOUBLE_OPTIN;
    params[@"update_existing"] = UPDATE_EXISTING;
    params[@"mc_language"]=displayName;
    
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
    
    
    if (appDelegate.locationManager != nil) {
        NSString *latitude = [NSString stringWithFormat:@"%f", appDelegate.locationManager.location.coordinate.latitude];
        NSString *longitude = [NSString stringWithFormat:@"%f", appDelegate.locationManager.location.coordinate.longitude];
        params[@"mc_location"]=@{@"latitude":latitude,@"longitude":longitude};
        
    }
    
    [[ChimpKit sharedKit] callApiMethod:@"lists/subscribe"
                             withParams:params
                   andCompletionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                       if (error) {
                           //Handle connection error
                           NSLog(@"Error, %@", error);
                           dispatch_async(dispatch_get_main_queue(), ^{
                               //Update UI here
                           });
                       }
                       
                       NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       if (kCKDebug) NSLog(@"Response String: %@", responseString);
                       
                       id parsedResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                       
                       if ([parsedResponse[@"email"] isKindOfClass:[NSString class]]) {
                           [self shareButtonPress:@"Subscription"];
                           NSString *title=NSLocalizedString(@"Subscribed !", nil);
                           NSString *message=NSLocalizedString(@"Your email address has been added to our Newsletter!",nil);
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [self showSubscribeError:title andMessage:message];
                           });
                       }
                       if (![parsedResponse isKindOfClass:[NSDictionary class]] || ![parsedResponse[@"email"] isKindOfClass:[NSString class]] || error) {
                          // [self showSubscribeError];
                           
                           if ([parsedResponse[@"code"] intValue]==214) {
                               NSString *title=NSLocalizedString(@"Subscription Failed", nil);
                               NSString *message=NSLocalizedString(@"You are already subscribed to our Newsletter",nil);
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   [self showSubscribeError:title andMessage:message];
                               });
                           }
                       }
                   }];
}

- (IBAction)openMenu:(id)sender {
    
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}
- (IBAction)unsubscribe:(id)sender {
    
    if (![self validateEmailWithString:self.myEmail.text]) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Be patient",nil)
                                                         message:NSLocalizedString(@"Please enter a valid e-mail",nil)
                                                        delegate:self
                                               cancelButtonTitle:NSLocalizedString(@"Ok",nil)
                                               otherButtonTitles: nil];
        
        [alert show];
    } else {
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"id"] = MAILCHIMP_LIST_ID;
    params[@"email"] = @{@"email": self.myEmail.text};
    
    [[ChimpKit sharedKit] callApiMethod:@"lists/unsubscribe"
                             withParams:params
                   andCompletionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                       if (error) {
                           //Handle connection error
                           NSLog(@"Error, %@", error);
                           dispatch_async(dispatch_get_main_queue(), ^{
                               //Update UI here
                           });
                       }
                       
                       NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                       if (kCKDebug) NSLog(@"Response String: %@", responseString);
                       
                       id parsedResponse = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                       
                       if ([parsedResponse[@"complete"] intValue]==1) {
                           [self shareButtonPress:@"Unsubscription"];
                           NSString *title=NSLocalizedString(@"Unsubscribed", nil);
                           NSString *message=NSLocalizedString(@"Your email address has been removed from our Newsletter",nil);
                           dispatch_async(dispatch_get_main_queue(), ^{
                               [self showSubscribeError:title andMessage:message];
                           });
                       }
                       if (![parsedResponse isKindOfClass:[NSDictionary class]] || ![parsedResponse[@"email"] isKindOfClass:[NSString class]] || error) {
                           // [self showSubscribeError];
                           
                           if ([parsedResponse[@"code"] intValue]==215 || [parsedResponse[@"code"] intValue]==232) {
                               NSString *title=NSLocalizedString(@"Unsubscription Failed", nil);
                               NSString *message=NSLocalizedString(@"Your email is not present in our Newsletter",nil);
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   [self showSubscribeError:title andMessage:message];
                               });
                           }
                       }
                   }];
    }
}

-(void)shareButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    if (type) {
        if (![type  isEqual: @"Subscription"]) {
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Newsletter"
                                                                  action:@"press"
                                                                   label:type
                                                                   value:nil] build]];
        } else {
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"Newsletter"
                                                                  action:@"press"
                                                                   label:type
                                                                   value:nil] build]];
        }
    }
    [tracker set:kGAIScreenName value:nil];
}

#pragma mark - Private Methods

- (void)showSubscribeError:(NSString *)title andMessage:(NSString *)message{
    UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:title
                                                             message:message
                                                            delegate:nil
                                                   cancelButtonTitle:@"OK"
                                                   otherButtonTitles:nil];
    [errorAlertView show];
  
}

//- (void)ckRequestSucceeded:(ChimpKit *)ckRequest {
//    NSLog(@"HTTP Status Code: %d", [ckRequest responseStatusCode]);
//    NSLog(@"Response String: %@", [ckRequest responseString]);
//    if ([ckRequest responseStatusCode] == 200) {
//        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:NSLocalizedString(@"Well done",nil)
//                                                         message:NSLocalizedString(@"You are already subscribed to our Newsletter list",nil)
//                                                        delegate:self
//                                               cancelButtonTitle:NSLocalizedString(@"Ok",nil)
//                                               otherButtonTitles: nil];
//        [alert show];
//    }
//}
@end
