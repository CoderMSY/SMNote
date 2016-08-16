//
//  SMNoteFolderInteractor.h
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATInteractor.h"

typedef void(^SMNoteFolderInteractorMemoBlock)(NSUInteger memoNum);
@class SMNoteFolderModel;
@interface SMNoteFolderInteractor : ATInteractor

@property (nonatomic, copy) SMNoteFolderInteractorMemoBlock block;
- (void)returnNoteMemoNumber:(SMNoteFolderInteractorMemoBlock)block;
- (void)goToNoteMemoPageNoteFolderModel:(SMNoteFolderModel *)model;
- (void)presentDeleteAlertController:(NSArray <SMNoteFolderModel *> *)deleteArray;

@end
