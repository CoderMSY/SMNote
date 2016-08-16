//
//  SMNoteDetailController.h
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATBaseController.h"

@class SMNoteDetailModel;
@interface SMNoteDetailController : ATBaseController

// 查看或编辑模式
@property (nonatomic, strong) SMNoteDetailModel *detailModel; //!< 可选参数
@property (nonatomic, strong) NSNumber *foldOrder; //!<文件夹标记顺序 （比传参数）

@end
