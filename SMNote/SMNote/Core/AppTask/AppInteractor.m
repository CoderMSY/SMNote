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

@interface AppInteractor ()

@property (nonatomic, strong) UINavigationController *navCtr;

@end

@implementation AppInteractor

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
