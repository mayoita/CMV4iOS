//
//  CMVConstants.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 29/11/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


#define RESTAURANT_INFO_FONT_LABEL @"Avenir-Black"
#define RESTAURANT_INFO_SIZE_LABEL 14.0f
#define RESTAURANT_INFO_FONT_TEXT @"Avenir"
#define RESTAURANT_INFO_SIZE_TEXT 12.0f
#define RESTAURANT_TITLE_FONT @"Avenir"
#define RESTAURANT_TITLE_SIZE 18.0f
#define RESTAURANT_TEXT_FONT @"Avenir"
#define RESTAURANT_TEXT_SIZE 14.0f

#define GAME_TITLE_FONT @"GothamBook"
#define GAME_TITLE_SIZE 14.0f
#define GAME_TEXT_FONT @"Gotham-XLight"
#define GAME_TEXT_SIZE 12.0f

#define GAME_TITLE_FONT_IPAD @"Avenir-Black"
#define GAME_TITLE_SIZE_IPAD 25.0f
#define GAME_TEXT_FONT_IPAD @"Avenir"
#define GAME_TEXT_SIZE_IPAD 22.0f

#define RESTAURANT_INFO_FONT_LABEL_IPAD @"Avenir-Black"
#define RESTAURANT_INFO_SIZE_LABEL_IPAD 25.0f
#define RESTAURANT_INFO_FONT_TEXT_IPAD @"Avenir"
#define RESTAURANT_INFO_SIZE_TEXT_IPAD 20.0f

#define LogInLabel @"Avenir-Black"
#define LogInLabelSize 20.0f
//TODO: Remember to check compatibility for ios 6 & 7 fonts
#define MENU_FONT_TEXT @"Cochin-Italic"
#define MENU_SIZE_TEXT 25.0f
#define MENU_FONT_TEXT_IPAD @"Cochin-Italic"
#define MENU_SIZE_TEXT_IPAD 35.0f

#define MENU_FONT_LABEL @"Cochin-Italic"
#define MENU_SIZE_LABEL 30.0f
#define MENU_FONT_LABEL_IPAD @"Cochin-Italic"
#define MENU_SIZE_LABEL_IPAD 45.0f

#define GOTHAM_BOOK(theFontSize) [UIFont fontWithName:@"GothamBook" size:theFontSize]
#define GOTHAM_XLight(theFontSize) [UIFont fontWithName:@"Gotham-XLight" size:theFontSize]
#define GOTHAM_Thin(theFontSize) [UIFont fontWithName:@"GothamThin" size:theFontSize]
#define GOTHAM_Medium(theFontSize) [UIFont fontWithName:@"GothamMedium" size:theFontSize]
#define AECHE(theFontSize) [UIFont fontWithName:@"AachenBoldPlain" size:theFontSize]
#define VENICE_CASINO(theFontSize) [UIFont fontWithName:@"VeniceCasino-Italic" size:theFontSize]
#define VENICE_CASINO_BOLD(theFontSize) [UIFont fontWithName:@"VeniceCasino-BoldItalic" size:theFontSize]

#define CenterButtonOffset 8.0f
//Ora ultima navetta in secondi
#define LastBusInSeconds 17000
#define DayInSeconds 86400

#define MAILCHIMP_LIST_ID @"14754c0c1b"
//TODO: Chek for production
#define DOUBLE_OPTIN @"false"
#define UPDATE_EXISTING @"false"

#define IT 1
#define EN 0
#define DE 2
#define FR 3
#define ES 4
#define RU 5
#define ZH 6


#define BRAND_YELLOW_COLOR [UIColor colorWithRed:212.0/255.0 green:169/255.0 blue:1/255.0 alpha:1]
#define BRAND_RED_COLOR [UIColor colorWithRed:121.0/255.0 green:15/255.0 blue:21/255.0 alpha:1]
#define BRAND_GREEN_COLOR [UIColor colorWithRed:45.0/255.0 green:113/255.0 blue:39/255.0 alpha:1]

#define POKER_HOUR @"POKER HOUR"

@interface CMVConstants : NSObject
extern const CLLocationCoordinate2D PALAZZO_LOREDAN_VENDRAMIN ;
extern const CLLocationCoordinate2D CA_NOGHERA ;

+(NSArray *)labelWidth;
+(NSArray *)labelText;
@end
