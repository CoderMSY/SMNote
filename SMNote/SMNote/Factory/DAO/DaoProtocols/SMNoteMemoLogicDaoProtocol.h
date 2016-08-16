//
//  SMNoteMemoLogicDaoProtocol.h
//  SMNote
//
//  Created by SimonMiao on 16/8/12.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMNoteDetailModel;
@protocol SMNoteMemoLogicDaoProtocol <NSObject>

- (NSArray <SMNoteDetailModel *>*)loadAllMemosFromDBWithFolderOrder:(NSNumber *)order;

- (void)saveAllMemos:(NSArray <SMNoteDetailModel *>*)memos;
- (void)insertMemo:(SMNoteDetailModel *)memo async:(BOOL)async;

- (void)removeMemos:(NSArray <SMNoteDetailModel *>*)memos async:(BOOL)async;

@end
