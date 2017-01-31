//
//  CMVQRViewCode.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 27/01/17.
//  Copyright © 2017 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVQRViewCode.h"
#import "UIViewController+ECSlidingViewController.h"
#import "Firebase.h"
#import "CMVLocalize.h"
#import "CMVMenuButton.h"

@interface CMVQRViewCode ()
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIImageView *qrcode;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak, nonatomic) IBOutlet UITextView *footer;
@property (weak, nonatomic) IBOutlet CMVMenuButton *menuButton;



@end

@implementation CMVQRViewCode
CIImage *qrcodeImage;
NSString *QRCode;
NSData *data;
CIFilter *filterQR;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.menuButton.color=[UIColor blackColor];
    self.ref = [[FIRDatabase database] reference];
    self.text.text = NSLocalizedString(@"No Internet Connection",nil);
   
    data = [QRCode dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
    [self generaQR];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)openMenu:(id)sender {
    [self.slidingViewController anchorTopViewToRightAnimated:YES];
}

-(void)generaQR {
    [[_ref child:@"QRCode"]  observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        // Get user value
        QRCode = snapshot.value[@"code"];
        switch ([CMVLocalize myDeviceLocaleIs]) {
            case IT :
                self.text.text = snapshot.value[@"textIT"];
                self.footer.text = snapshot.value[@"footerIT"];
                break;
            case DE :
               self.text.text = snapshot.value[@"textDE"];
                self.footer.text = snapshot.value[@"footerDE"];
                break;
            case FR :
                self.text.text = snapshot.value[@"textFR"];
                self.footer.text = snapshot.value[@"footerFR"];
                break;
            case ES :
                self.text.text = snapshot.value[@"textES"];
                self.footer.text = snapshot.value[@"footerES"];
                break;
            case ZH  :
                self.text.text = snapshot.value[@"textZH"];
                self.footer.text = snapshot.value[@"textIT"];
                break;
            case RU:
                self.text.text = snapshot.value[@"textRU"];
                self.footer.text = snapshot.value[@"footerRU"];
                break;
                
            default:
                self.text.text = snapshot.value[@"text"];
                self.footer.text = snapshot.value[@"footer"];
                break;
        }
        
        data = [QRCode dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
        filterQR = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        [filterQR setValue:data forKey:@"inputMessage"];
        [filterQR setValue:@"Q" forKey:@"inputCorrectionLevel"];
        qrcodeImage = [filterQR outputImage];
        
        [self displayQRCodeImage];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
}

-(void)displayQRCodeImage{
    CGFloat scaleX = self.qrcode.frame.size.width / qrcodeImage.extent.size.width;
    CGFloat scaleY = self.qrcode.frame.size.height / qrcodeImage.extent.size.height;
    
    CIImage *transformedImage =[qrcodeImage imageByApplyingTransform:CGAffineTransformMakeScale(scaleX,scaleY)];
    
    self.qrcode.image = [UIImage imageWithCIImage:transformedImage ];
    
}
@end
