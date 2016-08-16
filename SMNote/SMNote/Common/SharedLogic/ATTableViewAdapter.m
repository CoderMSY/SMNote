//
//  ATTableViewAdapter.m
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATTableViewAdapter.h"

@implementation ATTableViewAdapter

- (float)getTableContentHeight
{
    return 0;
}

- (void)refreshCellByData:(id)data tableView:(UITableView*)tableView
{
    
}

#pragma mark    UITableView DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        return self.adapterArray.count;
    }
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        return [self.adapterArray[section] count];
    } else {
        return self.adapterArray.count;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    id cellData = nil;
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        cellData = self.adapterArray[indexPath.section][indexPath.row];
    } else {
        cellData = [self.adapterArray objectAtIndex:indexPath.row];
    }
    
    //    NSString *str = NSStringFromClass([cellData class]);
    //    CCLog(@"%@",str);
    UITableViewCell* cell = NULL;
    CCSuppressPerformSelectorLeakWarning(
                                         cell = [self performSelector:NSSelectorFromString([NSString stringWithFormat:@"tableView:cellFor%@:", [cellData class]]) withObject:tableView withObject:cellData];);
    
    return cell;
}

#pragma mark    UITableView Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
//    [tableView deselectRowAtIndexPath:indexPath animated:false];
    
    //    id cellData = [self.adapterArray objectAtIndex:indexPath.row];
    id cellData = nil;
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        cellData = self.adapterArray[indexPath.section][indexPath.row];
    } else {
        cellData = self.adapterArray[indexPath.row];
    }
    if (self.adapterDelegate) {
        if ([_adapterDelegate respondsToSelector:@selector(didSelectCellData:index:)]) {
            [_adapterDelegate didSelectCellData:cellData index:indexPath];
        }
    }
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    id cellData = nil;
    if ([self.adapterArray.firstObject isKindOfClass:[NSArray class]]) {
        cellData = self.adapterArray[indexPath.section][indexPath.row];
    } else {
        cellData = self.adapterArray[indexPath.row];
    }
    if ([_adapterDelegate respondsToSelector:@selector(didDeselectCellData:index:)]) {
        [_adapterDelegate didDeselectCellData:cellData index:indexPath];
    }
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.adapterDelegate) {
        if ([_adapterDelegate respondsToSelector:@selector(willDisplayCell:forRowAtIndexPath:)]) {
            [_adapterDelegate willDisplayCell:cell forRowAtIndexPath:indexPath];
        }
    }
    
//    cell.layer.transform = CATransform3DMakeScale(0.1, 0.1, 1);
//    [UIView animateWithDuration:0.5 animations:^{
//        cell.layer.transform = CATransform3DMakeScale(1, 1, 1);
//    }];
}

@end
