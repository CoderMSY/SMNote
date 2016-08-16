//
//  SMDeleteAlertController.m
//  SMNote
//
//  Created by SimonMiao on 16/8/15.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMDeleteAlertController.h"
#import "SMDaoFactory.h"

@interface SMDeleteAlertController ()

@end

@implementation SMDeleteAlertController

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message preferredStyle:(UIAlertControllerStyle)preferredStyle {
    SMDeleteAlertController *alertCtr = [super alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    
    return alertCtr;
}

- (void)deleteAlertActionClick:(SMDeleteAlertControllerBlock)block {
    _block = block;
}

- (void)deleteFolderAndMemos {
    [[_Dao getFolderDao] removeFolders:self.deleteArray async:YES];
}

- (void)deleteFolder {
    ATLog(@"***仅删除文件夹***");
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    ATWeakSelf
    UIAlertAction *sureAction1 = [UIAlertAction actionWithTitle:@"删除文件夹和备忘录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf deleteFolderAndMemos];
        _block(SMDeleteAlertActionTypeDeleteFolderAndNotes);
    }];
    UIAlertAction *sureAction2 = [UIAlertAction actionWithTitle:@"仅删除文件夹" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [weakSelf deleteFolder];
        _block(SMDeleteAlertActionTypeDeleteFolderOnly);
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        _block(SMDeleteAlertActionTypeCancel);
    }];
    [sureAction1 setValue:[UIColor at_redColor] forKey:@"titleTextColor"];
    [sureAction2 setValue:[UIColor at_redColor] forKey:@"titleTextColor"];
    [cancelAction setValue:[UIColor at_goldColor] forKey:@"titleTextColor"];
    [self addAction:sureAction1];
    [self addAction:sureAction2];
    [self addAction:cancelAction];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
