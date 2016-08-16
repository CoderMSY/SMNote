//
//  SMNoteMemoInteractor.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteMemoInteractor.h"
#import "SMNoteDetailController.h"

@implementation SMNoteMemoInteractor

- (void)pushToNoteDetailWithFolderOrder:(NSNumber *)order detailCtr:(SMNoteDetailModel *)model
{
    SMNoteDetailController *ctr = [[SMNoteDetailController alloc] init];
    ctr.foldOrder = order;
    ctr.detailModel = model;
    [self.baseController.navigationController pushViewController:ctr animated:YES]
    ;
}

@end
