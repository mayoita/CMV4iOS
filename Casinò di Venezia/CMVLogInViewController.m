//
//  CMVLogInViewController.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 11/02/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVLogInViewController.h"

#import "UIViewController+ECSlidingViewController.h"
#import "CMVGreenButton.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import "CMVAppDelegate.h"
//#import "AWSIdentityManager.h"
//#import <AWSCognito/AWSCognito.h>
#import "CMVAppDelegate.h"
#import "Firebase.h"
#import <GoogleSignIn/GoogleSignIn.h>

@interface CMVLogInViewController ()
@property (strong, nonatomic) FIRStorage *storageRef;
@property (weak, nonatomic) IBOutlet CMVGreenButton *logIn;
@property (strong, nonatomic) FIRDatabaseReference *refFireDatabase;
@end
NSString *myName;
NSString *nameInProvider;
NSURL *photoURL;
NSString *providerID;
NSString *emailPasswordAccount;

//AWSIdentityManager *identityManager;
@implementation CMVLogInViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
   // identityManager = [AWSIdentityManager sharedInstance];
    UIImage *myGradient = [[UIImage alloc] init];
    if (iPHONE) {
        myGradient = [UIImage imageNamed:@"LogInColorPattern"];
    } else {
        myGradient = [UIImage imageNamed:@"LogInColorPatterniPAD"];
    }
   

    [self.logIn setTitleColor:[UIColor colorWithPatternImage:myGradient] forState:UIControlStateNormal];


    self.pictureImageView.alpha = 0.5;
    self.pictureImageView.layer.masksToBounds = YES;
    [self.pictureImageView.layer setCornerRadius:(self.pictureImageView.frame.size.height/2)];
    [self.pictureImageView.layer setMasksToBounds:YES];
    self.vip.hidden=YES;
    self.badge.hidden=YES;
    _storageRef = [FIRStorage storage];
    _refFireDatabase = [[FIRDatabase database] reference];
  

    //[self setUser];
}

-(void)setUser {
    FIRUser *user = [FIRAuth auth].currentUser;
 
    if (user.uid != nil) {
        for (FIRUser *profile in user.providerData) {
            providerID = profile.providerID;
            nameInProvider = profile.displayName;
            photoURL = profile.photoURL;
            emailPasswordAccount = profile.email;
        }
        //Check if anonymous user
     
        if ([user.providerData  count] == 0) { // && user.email == nil) {
            BOOL isAnonymous = user.anonymous;
            [[[[FIRDatabase database].reference child:@"users"] child:user.uid] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
                //C'è un bug in providerData che non registra il provider EmailPassword quindi devo controllare se si è già loggato con
                //questo metodo
                if (![snapshot.value[@"name"]  isEqual: @"Anonymous"] ) {
                    self.welcomeLabel.text =[NSString stringWithFormat:NSLocalizedString(@"Welcome\n %@", nil), snapshot.value[@"name"] ];
                    if (![snapshot.value[@"profileImageURL"]isEqualToString:@""]) {
                        
                        FIRStorageReference *httpsReference = [self.storageRef referenceForURL:snapshot.value[@"profileImageURL"]];
                        [httpsReference dataWithMaxSize:1 * 2048 * 2048 completion:^(NSData* data, NSError* error){
                            if (error != nil) {
                                // Uh-oh, an error occurred!
                                NSLog(@"%@", error.localizedDescription);
                            } else {
                                dispatch_async(dispatch_get_main_queue(), ^{
                                    self.pictureImageView.image =[UIImage imageWithData:data];
                                    
                                });
                            }
                        }];
                    }
                } else {
                    self.welcomeLabel.text = NSLocalizedString(@"ANONYMOUS USER", @"Placeholder text for the guest user.");
                    [self.logIn setTitle:@"Log in" forState:UIControlStateNormal];
                    return;
                }
                
                
            } withCancelBlock:^(NSError * _Nonnull error) {
                NSLog(@"%@", error.localizedDescription);
            }];
            
            
        } else  {
            //Check in email-password user
            if (nameInProvider == nil) {
                [self setEmailPasswordUser:user];
                
                } else {

                    self.welcomeLabel.text =[NSString stringWithFormat:NSLocalizedString(@"Welcome\n %@", nil), nameInProvider];
                    NSURL *imageUrl = photoURL;
                    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
                    self.pictureImageView.image = [UIImage imageWithData:imageData];
                    [self.logIn setTitle:@"Log out" forState:UIControlStateNormal];
                
        }
        }
    }
}

