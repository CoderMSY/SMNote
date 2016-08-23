//
//  SMBaseDaoImpl.m
//  SMNote
//
//  Created by SimonMiao on 16/8/10.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMBaseDaoImpl.h"
#import <YTKKeyValueStore/YTKKeyValueStore.h>

@implementation SMBaseDaoImpl

- (void)performWriteTask:(dispatch_block_t)block async:(BOOL)async
{
    if (async) {
        
        dispatch_async(SMGlobalQueue, ^{
            ATLog(@"***write***---%@,---isMainThread:%i",[NSThread currentThread],[NSThread isMainThread]);
            block();
        });
    } else {
        dispatch_sync(SMGlobalQueue, ^{
            ATLog(@"***write***---%@,---isMainThread:%i",[NSThread currentThread],[NSThread isMainThread]);
            block();
        });
    }
}

- (void)performReadTask:(dispatch_block_t)block
{
    //主队列(添加到主队列中的任务，都会自动放到主线程中去执行)
//    dispatch_async(SMMainQueue, ^{
//        block();// 主队列异步执行
//        ATLog(@"***write***---%@,---isMainThread:%i",[NSThread currentThread],[NSThread isMainThread]);
//    });
    if ([NSThread isMainThread]) {
        block();
    } else {
        [self performSelectorOnMainThread:@selector(performBlock:) withObject:block waitUntilDone:YES];
    }
}

- (void)performBlock:(dispatch_block_t)block
{
    block();
}

@end
