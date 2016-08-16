//
//  SMNoteFolderCell.h
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATTableViewCell.h"

typedef void(^SMNoteFolderCellBlock)(NSString *title);

@interface SMNoteFolderCell : ATTableViewCell

@property (nonatomic, copy) SMNoteFolderCellBlock block;

- (void)titleBtnClickedWithBlock:(SMNoteFolderCellBlock)block;

@end
