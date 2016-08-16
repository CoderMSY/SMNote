//
//  ATTableViewCell.h
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "UITableViewCell+DD.h"

@interface ATTableViewCell : UITableViewCell

@property (nonatomic, assign) float lineHeight;
@property (nonatomic, strong) UIView *mHeaderLineView;
@property (nonatomic, strong) UIView *mFooterLineView;
@property (nonatomic, strong) UIImageView *arrowImageView;
@property (nonatomic) BOOL  isLastCell;

- (void)updateCellWithData:(id)aCellData hideHeaderLine:(BOOL)isHeaderHidden hideFooterLine:(BOOL)isFooterHidden;
- (CGSize)calcSizeWithLabel:(UILabel *)aLabel constrainedToSize:(CGSize)aSize;
- (CGSize)calcSizeWithText:(NSString *)aText font:(UIFont *)aFont constrainedToSize:(CGSize)aSize;

@end
