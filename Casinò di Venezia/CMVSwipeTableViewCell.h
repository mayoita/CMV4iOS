//
//  CMVSwipeTableViewCell.h
//  Casinò di Venezia
//
//  Created by Massimo Moro on 28/10/13.
//  Copyright (c) 2013 Casinò di Venezia SPA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "CMVVoiceOpen.h"

@class CMVSwipeTableViewCell;

@protocol CMVTableViewCellDelegate <NSObject>

- (void)swippableTableViewCell:(CMVSwipeTableViewCell *)cell didTriggerRightUtilityButtonWithIndex:(NSInteger)index;
- (void)tapTableViewCell:(CMVSwipeTableViewCell *)cell;
@end

@interface CMVSwipeTableViewCell : UITableViewCell <AVSpeechSynthesizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *eventName;
@property (weak, nonatomic) IBOutlet UIImageView *eventPicture;
@property (weak, nonatomic) IBOutlet UILabel *eventDescription;
@property (strong, nonatomic)  NSString *eventMemo;
@property (weak, nonatomic) IBOutlet UILabel *eventStartDate;
@property (weak, nonatomic) IBOutlet UILabel *eventEndDate;
@property (strong, nonatomic) UIImageView *readDescriptionS;

@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (strong,nonatomic)UILabel *labelForPoker;
@property (strong,nonatomic)UILabel *dateForPoker;
@property (weak, nonatomic) IBOutlet UIView *demoView;

@property (strong,nonatomic)UIImage *snapshoot;
@property(strong,nonatomic)UIImageView *picture;
@property (nonatomic)CGFloat myWidth;
@property (nonatomic)BOOL talking;
// Views that live in the scroll view
@property (nonatomic, weak) UIView *scrollViewContentView;


@property (nonatomic, strong) NSArray *rightUtilityButtons;
@property (nonatomic) id <CMVTableViewCellDelegate> delegate;

@property (nonatomic, strong)NSDate *startDate;
@property(nonatomic,strong)NSDate *endDate;
@property(nonatomic,strong)NSString *eventURL;

-(void)initWithHeight:(CGFloat)height rightUtilityButtons:(NSArray *)rightUtilityButtons;

@end

@interface NSMutableArray (SWUtilityButtons)

- (void)addUtilityButtonWithColor:(UIColor *)color title:(NSString *)title;
- (void)addUtilityButtonWithColor:(UIColor *)color icon:(UIImage *)icon;

@end
