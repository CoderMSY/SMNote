//
//  UILabel+ATCreate.m
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import "UILabel+ATCreate.h"

@implementation UILabel (ATCreate)

+ (UILabel *)at_createLabWithText:(NSString *)text fontSize:(CGFloat)size titleColor:(UIColor *)titleColor
{
    UILabel *lab = [[UILabel alloc] init];
    if (text.length) {
        lab.text = text;
    }
    lab.font = [UIFont systemFontOfSize:size];
    if (titleColor) {
        lab.textColor = titleColor;
    }
    
    return lab;
}

- (CGSize)at_calculateLenthOfTheLabel
{
    CGSize size = [self.text sizeWithAttributes:@{NSFontAttributeName : self.font}];
    
    return size;
}

@end
