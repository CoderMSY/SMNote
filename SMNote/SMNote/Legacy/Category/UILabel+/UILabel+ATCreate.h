//
//  UILabel+ATCreate.h
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ATCreate)

/**
 *  创建普通的UILabel
 *
 *  @param text label的text
 *  @param size  字体的大小 CGFloat
 *  @param titleColor  字体颜色，暂时不设置传nil
 *
 *  @return UILabel 的对象
 */
+ (UILabel *)at_createLabWithText:(NSString *)text fontSize:(CGFloat)size titleColor:(UIColor *)titleColor;

/**
 *  计算Label的text的长度
 *
 *  @return CGSize
 */
- (CGSize)at_calculateLenthOfTheLabel;

@end
