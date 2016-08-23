//
//  AppInteractor.h
//  SMPlayer
//
//  Created by SimonMiao on 16/7/29.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppInteractor : NSObject

@property (nonatomic, strong) UIWindow *keyWindow;

- (void)creatShortcutItems;
- (void)judgeTheShortcutItemType:(NSString *)type;


- (void)startUIFlow;

//- (void)starLogin;
- (void)startMain;

@end
