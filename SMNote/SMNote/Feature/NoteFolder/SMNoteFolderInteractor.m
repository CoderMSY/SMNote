//
//  SMNoteFolderInteractor.m
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteFolderInteractor.h"
#import "SMNoteMemoController.h"
#import "SMDeleteAlertController.h"

@implementation SMNoteFolderInteractor

- (void)returnNoteMemoNumber:(SMNoteFolderInteractorMemoBlock)block {
    _block = block;
}

- (void)goToNoteMemoPageNoteFolderModel:(SMNoteFolderModel *)model {
    SMNoteMemoController *ctr = [[SMNoteMemoController alloc] init];
    ctr.folderModel = model;
    ctr.block = _block ? : nil;
    [self.baseController.navigationController pushViewController:ctr animated:YES];
}

- (void)presentDeleteAlertController:(NSArray <SMNoteFolderModel *> *)deleteArray {
    SMDeleteAlertController *ctr = [SMDeleteAlertController alertControllerWithTitle:@"删除文件夹？" message:@"如果仅删除这一文件夹，其备忘录将移至“备忘录”文件夹。子文件夹也将同时删除。" preferredStyle:UIAlertControllerStyleActionSheet];
    ctr.deleteArray = deleteArray;
    [self.baseController presentViewController:ctr animated:YES completion:nil];
}

@end
