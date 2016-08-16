//
//  SMNoteFolderBottomView.m
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteFolderBottomView.h"
#import <Masonry/Masonry.h>

@interface SMNoteFolderBottomView ()

@property (nonatomic, strong) UIButton *createBtn;
@property (nonatomic, strong) UIView *topLine;

@end

@implementation SMNoteFolderBottomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.topLine];
        [self addSubview:self.createBtn];
        
        [self initConstraints];
    }
    return self;
}

- (void)initConstraints {
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    [self.createBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(- 15);
        make.left.mas_greaterThanOrEqualTo(self).offset(15);
    }];
}

- (void)BottomViewBtnClicked:(UIButton *)btn
{
    if (_block) {
        _block(btn.tag - 10000);
    }
}

- (void)BottomViewBtnClickedWithBlock:(SMNoteFolderBottomViewBlock)block
{
    _block = block;
}

- (void)notifyTheBtnChangeStatus:(BOOL)isEditing {
    if (isEditing) {
        [self.createBtn setTitle:@"删除" forState:UIControlStateNormal];
//        [self.createBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.createBtn.enabled = NO;
        self.createBtn.alpha = 0.3;
        self.createBtn.tag = SMBottomViewBtnTypeOfDelete + 10000;
    } else {
        [self.createBtn setTitle:@"新建文件夹" forState:UIControlStateNormal];
//        [self.createBtn setTitleColor:[UIColor at_goldColor] forState:UIControlStateNormal];
        self.createBtn.enabled = YES;
        self.createBtn.alpha = 1;
        self.createBtn.tag = SMBottomViewBtnTypeCreate + 10000;
    }
}

- (void)modifyTheBtnEnabledWithDeleteArrCount:(NSUInteger)count
{
    if (self.createBtn.tag == SMBottomViewBtnTypeOfDelete + 10000) {
//        [self.createBtn setTitleColor:[UIColor at_goldColor] forState:UIControlStateNormal];
        self.createBtn.enabled = count ? YES : NO;
        self.createBtn.alpha = count ? 1 : 0.3;
    }
    
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = [UIColor at_lightGrayColor];
    }
    
    return _topLine;
}

- (UIButton *)createBtn {
    if (!_createBtn) {
        _createBtn = [UIButton at_createBtnWithTitle:@"新建文件夹" fontSize:15.0 titleColor:[UIColor at_goldColor] imgName:nil bgColor:nil addTarget:self selector:@selector(BottomViewBtnClicked:)];
        _createBtn.tag = SMBottomViewBtnTypeCreate + 10000;
    }
    
    return _createBtn;
}

@end
