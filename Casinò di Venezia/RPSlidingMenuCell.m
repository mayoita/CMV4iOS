/***********************************************************************************
 *
 * Copyright (c) 2014 Robots and Pencils Inc.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 *
 ***********************************************************************************/

#import "RPSlidingMenuCell.h"



#define TEXT_TAG 1
#define EURO_TAG 2

#define NUMBER_OF_CELL 3

const CGFloat RPSlidingCellFeatureHeight = 100.0f;
const CGFloat RPSlidingCellFeatureHeight_IPAD = 270.0f;
const CGFloat RPSlidingCellNormalHeight = 40.0f; //55 pr 3.5''
const CGFloat RPSlidingCellNormalHeight_IPAD = 70.0f; //55 pr 3.5''
const CGFloat RPSlidingCellDetailTextPadding = 10.0f;
const CGFloat RPSlidingMenuNormalImageCoverAlpha = 0.3f;
const CGFloat RPSlidingMenuFeaturedImageCoverAlpha = 0.0f;
const CGFloat startY = 0.0f;
const CGFloat TextLabelHeight = 20.0f;
const CGFloat TextLabelHeightiPad = 55.0f;

@interface RPSlidingMenuCell ()<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UIView *imageCover;

@end

@implementation RPSlidingMenuCell
int menuIndex=0;
- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];

    if (self) {
        self.clipsToBounds = YES;
        
        [self setupTextLabel];
//      [self setupDetailTextLabel];
        [self setupTable];
        [self setupImageView];
    }

    return self;
}



#pragma - mark label and image view setups

// We do this in code so there is no resources to bundle up
-(CGFloat)addHeightToRPSlidingCellFeatureHeight {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    
    if (screenRect.size.height == 568) {
        return RPSlidingCellFeatureHeight + 50;
    }
    if (screenRect.size.height == 667) {
        return RPSlidingCellFeatureHeight + 135;
    }
    if (screenRect.size.height == 736) {
        return RPSlidingCellFeatureHeight + 200;
    }
    return RPSlidingCellFeatureHeight;
}

-(void)setupTable {
    CGRect screenRect = [[UIScreen mainScreen] bounds];

    if (iPHONE) {
       
        self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, TextLabelHeight, screenRect.size.width, [self addHeightToRPSlidingCellFeatureHeight]-TextLabelHeight)];
        
    } else {
        
        self.menuTableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0f, TextLabelHeightiPad, screenRect.size.width, RPSlidingCellFeatureHeight_IPAD-TextLabelHeightiPad)];
    }
    
    self.menuTableView.backgroundColor=[UIColor clearColor];
    self.menuTableView.delegate=self;
    self.menuTableView.dataSource=self;
    [self.contentView addSubview:self.menuTableView];
 
}


- (void)setupTextLabel {

    CGRect screenRect = [[UIScreen mainScreen] bounds];
   
    //self.textLabel.center = self.contentView.center;
    if (iPHONE) {
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(RPSlidingCellDetailTextPadding, 3.0f, screenRect.size.width, TextLabelHeight)];
        self.textLabel.font = VENICE_CASINO_BOLD(18);
    } else {
        self.textLabel = [[UILabel alloc] initWithFrame:CGRectMake(RPSlidingCellDetailTextPadding, 3.0f, screenRect.size.width, TextLabelHeightiPad)];
        self.textLabel.font = VENICE_CASINO_BOLD(25);
    }
    self.textLabel.textColor = [UIColor blackColor];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.backgroundColor=[UIColor clearColor];
    NSLog(@"Label: %@", NSStringFromCGRect(self.textLabel.frame));
    [self.contentView addSubview:self.textLabel];
    NSLog(@"Screen setupTextLabel: %@", NSStringFromCGRect(self.frame));
}

- (void)setupDetailTextLabel {

    NSAssert(self.textLabel != nil, @"the text label must be set up before this so it can use its frame");
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat startY = 40.0f;
    if (iPHONE) {
        self.detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(RPSlidingCellDetailTextPadding, startY, screenRect.size.width - (RPSlidingCellDetailTextPadding * 2), 80.0f)];
    } else {
    self.detailTextLabel = [[UILabel alloc] initWithFrame:CGRectMake(RPSlidingCellDetailTextPadding, startY, screenRect.size.width - (RPSlidingCellDetailTextPadding * 2), 100.0f)];
        NSLog(@"Size: %@", NSStringFromCGRect(self.detailTextLabel.frame));
    }
    //self.detailTextLabel.lineBreakMode = NSLineBreakByWordWrapping;
   
    self.detailTextLabel.numberOfLines = 0;

    if (iPHONE) {
        self.detailTextLabel.font = GOTHAM_Medium(10);
    } else {
    self.detailTextLabel.font = GOTHAM_Medium(20);
    }
    self.detailTextLabel.textColor = [UIColor blackColor];
    self.detailTextLabel.textAlignment = NSTextAlignmentLeft;
    self.detailTextLabel.backgroundColor=[UIColor clearColor];
    [self.contentView addSubview:self.detailTextLabel];

}

- (void)setupImageView {

    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (iPHONE) {
        self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, screenRect.size.width, [self addHeightToRPSlidingCellFeatureHeight])];
    } else {
    self.backgroundImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, screenRect.size.width, RPSlidingCellFeatureHeight_IPAD)];
    }
    self.backgroundImageView.clipsToBounds = YES;
    self.backgroundImageView.center = self.contentView.center;
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.backgroundImageView.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;

    // add a cover that we can fade in a black tint
    self.imageCover = [[UIView alloc] initWithFrame:self.backgroundImageView.frame];
    self.imageCover.backgroundColor = [UIColor blackColor];
    self.imageCover.alpha = 0.6f;
    self.imageCover.autoresizingMask = self.backgroundImageView.autoresizingMask;
    [self.backgroundImageView addSubview:self.imageCover];
    [self.contentView insertSubview:self.backgroundImageView atIndex:0];
    [self.contentView insertSubview:self.imageCover atIndex:1];
  
}


