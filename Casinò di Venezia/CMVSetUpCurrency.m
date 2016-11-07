//
//  CMVSetUpCurrency.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVSetUpCurrency.h"
@interface CMVSetUpCurrency ()<NSURLConnectionDelegate>{
    NSMutableData *_responseData;
    
}
@property (strong, nonatomic)UIRefreshControl *refreshControl;

@property(strong,nonatomic)NSString *currencyCode;
@property (strong,nonatomic)NSLocale *myLocale;
@end

@implementation CMVSetUpCurrency
static float exchangeRates;
@synthesize currencyCode=_currencyCode;


-(id)init{
    self = [super init];
    
    _currencyCode = [[NSLocale currentLocale] objectForKey:NSLocaleCurrencyCode];
 
    return self;
}

-(NSString *)setupCurrency:(NSString *)currency {
    NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler
                                       decimalNumberHandlerWithRoundingMode:NSRoundUp
                                       scale:2
                                       raiseOnExactness:NO
                                       raiseOnOverflow:NO
                                       raiseOnUnderflow:NO
                                       raiseOnDivideByZero:YES];
    
    
    static NSString *currencyFormatterKey = @"HTCurrencyFormatter";
    NSNumberFormatter *currencyFormatter = [[NSThread currentThread] threadDictionary][currencyFormatterKey];
    NSDecimalNumber *total;
    NSDecimalNumber *myCurrency = [NSDecimalNumber decimalNumberWithString:currency];
    if (currencyFormatter == nil){
    
        currencyFormatter = [[NSNumberFormatter alloc] init];
        [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
        [currencyFormatter setLocale:[NSLocale currentLocale]];
        [currencyFormatter setMaximumFractionDigits:2];
        
        [[NSThread currentThread] threadDictionary][currencyFormatterKey] = currencyFormatter;
    
    }

    if (self.exchangeRates != 0) {
        NSString *myExchangeRates = [NSString stringWithFormat:@"%f", self.exchangeRates];
      
        NSDecimalNumber *rates = [NSDecimalNumber decimalNumberWithString:myExchangeRates];
        total = [myCurrency decimalNumberByDividingBy:rates withBehavior:roundUp];

        [currencyFormatter setLocale:[NSLocale currentLocale]];
        
    } else {
       
        total = myCurrency;
        [currencyFormatter setLocale:[NSLocale currentLocale]];
        
    }

    NSString *formattedCurrencyString = [currencyFormatter stringFromNumber:[NSNumber numberWithDouble:[total doubleValue]]];
    
    
    return formattedCurrencyString;
}

-(float)exchangeRates {
    
    if(!exchangeRates) {
        
        NSString *urlForExchangeRates=[NSString stringWithFormat:@"http://rate-exchange.appspot.com/currency?from=%@&to=EUR", self.currencyCode];
        NSURL *url = [NSURL URLWithString:urlForExchangeRates];
        
        NSURLRequest *request = [NSURLRequest requestWithURL:url
                                                        cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                                    timeoutInterval:20.0];
        
        
        NSURLConnection *conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    }
    
    return exchangeRates;
}


#pragma mark -
#pragma mark NSURLConnectionDelegete
#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    _responseData = [[NSMutableData alloc] init];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [_responseData appendData:data];
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    return nil;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:_responseData
                          options:kNilOptions
                          error:nil];
    if (![json objectForKey:@"err"]) {
        exchangeRates = [[json objectForKey:@"rate"] floatValue];
        
    }
    
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"Request for exchange rates failed!");
}
@end
