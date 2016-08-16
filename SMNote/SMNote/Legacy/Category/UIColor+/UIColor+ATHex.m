//
//  UIColor+ATHex.m
//  Clock
//
//  Created by Dariel on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import "UIColor+ATHex.h"

@implementation UIColor (ATHex)

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor *)at_colorWithHex:(NSInteger)hexValue
{
    return [UIColor at_colorWithHex:hexValue alpha:1.0];
}

+ (UIColor *)at_backgroundColor {
    return [UIColor at_colorWithHex:0xF5F5F5];
}

//app 颜色
+ (UIColor *)at_blackColor {
    return [UIColor at_colorWithHex:0x000000];
}

+ (UIColor *)at_darkGrayColor {
    return [UIColor at_colorWithHex:0x666666];
}

+ (UIColor *)at_lightGrayColor {
    return [UIColor at_colorWithHex:0xdddddd];
}

+ (UIColor *)at_blueColor {
    return [UIColor at_colorWithHex:0x0199FF];//0x0099ff
}

+ (UIColor *)at_lavenderColor {
    return [UIColor at_colorWithHex:0xcde1ff];
}

+ (UIColor *)at_ghostWhiteColor {
    return [UIColor at_colorWithHex:0xf1f7ff];
}

+ (UIColor *)at_goldColor {
    return [UIColor at_colorWithHex:0xffb86c];
}

+ (UIColor *)at_redColor {
    return [UIColor at_colorWithHex:0xff6c6c];
}

+ (UIColor *)at_greenColor {
    return [UIColor at_colorWithHex:0x22C064];
}

@end
