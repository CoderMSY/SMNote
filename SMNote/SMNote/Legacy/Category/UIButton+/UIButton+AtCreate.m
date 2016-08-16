//
//  UIButton+AtCreate.m
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import "UIButton+AtCreate.h"

@implementation UIButton (AtCreate)

+ (UIButton *)at_createBtnWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)titleColor imgName:(NSString *)imgName bgColor:(UIColor *)bgColor addTarget:(id)target selector:(SEL)selector
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (title.length) {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (size) {
        btn.titleLabel.font = [UIFont systemFontOfSize:size];
    }
    if (titleColor) {
        [btn setTitleColor:titleColor forState:UIControlStateNormal];
    }
//    [btn setTitle:title forState:UIControlStateNormal];
//    btn.titleLabel.font = [UIFont systemFontOfSize:size];
//    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    if (imgName.length) {
        [btn setImage:[UIImage imageNamed:imgName] forState:UIControlStateNormal];
    }
    [btn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    if (bgColor) {
        btn.backgroundColor = bgColor;
    }

    return btn;
}

@end
