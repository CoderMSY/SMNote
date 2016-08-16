//
//  SMNoteDetailView.h
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMNoteDetailModel;
@protocol SMNoteDetailViewDelegate <NSObject>

- (void)smNoteDetailViewDelegateOfBecomeFirstResponder;
- (void)smNoteDetailViewDelegateOfResignFirstResponder:(SMNoteDetailModel *)model;

@end

@interface SMNoteDetailView : UIView

@property (nonatomic, strong) SMNoteDetailModel *detailModel;
@property (nonatomic, weak) id <SMNoteDetailViewDelegate> delegate;

/** 注销键盘 */
- (void)resignKeyboard;

@end
