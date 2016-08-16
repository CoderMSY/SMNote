//
//  UIButton+AtCreate.h
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (AtCreate)

+ (UIButton *)at_createBtnWithTitle:(NSString *)title fontSize:(CGFloat)size titleColor:(UIColor *)titleColor imgName:(NSString *)imgName bgColor:(UIColor *)bgColor addTarget:(id)target selector:(SEL)selector;

@end
