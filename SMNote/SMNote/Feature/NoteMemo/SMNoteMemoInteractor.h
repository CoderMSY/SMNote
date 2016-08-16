//
//  SMNoteMemoInteractor.h
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATInteractor.h"

@class SMNoteDetailModel;
@interface SMNoteMemoInteractor : ATInteractor

- (void)pushToNoteDetailWithFolderOrder:(NSNumber *)order detailCtr:(SMNoteDetailModel *)model;

@end
