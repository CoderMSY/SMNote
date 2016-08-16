//
//  UILabel+ATLabelHeight.m
//  Clock
//
//  Created by Dariel on 16/7/27.
//  Copyright © 2016年 com.mintmedical. All rights reserved.
//

#import "UILabel+ATLabelHeight.h"

@implementation UILabel (ATLabelHeight)

- (CGFloat)heightForString:(NSString *)text width:(CGFloat )width fontSize:(CGFloat)fontSize{
    
    //计算多行文字高度
    //已知字体高度,宽度,文本,numberOfLines设置为0
    NSDictionary *textAttrs =@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGSize textMaxSize = CGSizeMake(width, MAXFLOAT);//获得所需宽度,MAXFLOAT无限高
    CGFloat textH = [text boundingRectWithSize:textMaxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:textAttrs context:nil].size.height;
    
    return textH;
}

@end
