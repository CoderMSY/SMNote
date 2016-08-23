//
//  AppInteractor.m
//  SMPlayer
//
//  Created by SimonMiao on 16/7/29.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "AppInteractor.h"
#import "ATNavigationController.h"
#import "SMNoteFolderController.h"

static NSString *const KAppShortcutItemItem_share = @"com.MSY.SMNote.share";
static NSString *const KAppShortcutItemItem_search = @"com.MSY.SMNote.search";
static NSString *const KAppShortcutItemItem_one = @"com.MSY.SMNote.one";

@interface AppInteractor ()

@property (nonatomic, strong) UINavigationController *navCtr;

@end

@implementation AppInteractor

- (void)creatShortcutItems {
    UIApplicationShortcutIcon *curIcon = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeShare];
    UIApplicationShortcutItem *item = [[UIApplicationShortcutItem alloc] initWithType:KAppShortcutItemItem_share localizedTitle:@"分享" localizedSubtitle:@"分享副标题" icon:curIcon userInfo:nil];
    
    UIApplicationShortcutIcon *cutIcon2 = [UIApplicationShortcutIcon iconWithType:UIApplicationShortcutIconTypeSearch];
    UIApplicationShortcutItem *item2 = [[UIApplicationShortcutItem alloc] initWithType:KAppShortcutItemItem_search localizedTitle:@"搜索" localizedSubtitle:@"搜索副标题" icon:cutIcon2 userInfo:nil];
    
    UIApplicationShortcutItem *item3 = [[UIApplicationShortcutItem alloc] initWithType:KAppShortcutItemItem_one localizedTitle:@"第一个按钮"];
    
    //添加到快捷选项数组
    [UIApplication sharedApplication].shortcutItems = @[item,item2,item3];
}

- (void)judgeTheShortcutItemType:(NSString *)type {
    if ([type isEqualToString:KAppShortcutItemItem_share]) {
        ATLog(@"分享点击了");
    }
    else if ([type isEqualToString:KAppShortcutItemItem_search]) {
        ATLog(@"搜索点击了");
    }
    else if ([type isEqualToString:KAppShortcutItemItem_one]) {
        ATLog(@"第一个按钮点击");
    }
}

- (void)startUIFlow
{
    [self startMain];
}

- (void)startMain
{
    if (!self.navCtr) {
        SMNoteFolderController *ctr = [[SMNoteFolderController alloc] init];
        self.navCtr = [[UINavigationController alloc] initWithRootViewController:ctr];
    }
    
    self.keyWindow.rootViewController = self.navCtr;
}


@end
