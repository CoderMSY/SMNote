//
//  SMNoteDetailBottomToolBar.m
//  SMNote
//
//  Created by SimonMiao on 16/8/12.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteDetailBottomToolBar.h"

@implementation SMNoteDetailBottomToolBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.barStyle = UIBarStyleDefault;
        
        [self createItems];
    }
    return self;
}

- (void)createItems {
    NSArray *itemTypeArrs = @[@(UIBarButtonSystemItemTrash),@(UIBarButtonSystemItemSearch),@(UIBarButtonSystemItemCamera),@(UIBarButtonSystemItemAdd),@(UIBarButtonSystemItemCompose)];
    NSMutableArray *itemArrs = [NSMutableArray arrayWithCapacity:0];
    UIBarButtonItem *flexItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    for (NSInteger i = 0; i < itemTypeArrs.count; i ++) {
        UIBarButtonItem *btnItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:[itemTypeArrs[i] integerValue] target:self action:@selector(btnItem:)];
        btnItem.tag = 1000 + i;
        [itemArrs addObject:btnItem];
        if (i != itemTypeArrs.count - 1) {
            [itemArrs addObject:flexItem];
        }
    }
    self.items = itemArrs;
}

- (void)btnItem:(UIBarButtonItem *)btnItem {
    ATLog(@"btnItem.tag:%li",(long)btnItem.tag);
}

@end
