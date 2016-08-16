//
//  SMNoteTrashFolderLogicDaoProtocol.h
//  SMNote
//
//  Created by SimonMiao on 16/8/15.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMNoteDetailModel;
@protocol SMNoteTrashFolderLogicDaoProtocol <NSObject>

- (NSArray <SMNoteDetailModel *>*)loadAllTrashMemosFromDB;

- (void)saveTrashMemos:(NSArray <SMNoteDetailModel *>*)memos;
- (void)saveTrashMemo:(SMNoteDetailModel *)memo;

- (void)removeTrashMemos:(NSArray <SMNoteDetailModel *>*)memos async:(BOOL)async;

@end
