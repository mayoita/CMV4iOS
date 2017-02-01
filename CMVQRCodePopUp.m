//
//  CMVQRCodePopUp.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 01/02/17.
//  Copyright © 2017 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVQRCodePopUp.h"
#import "Firebase.h"
#import "CMVLocalize.h"
#import "CMVCloseButton.h"

@interface CMVQRCodePopUp ()
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIImageView *qrcode;
@property (strong, nonatomic) FIRDatabaseReference *ref;
@property (weak, nonatomic) IBOutlet UITextView *footer;
@property (weak, nonatomic) IBOutlet CMVCloseButton *menuButton;
@end

@implementation CMVQRCodePopUp
CIImage *qrcodeImageP;
NSString *QRCodeP;
NSData *dataP;
CIFilter *filterQRP;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.menuButton.color=[UIColor blackColor];
    self.ref = [[FIRDatabase database] reference];
    self.text.text = NSLocalizedString(@"No Internet Connection",nil);
    
    dataP = [QRCodeP dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
    [self generaQR];
}

- (IBAction)close:(id)sender {
    [self.presentingViewController
     dismissViewControllerAnimated:YES completion:^{}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)generaQR {
    [[_ref child:@"QRCode"]  observeEventType:FIRDataEventTypeValue withBlock:^(FIRDataSnapshot * _Nonnull snapshot) {
        // Get user value
        QRCodeP = snapshot.value[@"code"];
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
        
        dataP = [QRCodeP dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
        filterQRP = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        [filterQRP setValue:dataP forKey:@"inputMessage"];
        [filterQRP setValue:@"Q" forKey:@"inputCorrectionLevel"];
        qrcodeImageP = [filterQRP outputImage];
        
        [self displayQRCodeImage];
    } withCancelBlock:^(NSError * _Nonnull error) {
        NSLog(@"%@", error.localizedDescription);
    }];
    
}

-(void)displayQRCodeImage{
    CGFloat scaleX = self.qrcode.frame.size.width / qrcodeImageP.extent.size.width;
    CGFloat scaleY = self.qrcode.frame.size.height / qrcodeImageP.extent.size.height;
    
    CIImage *transformedImage =[qrcodeImageP imageByApplyingTransform:CGAffineTransformMakeScale(scaleX,scaleY)];
    
    self.qrcode.image = [UIImage imageWithCIImage:transformedImage ];
    
}

@end
