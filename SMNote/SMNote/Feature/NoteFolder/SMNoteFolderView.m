//
//  SMNoteFolderView.m
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteFolderView.h"

@implementation SMNoteFolderView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataTableView.editing = NO;
        //支持同时选中多行
        self.dataTableView.allowsMultipleSelectionDuringEditing = YES;
    }
    return self;
}

@end