-(void)setEmailPasswordUser:(FIRUser *)user {
    [self.logIn setTitle:@"Log out" forState:UIControlStateNormal];
    [[[[FIRDatabase database].reference child:@"users"] child:user.uid] observeSingleEventOfType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        
        self.welcomeLabel.text =[NSString stringWithFormat:NSLocalizedString(@"Welcome\n %@", nil), snapshot.value[@"name"] ];
        if (![snapshot.value[@"profileImageURL"]isEqualToString:@""]) {
            
            FIRStorageReference *httpsReference = [self.storageRef referenceForURL:snapshot.value[@"profileImageURL"]];
            [httpsReference dataWithMaxSize:1 * 2048 * 2048 completion:^(NSData* data, NSError* error){
                if (error != nil) {
                    // Uh-oh, an error occurred!
                    NSLog(@"%@", error.localizedDescription);
                } else {
                    dispatch_async(dispatch_get_main_queue(), ^{
                        self.pictureImageView.image =[UIImage imageWithData:data];
                        
                    });
                }
            }];
        }
        
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
}

-(void)presentLogIn {
      //  UIStoryboard *loginStoryboard = [UIStoryboard storyboardWithName:@"SignIn"
       //                                                           bundle:nil];
    CMVAppDelegate *appDelegate=(CMVAppDelegate *)[UIApplication sharedApplication].delegate;
        UIStoryboard *storyboard =appDelegate.storyboard;
    
        UIViewController *loginController = [storyboard instantiateViewControllerWithIdentifier:@"SignInFire"];
        
    
        [self presentViewController:loginController animated:YES completion:NULL];
  
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"LogIn"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
    
    [self setUser];
    
    
//    if (identityManager.userName) {
//        AWSCognito *syncClient = [AWSCognito defaultCognito];
//        AWSCognitoDataset *dataset = [syncClient openOrCreateDataset:@"myDataset"];
//        self.welcomeLabel.text =[NSString stringWithFormat:NSLocalizedString(@"Welcome\n %@", nil), identityManager.userName];
//        if ([dataset stringForKey:@"location"]) {
//            self.birthdayLabel.text =[dataset stringForKey:@"location"];
//        } else {
//            self.birthdayLabel.text = identityManager.userLocation;
//            [dataset setString:identityManager.userLocation forKey:@"location"];
//        }
//        if ([dataset stringForKey:@"email"]) {
//            self.emailLabel.text =[dataset stringForKey:@"email"];
//        } else {
//            self.emailLabel.text = identityManager.userEmail;
//            [dataset setString:identityManager.userEmail forKey:@"email"];
//        }
//        
//        [self.logIn setTitle:@"Log out" forState:UIControlStateNormal];
//        
//        // Create a record in a dataset and synchronize with the server
//
//        [[dataset synchronize] continueWithBlock:^id(AWSTask *task) {
//            // Your handler code here
//            return nil;
//        }];
//    } else {
//        self.welcomeLabel.text = NSLocalizedString(@"GUEST USER", @"Placeholder text for the guest user.");
//    }
//   
//    NSURL *imageUrl = identityManager.imageURL;
//    
//    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl];
//    UIImage *profileImage = [UIImage imageWithData:imageData];
//    if (profileImage) {
//        self.pictureImageView.image = profileImage;
//    } else {
//        self.pictureImageView.image = [UIImage imageNamed:@"UserNew.png"];
//    }
    
}


- (IBAction)openMenu:(id)sender {
   [self.slidingViewController anchorTopViewToRightAnimated:YES];
}


- (IBAction)logOutButton:(id)sender {
    [self logOutButtonPress:@"LogOutButton"];
    FIRUser *user = [FIRAuth auth].currentUser;
    BOOL isAnonymous = user.anonymous;
    if (isAnonymous || [user.providerData  count] == 0) {
        [self.logIn setTitle:@"Log out" forState:UIControlStateNormal];
        [self.view setNeedsLayout];
        [self presentLogIn];
        return;
    }
    if (user != nil) {
        [user unlinkFromProvider:providerID
                             completion:^(FIRUser *user, NSError *error) {
                                 if (error == nil) {
                                     // Provider unlinked from account
                                     NSLog(@"Unlink");
                                 } else {
                                   
                                 }
                             }];
        FIRUserProfileChangeRequest *changeRequest = [user profileChangeRequest];
        
        changeRequest.displayName = @"";
        changeRequest.photoURL =nil;
        [changeRequest commitChangesWithCompletion:^(NSError *_Nullable error) {
            if (error) {
                NSLog(@"An error happened");
            } else {
                NSLog(@"Profile updated");
            }
        }];
        [FBSDKAccessToken setCurrentAccessToken:nil];
        [[GIDSignIn sharedInstance] signOut];
        [self.logIn setTitle:@"Log in" forState:UIControlStateNormal];
        self.welcomeLabel.text = NSLocalizedString(@"ANONYMOUS USER", @"Placeholder text for the guest user.");
        self.birthdayLabel.text = @"";
        self.pictureImageView.image=[UIImage imageNamed:@"UserNew.png"];
        photoURL = nil;
        self.vip.hidden=YES;
        self.badge.hidden=YES;
        [self.view setNeedsLayout];
    
//    if ([[AWSIdentityManager sharedInstance] isLoggedIn]) {
//        [[AWSIdentityManager sharedInstance] logoutWithCompletionHandler:^(id result, NSError *error) {
//            [self.logIn setTitle:@"Log in" forState:UIControlStateNormal];
//            [self.view setNeedsLayout];
//            self.welcomeLabel.text = NSLocalizedString(@"GUEST USER", @"Placeholder text for the guest user.");
//            self.birthdayLabel.text = @"";
//            self.pictureImageView.image=[UIImage imageNamed:@"UserNew.png"];
//            self.emailLabel.text=@"";
//            self.vip.hidden=YES;
//            self.badge.hidden=YES;
//        }];
//
    } else {
        [self.logIn setTitle:@"Log out" forState:UIControlStateNormal];
        [self.view setNeedsLayout];
        [self presentLogIn];
    }

}
-(void)logOutButtonPress:(NSString *)type{
    
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];

    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"LOGGING"
                                                              action:@"press"
                                                               label:type
                                                               value:nil] build]];
    
    [tracker set:kGAIScreenName value:nil];
}





@end
