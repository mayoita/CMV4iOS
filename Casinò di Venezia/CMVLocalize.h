//
//  CMVLocalize.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 18/03/14.
//  Copyright (c) 2014 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CMVLocalize : NSObject

@end
@interface NSObject(MyDeviceLocaleExtension)
/** Convience method for getting access to the ECSlidingViewController instance */
+(int)myDeviceLocaleIs;
@end

