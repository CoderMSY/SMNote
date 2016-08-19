//
//  SMNoteTrashFolderLogicDaoImpl.m
//  SMNote
//
//  Created by SimonMiao on 16/8/15.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteTrashFolderLogicDaoImpl.h"
#import <MJExtension/MJExtension.h>
#import "SMNoteDetailModel.h"

static  NSString *const tableName = @"SMNoteTrashFolderTable";
@implementation SMNoteTrashFolderLogicDaoImpl

- (instancetype)init {
    self = [super init];
    if (self) {
        [_DaoStore createTableWithName:tableName];
    }
    
    return self;
}

- (NSArray<SMNoteDetailModel *> *)loadAllTrashMemosFromDB {
    __block NSArray *folders = nil;
    dispatch_block_t block = ^(){
        NSArray *dictArr = [_DaoStore getAllItemsFromTable:tableName];
        NSMutableArray *modelArrs = [NSMutableArray arrayWithCapacity:0];
        for (YTKKeyValueItem *item in dictArr) {
            [modelArrs addObject:item.itemObject];
        }
        folders = [SMNoteDetailModel mj_objectArrayWithKeyValuesArray:modelArrs];
    };
    [self performReadTask:block];
    
    return folders;
}

- (void)saveTrashMemos:(NSArray<SMNoteDetailModel *> *)memos {
    dispatch_block_t block = ^(){
        //        NSMutableArray *dictArrs = [SMNoteFolderModel mj_keyValuesArrayWithObjectArray:folders];
        for (SMNoteDetailModel *model in memos) {
            NSMutableDictionary *dict = [model mj_keyValues];
            [_DaoStore putObject:dict withId:model.timestamp.stringValue intoTable:tableName];
        }
    };
    [self performWriteTask:block async:YES];
}

- (void)saveTrashMemo:(SMNoteDetailModel *)memo {
    NSMutableDictionary *dict = [memo mj_keyValues];
    [_DaoStore putObject:dict withId:memo.timestamp.stringValue intoTable:tableName];
}

- (void)removeTrashMemos:(NSArray<SMNoteDetailModel *> *)memos async:(BOOL)async {
    dispatch_block_t block = ^(){
        for (SMNoteDetailModel *model in memos) {
            [_DaoStore deleteObjectById:model.timestamp.stringValue fromTable:tableName];
        }
        
    };
    [self performWriteTask:block async:async];
}

@end
