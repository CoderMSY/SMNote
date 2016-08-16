//
//  ATTableViewAdapter.h
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UITableViewCell+DD.h"

@protocol ATTableViewAdapterDelegate <NSObject>

@optional
- (void)didSelectCellData:(id)cellData index:(NSIndexPath *)indexPath;
- (void)didDeselectCellData:(id)cellData index:(NSIndexPath *)indexPath;
- (void)deleteCellData:(id)cellData;
- (void)willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface ATTableViewAdapter : NSObject<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)   NSMutableArray*                         adapterArray;
@property (nonatomic, weak)     id<ATTableViewAdapterDelegate>          adapterDelegate;

- (float)getTableContentHeight;
- (void)refreshCellByData:(id)data tableView:(UITableView*)tableView;

@end
