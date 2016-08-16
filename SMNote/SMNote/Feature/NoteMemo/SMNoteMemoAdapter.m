//
//  SMNoteMemoAdapter.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteMemoAdapter.h"
#import "SMNoteMemoCell.h"

#import "SMNoteDetailModel.h"
#import "SMDaoFactory.h"

@implementation SMNoteMemoAdapter

- (NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _deleteArray;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSMNoteDetailModel:(id)cellData {
    NSString *cellId = NSStringFromSelector(_cmd);
    SMNoteMemoCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SMNoteMemoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    [cell updateCellWithData:cellData hideHeaderLine:YES hideFooterLine:NO];
    
    return cell;
}

#pragma mark - UITableViewDatasource

//- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        id cellData = self.adapterArray[indexPath.row];
        if ([cellData isKindOfClass:[SMNoteDetailModel class]]) {
            SMNoteDetailModel *model = (SMNoteDetailModel *)cellData;
            [self.adapterArray removeObject:model];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
            [[_Dao getMemoDao] removeMemos:@[model] async:YES];
        }
    }
}

#pragma mark - UITableViewDelegate

//- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewCellEditingStyleDelete;
//}


@end
