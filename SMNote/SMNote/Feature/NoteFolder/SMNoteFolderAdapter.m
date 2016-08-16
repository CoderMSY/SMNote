//
//  SMNoteFolderAdapter.m
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteFolderAdapter.h"
#import "SMNoteFolderCell.h"

#import "ATCommonCellModel.h"
#import "SMNoteFolderModel.h"
#import "SMDaoFactory.h"

@implementation SMNoteFolderAdapter

- (NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [NSMutableArray arrayWithCapacity:0];
    }
    
    return _deleteArray;
}

- (void)modifyFolderName:(SMNoteFolderAdapterBlock)block
{
    _block = block;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.adapterArray[indexPath.row];
    if ([model isKindOfClass:[ATTitleCellModel class]]) {
        return 33;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForATTitleCellModel:(id)cellData {
    NSString *cellId = NSStringFromSelector(_cmd);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellId];
    }
    ATTitleCellModel *model = (ATTitleCellModel *)cellData;
    cell.textLabel.text = model.title;
    
    return cell;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForSMNoteFolderModel:(id)cellData {
    NSString *cellId = NSStringFromSelector(_cmd);
    SMNoteFolderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SMNoteFolderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell titleBtnClickedWithBlock:^(NSString *title) {
            if (_block) {
                _block(title);
            }
        }];
    }
//    cell.separatorInset = UIEdgeInsetsMake(0, 30, 0, 0);
    [cell updateCellWithData:cellData hideHeaderLine:YES hideFooterLine:NO];
    
    return cell;
}

//SMNoteTrashFolderModel
- (UITableViewCell *)tableView:(UITableView *)tableView cellForSMNoteTrashFolderModel:(id)cellData {
    NSString *cellId = NSStringFromSelector(_cmd);
    SMNoteFolderCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[SMNoteFolderCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
//        cell.selectionStyle = UITableViewCellSelectionStyleNone;
//        [cell titleBtnClickedWithBlock:^(NSString *title) {
//            if (_block) {
//                _block(title);
//            }
//        }];
    }
    [cell updateCellWithData:cellData hideHeaderLine:YES hideFooterLine:NO];
    
    return cell;
}

//指定哪些cell可以编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    id model = self.adapterArray[indexPath.row];
    if ([model isKindOfClass:[ATTitleCellModel class]]) {
        return NO;
    } else if ([model isKindOfClass:[SMNoteFolderModel class]]) {
        SMNoteFolderModel *folder = (SMNoteFolderModel *)model;
        if (0 == folder.order.integerValue) {
            return NO;
        } else {
            return YES;
        }
    } else {
        return YES;
    }
}

//选择你要对表进行处理的方式  默认是删除方式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return UITableViewCellEditingStyleDelete;
}

//选择编辑的方式,按照选择的方式对表进行处理
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        id model = self.adapterArray[indexPath.row];
        if ([model isKindOfClass:[SMNoteFolderModel class]]) {
            [self.adapterArray removeObject:model];
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
            [[_Dao getFolderDao] removeFolders:@[model] async:YES];
        }
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        ATLog(@"插入操作");
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if (tableView.editing) {
        
    } else {
        
    }
}

//- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
////    [self.deleteArray removeObject:self.adapterArray[indexPath.row]];
//    if ([_delegate respondsToSelector:@selector(didDeselectCellData:index:)]) {
//        id cellData = self.adapterArray[indexPath.row];
//        [_delegate didDeselectCellData:cellData index:indexPath];
//    }
//}

//修改删除按钮的文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

// 8.0后侧滑菜单的新接口，支持多个侧滑按钮。
//- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
//    UITableViewRowAction *toTop = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"置顶" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
//        NSLog(@"置顶");
//        [tableView setEditing:NO animated:YES];
//    }];
//    toTop.backgroundColor =[UIColor redColor];
//    
//    return @[toTop];
//}

//指定哪些cell可以移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    if (0 == indexPath.row) {
        return NO;
    } else {
        return NO;
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    ATLog(@"sourceIndexPath:%@,destinationIndexPath:%@",sourceIndexPath,destinationIndexPath);
}




@end
