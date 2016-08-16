//
//  UITableViewCell+Coco.h
//  CocoVoice
//
//  Created by pig on 14-2-21.
//
//

#import <UIKit/UIKit.h>

@interface UITableViewCell (DD)

- (void)addHeaderLineWithColor:(UIColor *)tColor lineX:(float)tx;
- (void)addHeaderLineWithColor:(UIColor *)tColor lineX:(float)tx cellHeight:(float)ht;
- (void)addHeaderLineWithColor:(UIColor *)tColor lineMarginX:(float)tx;
- (void)addfooterLineWithColor:(UIColor *)tColor lineX:(float)tx;
- (void)addfooterLineWithColor:(UIColor *)tColor lineX:(float)tx cellHeight:(float)ht;
- (void)addfooterLineWithColor:(UIColor *)tColor lineX:(float)tx cellHeight:(float)ht lineHeight:(float)lx;
- (void)addfooterLineWithColor:(UIColor *)tColor lineMarginX:(float)tx cellHeight:(float)ht;
- (void)addLinesOnHeaderAndFooterWithColor:(UIColor *)tColor;
- (void)cleanLinesOnHeaderAndFooter;
- (void)setHeaderLineHiden:(BOOL)isHiden;
- (void)setFooterLineHiden:(BOOL)isHiden;

- (void)setNormalBackgroundViewWithColor:(UIColor *)tColor;
- (void)setSelectedBackgroundViewWithColor:(UIColor *)tColor;

@end
