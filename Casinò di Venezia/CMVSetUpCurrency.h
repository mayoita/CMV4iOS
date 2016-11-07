//
//  CMVSetUpCurrency.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/04/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMVSetUpCurrency : NSObject


-(float)exchangeRates;
-(NSString *)setupCurrency:(NSString *)currency;
@end
