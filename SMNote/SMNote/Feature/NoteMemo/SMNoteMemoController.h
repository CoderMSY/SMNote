//
//  SMNoteMemoController.h
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATBaseController.h"

typedef void(^SMNoteMemoControllerBlock)(NSUInteger memoNum);

@class SMNoteFolderModel;
@interface SMNoteMemoController : ATBaseController

@property (nonatomic, strong) SMNoteFolderModel *folderModel;

@property (nonatomic, copy) SMNoteMemoControllerBlock block;

//- (void)returnNoteMemoNumber:(SMNoteMemoControllerBlock)block;

@end
