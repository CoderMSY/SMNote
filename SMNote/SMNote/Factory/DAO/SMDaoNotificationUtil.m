//
//  SMDaoNotificationUtil.m
//  SMNote
//
//  Created by SimonMiao on 16/8/13.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMDaoNotificationUtil.h"

@implementation SMDaoNotificationUtil

+ (void)sendNoteMemosChangeIntent:(NSString *)category noteMemos:(NSArray<SMNoteDetailModel *> *)noteMemos {
    if (nil == category || nil == noteMemos) {
        return;
    }
    NSMutableDictionary *notiInfo = [NSMutableDictionary new];
    notiInfo[@"noteMemos"] = noteMemos;
    notiInfo[@"category"] = category;
    dispatch_async(dispatch_get_main_queue(), ^{
        [Notif postNotificationName:KDAOAction_noteMemoTable object:notiInfo];
    });
}

+ (void)sendNoteMemoChangeIntent:(NSString *)category noteMemo:(SMNoteDetailModel *)noteMemo {
    if (nil == category || nil == noteMemo) {
        return;
    }
    NSMutableDictionary *notiInfo = [NSMutableDictionary new];
    notiInfo[@"noteMemo"] = noteMemo;
    notiInfo[@"category"] = category;
    dispatch_async(dispatch_get_main_queue(), ^{
        [Notif postNotificationName:KDAOAction_noteMemoTable object:notiInfo];
    });
}



@end
