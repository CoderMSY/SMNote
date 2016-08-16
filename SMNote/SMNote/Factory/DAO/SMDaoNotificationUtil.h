//
//  SMDaoNotificationUtil.h
//  SMNote
//
//  Created by SimonMiao on 16/8/13.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMNoteDetailModel;
@interface SMDaoNotificationUtil : NSObject
/** 备忘录数组改变 */
+ (void)sendNoteMemosChangeIntent:(NSString *)category noteMemos:(NSArray <SMNoteDetailModel *>*)noteMemos;
/** 单条备忘录改变 */
+ (void)sendNoteMemoChangeIntent:(NSString *)category noteMemo:(SMNoteDetailModel *)noteMemo;

@end
