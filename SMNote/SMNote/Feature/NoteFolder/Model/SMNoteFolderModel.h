//
//  SMNoteFolderModel.h
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATBaseModel.h"

@interface SMNoteFolderModel : ATBaseModel

@property (nonatomic, copy) NSString *title; ///< 标题
@property (nonatomic, strong) NSNumber *number; //!< 个数
@property (nonatomic, strong) NSNumber *order; //!<文件夹标记顺序 (order==0 为废纸篓标记)

@end

@class SMNoteDetailModel;
@interface SMNoteTrashFolderModel : SMNoteFolderModel

@property (nonatomic, strong) NSArray <SMNoteDetailModel *>*menos; //!< 垃圾箱被的备忘录

@end
