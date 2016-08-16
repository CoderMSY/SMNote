//
//  SMNoteDetailView.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteDetailView.h"
#import <Masonry/Masonry.h>
#import "ATTextView.h"
#import "SMNoteDetailBottomToolBar.h"

#import "SMNoteDetailModel.h"
#import "NSString+ATConverter.h"

@interface SMNoteDetailView () <UITextViewDelegate>
{
    NSDate *_currentDate;
}

@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) ATTextView *textView;
@property (nonatomic, strong) SMNoteDetailBottomToolBar *toolBar;

@end

@implementation SMNoteDetailView

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        [self addSubview:self.textView];
        [self.textView addSubview:self.dateLab];
        [self addSubview:self.toolBar];
        
        self.textView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);;
        self.textView.scrollEnabled = YES;
        [self initConstraints];
    }
    return self;
}

- (void)initConstraints {
    [self.textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.bottom.mas_equalTo(self.toolBar.mas_top).mas_offset(- 10);
    }];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.textView).offset(- 20);
        make.centerX.mas_equalTo(self.textView);
        make.height.mas_equalTo(20);
    }];
    [self.toolBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self);
        make.height.mas_equalTo(44);
    }];
}

- (void)setDetailModel:(SMNoteDetailModel *)detailModel {
    if (!detailModel) {
        return;
    }
    _detailModel = detailModel;
    self.textView.text = detailModel.contentStr;
    self.dateLab.text = [NSString at_getFormatterDateStrWithFormatterStr:@"yyyy年MM月dd日 HH:mm" timeStamp:detailModel.timestamp];
}

//注销键盘
- (void)resignKeyboard
{
    [self.textView resignFirstResponder];
    if ([_delegate respondsToSelector:@selector(smNoteDetailViewDelegateOfResignFirstResponder:)]) {
        SMNoteDetailModel *model = [self coverTheModel];
        [_delegate smNoteDetailViewDelegateOfResignFirstResponder:model];
    }
    
}

- (SMNoteDetailModel *)coverTheModel {
    if (_detailModel) {
        _detailModel.contentStr = self.textView.text;
        
        return _detailModel;
    } else {
        SMNoteDetailModel *model = [[SMNoteDetailModel alloc] init];
        model.contentStr = self.textView.text;
        NSTimeInterval timeInterval = [_currentDate timeIntervalSince1970];
        model.timestamp = [NSNumber numberWithDouble:timeInterval];
        model.image = nil;
        
        return model;
    }
}

#pragma mark - UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
//    [self moveUpTextViewFrame];
    if ([_delegate respondsToSelector:@selector(smNoteDetailViewDelegateOfBecomeFirstResponder)]) {
        [_delegate smNoteDetailViewDelegateOfBecomeFirstResponder];
    }
    
    return YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
//    _remark = textView.text;
}



#pragma mark - UIScrollViewDelegate

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    ATLog(@"scrollViewWillBeginDragging");
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    ATLog(@"是否减速:%i",decelerate);
    if (scrollView.contentOffset.y < 0 && decelerate) {
        [self resignKeyboard];
        
    } else {
        
    }
}


- (UILabel *)dateLab {
    if (!_dateLab) {
        _currentDate = [NSDate date];
        NSString *dateStr = [NSString at_getFormatterDateStrWithFormatterStr:@"yyyy年MM月dd日 HH:mm" date:_currentDate];
        _dateLab = [UILabel at_createLabWithText:dateStr fontSize:10.0 titleColor:[UIColor lightGrayColor]];
    }
    
    return _dateLab;
}

- (ATTextView *)textView {
    if (!_textView) {
        _textView = [[ATTextView alloc] init];
        _textView.editable = YES;
        _textView.delegate = self;
        _textView.textColor = [UIColor at_blackColor];
        _textView.font = [UIFont systemFontOfSize:13.0];
        _textView.placeholderColor = [UIColor at_lightGrayColor];
        _textView.placeholder = @"填写note...";
    }
    
    return _textView;
}

- (SMNoteDetailBottomToolBar *)toolBar {
    if (!_toolBar) {
        _toolBar = [[SMNoteDetailBottomToolBar alloc] init];
    }
    
    return _toolBar;
}

@end
