//
//  SMNoteMemoView.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteMemoView.h"

@implementation SMNoteMemoView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataTableView.editing = NO;
        self.dataTableView.allowsMultipleSelectionDuringEditing = YES;
    }
    return self;
}

@end
