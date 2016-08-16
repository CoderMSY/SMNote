//
//  SharedMacro.h
//  SMPlayer
//
//  Created by SimonMiao on 16/7/29.
//  Copyright © 2016年 MSY. All rights reserved.
//

#ifndef SharedMacro_h
#define SharedMacro_h

//通知中心
#define Notif        [NSNotificationCenter defaultCenter]

//队列宏
#define SMGlobalQueue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define SMMainQueue dispatch_get_main_queue()

// 弱引用
#define ATWeakSelf __weak typeof(self) weakSelf = self;

#ifdef DEBUG // 处于开发阶段
#define ATLog(...) NSLog(__VA_ARGS__)
#else // 处于发布阶段
#define ATLog(...)
#endif

// 屏幕尺寸
#define SCREEN_SIZE         [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH        SCREEN_SIZE.width
#define SCREEN_HEIGHT       SCREEN_SIZE.height

//suppress warnning
#define CCSuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

#endif /* SharedMacro_h */
