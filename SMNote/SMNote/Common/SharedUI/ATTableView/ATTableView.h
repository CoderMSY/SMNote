//
//  ATTableView.h
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ATTableViewAdapter.h"

@interface ATTableView : UIView

@property (nonatomic, strong) UITableView *dataTableView;

- (void)setTableViewAdapter:(ATTableViewAdapter *)tableViewAdapter;
- (void)refreshTableView;

@end
