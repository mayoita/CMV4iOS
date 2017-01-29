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

@interface CMVQRViewCode ()
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIImageView *qrcode;
@property (strong, nonatomic) FIRDatabaseReference *ref;


@end

@implementation CMVQRViewCode
CIImage *qrcodeImage;
NSString *QRCode;
NSData *data;
CIFilter *filter;



- (void)viewDidLoad {
    [super viewDidLoad];
    self.ref = [[FIRDatabase database] reference];
    self.text.text = NSLocalizedString(@"Prova",nil);
    QRCode =@"Massimo";
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
                break;
            case DE :
               
                break;
            case FR :
                
                break;
            case ES :
                
                break;
            case ZH  :
                
                
                break;
            case RU:
                

                break;
                
            default:
                self.text.text = snapshot.value[@"text"];
                break;
        }
        
        data = [QRCode dataUsingEncoding:NSISOLatin1StringEncoding allowLossyConversion:false];
        filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
        [filter setValue:data forKey:@"inputMessage"];
        [filter setValue:@"Q" forKey:@"inputCorrectionLevel"];
        qrcodeImage = [filter outputImage];
        
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
