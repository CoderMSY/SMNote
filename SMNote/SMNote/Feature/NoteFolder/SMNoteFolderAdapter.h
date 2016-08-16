//
//  SMNoteFolderAdapter.h
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATTableViewAdapter.h"

typedef void(^SMNoteFolderAdapterBlock)(NSString *title);

//@protocol SMNoteFolderAdapterDelegate <NSObject>
//
//- (void)didDeselectCellData:(id)cellData index:(NSIndexPath *)indexPath;
//
//@end

@interface SMNoteFolderAdapter : ATTableViewAdapter

@property (nonatomic, strong)   NSMutableArray*                         deleteArray;
@property (nonatomic, copy) SMNoteFolderAdapterBlock block;

- (void)modifyFolderName:(SMNoteFolderAdapterBlock)block;

@end
