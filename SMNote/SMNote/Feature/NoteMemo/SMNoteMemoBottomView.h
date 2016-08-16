//
//  SMNoteMemoBottomView.h
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SMNoteMemoBottomViewBtnType) {
    SMNoteMemoBottomViewBtnTypeOfAttachments,//附件按钮
    SMNoteMemoBottomViewBtnTypeOfMove, //移动按钮
    SMNoteMemoBottomViewBtnTypeOfMoveAll, //移动所有按钮
    
    SMNoteMemoBottomViewBtnTypeOfCreate,//新建按钮
    SMNoteMemoBottomViewBtnTypeOfDelete, //删除按钮
    SMNoteMemoBottomViewBtnTypeOfDeleteAll //删除所有按钮
};

typedef void(^SMNoteMemoBottomViewBlock)(SMNoteMemoBottomViewBtnType type);

@interface SMNoteMemoBottomView : UIView

@property (nonatomic, assign) NSUInteger memoNumber;
@property (nonatomic, copy) SMNoteMemoBottomViewBlock block;

- (void)menoBottomViewOfBtnClicked:(SMNoteMemoBottomViewBlock)block;

/** 通知按钮改变status */
- (void)notifyTheBtnChangeStatus:(BOOL)isEditing;
/** 修改删除按钮状态 */
- (void)modifyTheBtnEnabledWithDeleteArrCount:(NSUInteger)count;

@end
