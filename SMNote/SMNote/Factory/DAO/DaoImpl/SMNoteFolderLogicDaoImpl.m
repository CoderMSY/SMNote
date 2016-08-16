//
//  SMNoteFolderLogicDaoImpl.m
//  SMNote
//
//  Created by SimonMiao on 16/8/10.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteFolderLogicDaoImpl.h"
#import <MJExtension/MJExtension.h>

#import "SMNoteFolderModel.h"

//管理所有新建的文件夹表信息的表
static  NSString *const tableName = @"SMNoteFolderTable";

@implementation SMNoteFolderLogicDaoImpl

- (instancetype)init {
    self = [super init];
    if (self) {
        [[_Dao getKeyValueStore] createTableWithName:tableName];
        
    }
    
    return self;
}

- (NSArray<SMNoteFolderModel *> *)loadAllFolders
{
    __block NSArray *folders = nil;
    dispatch_block_t block = ^(){
        NSArray *dictArr = [_DaoStore getAllItemsFromTable:tableName];
        NSMutableArray *modelArrs = [NSMutableArray arrayWithCapacity:0];
        for (YTKKeyValueItem *item in dictArr) {
            [modelArrs addObject:item.itemObject];
        }
        folders = [SMNoteFolderModel mj_objectArrayWithKeyValuesArray:modelArrs];
        NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"order" ascending:NO];
        folders = [folders sortedArrayUsingDescriptors:@[sortDescriptor]];
//        [folders sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//            //
//        }];
    };
    [self performReadTask:block];
    
    return folders;
}

- (void)saveAllFolders:(NSArray<SMNoteFolderModel *> *)folders
{
    dispatch_block_t block = ^(){
//        NSMutableArray *dictArrs = [SMNoteFolderModel mj_keyValuesArrayWithObjectArray:folders];
        for (SMNoteFolderModel *model in folders) {
            NSMutableDictionary *dict = [model mj_keyValues];
            [_DaoStore putObject:dict withId:model.order.stringValue intoTable:tableName];
        }
    };
    [self performWriteTask:block async:YES];
}

- (void)insertFolder:(SMNoteFolderModel *)folder async:(BOOL)async
{
    dispatch_block_t block = ^(){
        NSMutableDictionary *dict = [folder mj_keyValues];
        [_DaoStore putObject:dict withId:folder.order.stringValue intoTable:tableName];
    };
    [self performWriteTask:block async:async];
}

- (void)removeFolders:(NSArray<SMNoteFolderModel *> *)folders async:(BOOL)async
{
    dispatch_block_t block = ^(){
        for (SMNoteFolderModel *model in folders) {
            //从SMNoteFolderTable表中删除对应的文件夹信息
            [_DaoStore deleteObjectById:model.order.stringValue fromTable:tableName];
            
            //删除文件夹后要删除文件夹内的备忘录
            NSArray *menos = [[_Dao getMemoDao] loadAllMemosFromDBWithFolderOrder:model.order];
            if (menos.count) {
//                [[_Dao getMemoDao] removeMemos:menos async:YES];
                // 将删除的备忘录模型数组保存到trash表中
                [[_Dao getTrashFolderDao] saveTrashMemos:menos];
            }
            [self clearNoteTable:model.order];
        }
        
    };
    [self performWriteTask:block async:async];
}

/** 清楚文件夹对应的表 */
- (void)clearNoteTable:(NSNumber *)order {
    NSString *tableName = [NSString stringWithFormat:@"%@_%@",@"noteMemoTable",order.stringValue];
//    [_DaoStore clearTable:tableName];
    [_DaoStore deleteTable:tableName];
}

@end
