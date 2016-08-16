//
//  SMNoteFolderLogicDaoProtocol.h
//  SMNote
//
//  Created by SimonMiao on 16/8/10.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import "SMNoteFolderModel.h"

@class SMNoteFolderModel;
@protocol SMNoteFolderLogicDaoProtocol <NSObject>

- (NSArray <SMNoteFolderModel *>*)loadAllFolders;

- (void)saveAllFolders:(NSArray <SMNoteFolderModel *>*)folders;
- (void)insertFolder:(SMNoteFolderModel *)folder async:(BOOL)async;
//- (void)removeFolder:(SMNoteFolderModel *)folder async:(BOOL)async;
- (void)removeFolders:(NSArray <SMNoteFolderModel *>*)folders async:(BOOL)async;

/** 清除表 */
- (void)clearNoteTable:(NSNumber *)order;

@end
