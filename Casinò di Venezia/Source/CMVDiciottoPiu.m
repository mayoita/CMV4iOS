//
//  CMVDiciottoPiu.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 27/02/15.
//  Copyright (c) 2015 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVDiciottoPiu.h"

@implementation CMVDiciottoPiu

-(void)awakeFromNib {
    self.delegate = self;
    self.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:(__bridge NSString *)kCTUnderlineStyleAttributeName];
    
    self.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
    self.delegate = self;
    self.text = NSLocalizedString(@"UNDER 18 ARE NOT ALLOWED TO GAMBLE. GAMBLING CAN BE PATHOLOGICALLY ADDICTIVE.GO TO PROBABILITY OF WINNING.", @"per diciottopiù"); // Repository URL will be automatically detected and linked
    
    NSRange range = [ self.text rangeOfString:NSLocalizedString(@"GO TO PROBABILITY OF WINNING.", nil)];
    [ self addLinkToURL:[NSURL URLWithString:NSLocalizedString(@"http://www.casinovenezia.it/en/probability-winning.html", @"link")] withRange:range];
}

//-(id)initWithCoder:(NSCoder *)aDecoder {
//    self = [super initWithCoder:aDecoder];
//    if(self){
//        self.delegate = self;
//        self.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:(__bridge NSString *)kCTUnderlineStyleAttributeName];
//        
//        self.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
//        self.delegate = self;
//        self.text = NSLocalizedString(@"UNDER 18 ARE NOT ALLOWED TO GAMBLE. GAMBLING CAN BE PATHOLOGICALLY ADDICTIVE.GO TO PROBABILITY OF WINNING.", @"per diciottopiù"); // Repository URL will be automatically detected and linked
//        
//        NSRange range = [ self.text rangeOfString:NSLocalizedString(@"GO TO PROBABILITY OF WINNING.", nil)];
//        [ self addLinkToURL:[NSURL URLWithString:NSLocalizedString(@"http://www.casinovenezia.it/en/probability-winning.html", @"link")] withRange:range];
//    }
//    
//    
//    return self;
//}

-(id)init {
    self = [super init];
    if(self){
        self.delegate = self;

        self.textColor = [UIColor whiteColor];
        
        self.minimumScaleFactor = 0.5f;
       
     //   if (iPHONE) {
            self.font = [UIFont fontWithName:@"Arial" size:8];
            self.frame=CGRectMake(61, 26, 250, 21);
            self.numberOfLines = 0;
        
//        } else {
//            self.numberOfLines = 1;
//            self.font = [UIFont fontWithName:@"Arial" size:13];
//            self.frame=CGRectMake(72, 25, 750, 21);
//        }
       
        self.adjustsFontSizeToFitWidth = YES;
        self.linkAttributes = [NSDictionary dictionaryWithObject:[NSNumber numberWithBool:YES] forKey:(__bridge NSString *)kCTUnderlineStyleAttributeName];
        
        self.enabledTextCheckingTypes = NSTextCheckingTypeLink; // Automatically detect links when the label text is subsequently changed
        self.delegate = self;
        self.text = NSLocalizedString(@"UNDER 18 ARE NOT ALLOWED TO GAMBLE. GAMBLING CAN BE PATHOLOGICALLY ADDICTIVE.GO TO PROBABILITY OF WINNING.", @"per diciottopiù"); // Repository URL will be automatically detected and linked
        
        NSRange range = [ self.text rangeOfString:NSLocalizedString(@"GO TO PROBABILITY OF WINNING.", nil)];
        [ self addLinkToURL:[NSURL URLWithString:NSLocalizedString(@"http://www.casinovenezia.it/en/probability-winning.html", @"link")] withRange:range];
    }
    
    
    return self;
}




- (void)attributedLabel:(__unused TTTAttributedLabel *)label
   didSelectLinkWithURL:(NSURL *)url {
    [[UIApplication sharedApplication] openURL:url];
}

@end
