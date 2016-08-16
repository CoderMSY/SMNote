//
//  ATTextView.h
//  Clock
//
//  Created by SimonMiao on 16/7/20.
//  Copyright © 2016年 com.mintmedical. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ATTextView : UITextView

/**
 *  占位文字
 */
@property (weak, nonatomic) NSString *placeholder;
@property (weak, nonatomic) UIColor  *placeholderColor;

@end
