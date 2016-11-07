//
//  CMVLocalize.m
//  Casinò di Venezia
//
//  Created by Massimo Moro on 18/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import "CMVLocalize.h"



@implementation NSObject(MyDeviceLocaleExtension)


+(int)myDeviceLocaleIs
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    NSString *displayName=[preferredLang substringToIndex:2];
    
    
    if ([displayName isEqualToString:@"it"]) {
        
        return 1;
    } else  if ([displayName isEqualToString:@"en"]) {
        
        return 0;
    } else if ([displayName isEqualToString:@"de"]) {
        
        return 2;
    } else if ([displayName isEqualToString:@"fr"]) {
        
        return 3;
    } else if ([displayName isEqualToString:@"es"]) {
        
        return 4;
    } else if ([displayName isEqualToString:@"ru"]) {
        
        return 5;
    } else if ([displayName isEqualToString:@"zh"]) {
        
        return 6;
    } else {
        return 0;
    }
}

@end

@implementation CMVLocalize


@end
