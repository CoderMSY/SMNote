//
//  ATTableView.m
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATTableView.h"

@implementation ATTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.dataTableView = [[UITableView alloc] init];
        self.dataTableView.frame = self.bounds;
        UIView *backView = [[UIView alloc] init];
        backView.backgroundColor = [UIColor at_backgroundColor];
        self.dataTableView.backgroundView = backView;
        self.dataTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        self.dataTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        self.dataTableView.tableFooterView=[[UIView alloc]init];
        
        [self addSubview:self.dataTableView];
        
    }
    return self;
}

- (void)setTableViewAdapter:(ATTableViewAdapter *)tableViewAdapter
{
    self.dataTableView.delegate = tableViewAdapter;
    self.dataTableView.dataSource = tableViewAdapter;
}

- (void)refreshTableView
{
    [self.dataTableView reloadData];
}

- (void)dealloc
{
    self.dataTableView.delegate = nil;
    self.dataTableView.dataSource = nil;
    self.dataTableView = nil;
}

@end
