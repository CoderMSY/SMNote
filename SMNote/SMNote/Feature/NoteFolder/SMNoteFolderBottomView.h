//
//  SMNoteFolderBottomView.h
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SMBottomViewBtnType) {
    SMBottomViewBtnTypeCreate,//新建按钮
    SMBottomViewBtnTypeOfDelete //删除按钮
};

typedef void(^SMNoteFolderBottomViewBlock)(SMBottomViewBtnType type);

@interface SMNoteFolderBottomView : UIView

@property (nonatomic, copy) SMNoteFolderBottomViewBlock block;

/** 新建或删除文件夹 */
- (void)BottomViewBtnClickedWithBlock:(SMNoteFolderBottomViewBlock)block;
/** 通知按钮改变status */
- (void)notifyTheBtnChangeStatus:(BOOL)isEditing;
/** 修改删除按钮状态 */
- (void)modifyTheBtnEnabledWithDeleteArrCount:(NSUInteger)count;

@end
