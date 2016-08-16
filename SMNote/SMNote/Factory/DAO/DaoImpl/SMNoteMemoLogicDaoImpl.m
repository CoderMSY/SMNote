//
//  SMNoteMemoLogicDaoImpl.m
//  SMNote
//
//  Created by SimonMiao on 16/8/12.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteMemoLogicDaoImpl.h"
#import <MJExtension/MJExtension.h>
#import "SMNoteDetailModel.h"

//static  NSString *const tableName = @"noteMemoTable";

@implementation SMNoteMemoLogicDaoImpl

// 检查表面是否创建，并且返回表名
- (NSString *)checkTableNameWithFolderOrder:(NSNumber *)order {
    NSString *tableName = [NSString stringWithFormat:@"%@_%@",@"noteMemoTable",order.stringValue];
    [[_Dao getKeyValueStore] createTableWithName:tableName];
    
    return tableName;
}

- (NSArray<SMNoteDetailModel *> *)loadAllMemosFromDBWithFolderOrder:(NSNumber *)order
{
    __block NSArray *folders = nil;
    dispatch_block_t block = ^(){
        NSString *tableName = [self checkTableNameWithFolderOrder:order];
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

- (void)saveAllMemos:(NSArray<SMNoteDetailModel *> *)memos
{
    dispatch_block_t block = ^(){
        for (SMNoteDetailModel *model in memos) {
            NSMutableDictionary *dict = [model mj_keyValues];
            NSString *tableName = [self checkTableNameWithFolderOrder:model.order];
            [_DaoStore putObject:dict withId:model.timestamp.stringValue intoTable:tableName];
        }
    };
    [self performWriteTask:block async:YES];
}

- (void)insertMemo:(SMNoteDetailModel *)memo async:(BOOL)async
{
    dispatch_block_t block = ^(){
        NSMutableDictionary *dict = [memo mj_keyValues];
        NSString *tableName = [self checkTableNameWithFolderOrder:memo.order];
        [_DaoStore putObject:dict withId:memo.timestamp.stringValue intoTable:tableName];
//        ATLog(@"***SMNoteDetailModel模型插入成功***");
    };
    [self performWriteTask:block async:async];
}

- (void)removeMemos:(NSArray<SMNoteDetailModel *> *)memos async:(BOOL)async
{
    dispatch_block_t block = ^(){
        for (SMNoteDetailModel *model in memos) {
            NSString *tableName = [self checkTableNameWithFolderOrder:model.order];
            [_DaoStore deleteObjectById:model.timestamp.stringValue fromTable:tableName];
            // 将删除的备忘录模型保存到trash表中
            [[_Dao getTrashFolderDao] saveTrashMemo:model];
        }
        
    };
    [self performWriteTask:block async:async];
}

@end
