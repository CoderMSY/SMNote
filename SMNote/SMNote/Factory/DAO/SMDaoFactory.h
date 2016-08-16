//
//  SMDaoFactory.h
//  SMNote
//
//  Created by SimonMiao on 16/8/10.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMSingleton.h"
#import <YTKKeyValueStore/YTKKeyValueStore.h>

#import "SMNoteFolderLogicDaoProtocol.h"
#import "SMNoteMemoLogicDaoProtocol.h"
#import "SMNoteTrashFolderLogicDaoProtocol.h"

#define _Dao [SMDaoFactory sharedDaoFactory]

@class YTKKeyValueStore;
@interface SMDaoFactory : NSObject
/** 快速创建单例 */
SMSingletonH(DaoFactory)

- (YTKKeyValueStore *)getKeyValueStore;

- (id<SMNoteFolderLogicDaoProtocol>)getFolderDao;
- (id<SMNoteMemoLogicDaoProtocol>)getMemoDao;
- (id<SMNoteTrashFolderLogicDaoProtocol>)getTrashFolderDao;

@end
