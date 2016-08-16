//
//  UILabel+ATLabelHeight.h
//  Clock
//
//  Created by Dariel on 16/7/27.
//  Copyright © 2016年 com.mintmedical. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (ATLabelHeight)

/**
 *  根据label文字内容计算高度
 *
 *  @param text     文本
 *  @param width    宽度
 *  @param fontSize 字体大小
 *
 *  @return label高度
 */
- (CGFloat)heightForString:(NSString *)text width:(CGFloat )width fontSize:(CGFloat)fontSize;

@end
