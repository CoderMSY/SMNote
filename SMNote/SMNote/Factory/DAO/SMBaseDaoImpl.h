//
//  SMBaseDaoImpl.h
//  SMNote
//
//  Created by SimonMiao on 16/8/10.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SMDaoFactory.h"

#define _DaoStore [_Dao getKeyValueStore]

@interface SMBaseDaoImpl : NSObject

/** 全局队列中子线程异步或同步写入数据 */
- (void)performWriteTask:(dispatch_block_t)block async:(BOOL)async;

/** 主队列异步读取数据 */
- (void)performReadTask:(dispatch_block_t)block;

@end
