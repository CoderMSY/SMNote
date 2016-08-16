//
//  SMDeleteAlertController.h
//  SMNote
//
//  Created by SimonMiao on 16/8/15.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SMDeleteAlertActionType) {
    SMDeleteAlertActionTypeCancel,//
    SMDeleteAlertActionTypeDeleteFolderOnly,
    SMDeleteAlertActionTypeDeleteFolderAndNotes//
};

typedef void(^SMDeleteAlertControllerBlock)(SMDeleteAlertActionType type);
@class SMNoteFolderModel;
@interface SMDeleteAlertController : UIAlertController

@property (nonatomic, strong) NSArray <SMNoteFolderModel *> *deleteArray;
@property (nonatomic, copy) SMDeleteAlertControllerBlock block;

- (void)deleteAlertActionClick:(SMDeleteAlertControllerBlock)block;

@end
