//
//  UIColor+ATHex.h
//  Clock
//
//  Created by Dariel on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ATHex)

+ (UIColor*)at_colorWithHex:(NSInteger)hexValue;


/** 背景颜色 */
+ (UIColor *)at_backgroundColor;
/// app 颜色
+ (UIColor *)at_blackColor;
+ (UIColor *)at_darkGrayColor;
+ (UIColor *)at_lightGrayColor;
+ (UIColor *)at_blueColor;
+ (UIColor *)at_lavenderColor;
+ (UIColor *)at_ghostWhiteColor;
+ (UIColor *)at_goldColor;
+ (UIColor *)at_redColor;
+ (UIColor *)at_greenColor;

@end