- (void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes {
    CGFloat featureNormaHeightDifference;
    if (iPHONE) {
         featureNormaHeightDifference = [self addHeightToRPSlidingCellFeatureHeight] - RPSlidingCellNormalHeight;
    } else {
        featureNormaHeightDifference = RPSlidingCellFeatureHeight_IPAD - RPSlidingCellNormalHeight_IPAD;
    }

    // how much its grown from normal to feature
    CGFloat amountGrown;
    if (iPHONE) {
          amountGrown = [self addHeightToRPSlidingCellFeatureHeight] - self.frame.size.height;
    } else {
        amountGrown = RPSlidingCellFeatureHeight_IPAD - self.frame.size.height;
    }
    
    // percent of growth from normal to feature
    CGFloat percentOfGrowth = 1 - (amountGrown / featureNormaHeightDifference);
    
    //Curve the percent so that the animations move smoother
    percentOfGrowth = sin(percentOfGrowth * M_PI_2);
    
    //CGFloat scaleAndAlpha = MAX(percentOfGrowth, 0.5f);

    // scale title as it collapses but keep origin x the same and the y location proportional to view height.  Also fade in alpha
    //self.textLabel.transform = CGAffineTransformMakeScale(scaleAndAlpha, scaleAndAlpha);
    self.menuTableView.alpha=percentOfGrowth;
    //self.textLabel.center = self.contentView.center;

    // keep detail just under text label
    if (iPHONE) {
        self.detailTextLabel.center = CGPointMake(self.center.x, self.textLabel.center.y + 80.0f);
    } else {
        self.detailTextLabel.center = CGPointMake(self.center.x, self.textLabel.center.y + 100.0f);
    }
    

    // its convenient to set the alpha of the fading controls to the percent of growth value
    self.detailTextLabel.alpha = percentOfGrowth;
    
    // when full size, alpha of imageCover should be 20%, when collapsed should be 90%
    self.imageCover.alpha = RPSlidingMenuNormalImageCoverAlpha - (percentOfGrowth * (RPSlidingMenuNormalImageCoverAlpha - RPSlidingMenuFeaturedImageCoverAlpha));

}

#pragma mark - UITableViewDataSource Methods and Delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return NUMBER_OF_CELL;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *myCellView = nil;
    UILabel *textMenu, *euroMenu;
    
  
    
    static NSString *TableViewCellIdentifier = @"MenuCell";
    
    //this method dequeues an existing cell if one is available or creates a new one
    //if no cell is available for reuse, this method returns nil
    myCellView = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    
        
    if (myCellView == nil){
        myCellView = [[UITableViewCell alloc]
                      initWithStyle:UITableViewCellStyleDefault
                      reuseIdentifier:TableViewCellIdentifier];
        myCellView.backgroundColor=[UIColor clearColor];
        
        CGRect myFrame=CGRectZero;
        //create custom labels and button inside the cell view
        if (iPHONE) {
            myFrame = CGRectMake(RPSlidingCellDetailTextPadding, 0.0, 220, tableView.frame.size.height/NUMBER_OF_CELL);
        } else {
            myFrame = CGRectMake(RPSlidingCellDetailTextPadding, 0.0, 500, tableView.frame.size.height/NUMBER_OF_CELL);
        }
        textMenu = [[UILabel alloc] initWithFrame:myFrame];
        textMenu.tag = TEXT_TAG;
        textMenu.numberOfLines=0;
        textMenu.adjustsFontSizeToFitWidth=YES;
        textMenu.minimumScaleFactor=0.5;
        //Settings for iOS 6.0
        textMenu.backgroundColor=[UIColor clearColor];
        textMenu.adjustsLetterSpacingToFitWidth=YES;
        [myCellView.contentView addSubview:textMenu];
        
        CGRect myFrame2=CGRectZero;
        if (iPHONE) {
            myFrame2 = CGRectMake(242.0, 0.0, 78, tableView.frame.size.height/NUMBER_OF_CELL);
        } else {
            myFrame2 = CGRectMake(515.0f, 0.0, 100, tableView.frame.size.height/NUMBER_OF_CELL);
        }
        euroMenu = [[UILabel alloc] initWithFrame:myFrame2];
        euroMenu.tag = EURO_TAG;
        //Settings for iOS 6.0
        euroMenu.backgroundColor=[UIColor clearColor];
        [myCellView.contentView addSubview:euroMenu];
        
        
        
    }
    else {
        textMenu = (UILabel *)[myCellView.contentView viewWithTag:TEXT_TAG];
        euroMenu = (UILabel *)[myCellView.contentView viewWithTag:EURO_TAG];
        
    }
    
    if (iPHONE) {
        textMenu.font = VENICE_CASINO(14);
        euroMenu.font = VENICE_CASINO(14);
    } else {
        textMenu.font = VENICE_CASINO(20);
        euroMenu.font = VENICE_CASINO(20);
    }
   
    if (indexPath.row*2 < [self.dataMenu count]) {
        textMenu.text=self.dataMenu[indexPath.row*2];
        euroMenu.text=self.dataMenu[indexPath.row*2+1];
    }
    


    return myCellView;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    return tableView.frame.size.height/NUMBER_OF_CELL;
}


@end
