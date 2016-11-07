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

const CGFloat RPSlidingCellDragInterval = 120.0f;
const CGFloat RPSlidingCellDragInterval_IPAD = 200.0f;

#import "RPSlidingMenuLayout.h"
#import "RPSlidingMenuCell.h"

@interface RPSlidingMenuLayout ()

@property (strong, nonatomic) NSDictionary *layoutAttributes;

@end

@implementation RPSlidingMenuLayout

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

- (void)prepareLayout {

    [super prepareLayout];

    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;

    NSInteger topFeatureIndex = [self currentCellIndex];

    CGFloat topCellsInterpolation =  [self currentCellIndex] - topFeatureIndex;

    NSMutableDictionary *layoutAttributes = [NSMutableDictionary dictionary];
    NSIndexPath *indexPath;

    // last rect will be used to calculate frames past the first one.  We initialize it to a non junk 0 value
    CGRect lastRect;
    if (iPHONE) {
         lastRect = CGRectMake(0.0f, 0.0f, screenWidth, RPSlidingCellNormalHeight);
    } else {
     lastRect = CGRectMake(0.0f, 0.0f, screenWidth, RPSlidingCellNormalHeight_IPAD);
    }
    NSInteger numItems = [self.collectionView numberOfItemsInSection:0];

    for (NSInteger itemIndex = 0; itemIndex < numItems; itemIndex++) {
        indexPath = [NSIndexPath indexPathForItem:itemIndex inSection:0];

        UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
        attributes.zIndex = itemIndex;
        CGFloat yValue = 0.0f;

        if (indexPath.row == topFeatureIndex) {
            // our top feature cell
            CGFloat yOffset;
            if (iPHONE) {
                 yOffset = RPSlidingCellNormalHeight  *topCellsInterpolation;
            } else {
             yOffset = RPSlidingCellNormalHeight_IPAD  *topCellsInterpolation;
            }
            yValue = self.collectionView.contentOffset.y - yOffset;
            if (iPHONE) {
                attributes.frame = CGRectMake(0.0f, yValue , screenWidth, [self addHeightToRPSlidingCellFeatureHeight]);
            } else {
            attributes.frame = CGRectMake(0.0f, yValue , screenWidth, RPSlidingCellFeatureHeight_IPAD);
            }
        } else if (indexPath.row == (topFeatureIndex + 1) && indexPath.row != numItems) {
            // the cell after the feature which grows into one as it goes up unless its the last cell (back to top)
            yValue = lastRect.origin.y + lastRect.size.height;
            CGFloat bottomYValue;
            if (iPHONE) {
                bottomYValue = yValue + RPSlidingCellNormalHeight;
            } else {
             bottomYValue = yValue + RPSlidingCellNormalHeight_IPAD;
            }
            CGFloat amountToGrow;
            if (iPHONE) {
                 amountToGrow = MAX(([self addHeightToRPSlidingCellFeatureHeight] - RPSlidingCellNormalHeight) *topCellsInterpolation, 0);
            } else {
             amountToGrow = MAX((RPSlidingCellFeatureHeight_IPAD - RPSlidingCellNormalHeight_IPAD) *topCellsInterpolation, 0);
            }
            CGFloat newHeight;
            if (iPHONE) {
                newHeight = RPSlidingCellNormalHeight + amountToGrow;
            } else {
             newHeight = RPSlidingCellNormalHeight_IPAD + amountToGrow;
            }
            attributes.frame = CGRectMake(0.0f, bottomYValue - newHeight, screenWidth, newHeight);
        } else {
            // all other cells above or below those on screen
            yValue = lastRect.origin.y + lastRect.size.height;
            if (iPHONE) {
                attributes.frame = CGRectMake(0.0f, yValue, screenWidth, RPSlidingCellNormalHeight);
            } else {
                attributes.frame = CGRectMake(0.0f, yValue, screenWidth, RPSlidingCellNormalHeight_IPAD);
            }
           
        }

        lastRect = attributes.frame;
        [layoutAttributes setObject:attributes forKey:indexPath];
    }

    self.layoutAttributes = layoutAttributes;
}

- (CGFloat)currentCellIndex {
    if (iPHONE) {
        return (self.collectionView.contentOffset.y / RPSlidingCellDragInterval);
    } else {
    return (self.collectionView.contentOffset.y / RPSlidingCellDragInterval_IPAD);
    }
}


- (CGSize)collectionViewContentSize {

    NSInteger numberOfItems = [self.collectionView numberOfItemsInSection:0];
    CGFloat height;
    if (iPHONE) {
         height = (numberOfItems+1) * RPSlidingCellDragInterval + [self addHeightToRPSlidingCellFeatureHeight] ;
    } else {
     height = (numberOfItems+1) * RPSlidingCellDragInterval_IPAD + RPSlidingCellFeatureHeight_IPAD ;
    }
    return CGSizeMake(self.collectionView.frame.size.width, height);

}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {

    // create layouts for the rectangles in the view
    NSMutableArray *attributesInRect =  [NSMutableArray array];
    for (UICollectionViewLayoutAttributes *attributes in [self.layoutAttributes allValues]) {
        if(CGRectIntersectsRect(rect, attributes.frame)){
            [attributesInRect addObject:attributes];
        }
    }

    return attributesInRect;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity {

    // so when a person stops dragging/flicking - we use the drag interval to determine where it will snap to
    CGFloat currentY = self.collectionView.contentOffset.y;
    // the marker of the next drag/page intervals
    CGFloat lastPageY;
    CGFloat nextPageY;
    if (iPHONE) {
         lastPageY =   (NSInteger)(currentY /  RPSlidingCellDragInterval) * RPSlidingCellDragInterval;
         nextPageY =   lastPageY + RPSlidingCellDragInterval;
    } else {
     lastPageY =   (NSInteger)(currentY /  RPSlidingCellDragInterval_IPAD) * RPSlidingCellDragInterval_IPAD;
     nextPageY =   lastPageY + RPSlidingCellDragInterval_IPAD;
    }

    // snap to whichever is closest
    CGPoint restingPoint = CGPointMake(0.0f, 0.0f);
    if ((currentY - lastPageY) < (nextPageY - currentY)){
        restingPoint.y = lastPageY;
    }else{
        restingPoint.y = nextPageY;
    }

    return restingPoint;
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    return self.layoutAttributes[indexPath];
}

// bounds change causes prepareLayout if YES
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}

@end
