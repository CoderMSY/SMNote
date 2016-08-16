//
//  SMNoteMemoBottomView.m
//  SMNote
//
//  Created by SimonMiao on 16/8/11.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteMemoBottomView.h"
#import <Masonry/Masonry.h>

@interface SMNoteMemoBottomView ()

@property (nonatomic, strong) UIView *topLine;
@property (nonatomic, strong) UIButton *attachmentsBtn; //!< 附件按钮
@property (nonatomic, strong) UILabel *numberLab; //笔记个数
@property (nonatomic, strong) UIButton *writeBtn; //!< 新增按钮

@end

@implementation SMNoteMemoBottomView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.topLine];
        [self addSubview:self.attachmentsBtn];
        [self addSubview:self.numberLab];
        [self addSubview:self.writeBtn];
        
        
        
        [self initConstraints];
    }
    return self;
}

- (void)initConstraints {
    [self.topLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.mas_equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    [self.attachmentsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.left.mas_equalTo(self).offset(15);
    }];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self);
        make.left.mas_greaterThanOrEqualTo(self.attachmentsBtn.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(self.writeBtn.mas_left).offset(- 10);
    }];
    [self.writeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self);
        make.right.mas_equalTo(self).offset(- 15);
    }];
}

- (void)setMemoNumber:(NSUInteger)memoNumber {
    self.numberLab.text = [NSString stringWithFormat:@"%li  notes",memoNumber];
}

- (void)memoBtnClicked:(UIButton *)btn {
    if (_block) {
        _block(btn.tag - 10000);
    }
}

- (void)menoBottomViewOfBtnClicked:(SMNoteMemoBottomViewBlock)block {
    _block = block;
}

- (void)notifyTheBtnChangeStatus:(BOOL)isEditing {
    if (isEditing) {
        self.numberLab.hidden = YES;
        [self configLeftBtnTitle:@"全部移动"
                     leftBtnType:SMNoteMemoBottomViewBtnTypeOfMoveAll
                   rightBtnTitle:@"全部删除"
                    rightBtnType:SMNoteMemoBottomViewBtnTypeOfDeleteAll];
    } else {
        self.numberLab.hidden = NO;
        [self configLeftBtnTitle:@""
                     leftBtnType:SMNoteMemoBottomViewBtnTypeOfAttachments
                   rightBtnTitle:@""
                    rightBtnType:SMNoteMemoBottomViewBtnTypeOfCreate];
    }
}

- (void)modifyTheBtnEnabledWithDeleteArrCount:(NSUInteger)count {
    if (count) {
        [self configLeftBtnTitle:@"移动到"
                     leftBtnType:SMNoteMemoBottomViewBtnTypeOfMove
                   rightBtnTitle:@"删除"
                    rightBtnType:SMNoteMemoBottomViewBtnTypeOfDelete];
    } else {
        [self configLeftBtnTitle:@"全部移动"
                     leftBtnType:SMNoteMemoBottomViewBtnTypeOfMoveAll
                   rightBtnTitle:@"全部删除"
                    rightBtnType:SMNoteMemoBottomViewBtnTypeOfDeleteAll];
    }
}

- (void)configLeftBtnTitle:(NSString *)leftTitle leftBtnType:(SMNoteMemoBottomViewBtnType)leftBtnType rightBtnTitle:(NSString *)rightTitle rightBtnType:(SMNoteMemoBottomViewBtnType)rightBtnType
{
    if (leftBtnType == SMNoteMemoBottomViewBtnTypeOfMoveAll || leftBtnType == SMNoteMemoBottomViewBtnTypeOfMove) {
        [self.attachmentsBtn setImage:nil forState:UIControlStateNormal];
        [self.writeBtn setImage:nil forState:UIControlStateNormal];
    } else {
        [self.attachmentsBtn setImage:[UIImage imageNamed:@"img_noteMemo_attachments"] forState:UIControlStateNormal];
        [self.writeBtn setImage:[UIImage imageNamed:@"img_noteMemo_editing"] forState:UIControlStateNormal];
    }
    [self.attachmentsBtn setTitle:leftTitle forState:UIControlStateNormal];
    self.attachmentsBtn.tag = 10000 + leftBtnType;
    [self.writeBtn setTitle:rightTitle forState:UIControlStateNormal];
    self.writeBtn.tag = 10000 + rightBtnType;
}

- (UIView *)topLine {
    if (!_topLine) {
        _topLine = [[UIView alloc] init];
        _topLine.backgroundColor = [UIColor at_lightGrayColor];
    }
    
    return _topLine;
}

- (UIButton *)attachmentsBtn {
    if (!_attachmentsBtn) {
        _attachmentsBtn = [UIButton at_createBtnWithTitle:nil fontSize:13.0 titleColor:[UIColor blueColor] imgName:@"img_noteMemo_attachments" bgColor:nil addTarget:self selector:@selector(memoBtnClicked:)];
        _attachmentsBtn.tag = 10000 + SMNoteMemoBottomViewBtnTypeOfAttachments;
        
    }
    
    return _attachmentsBtn;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel at_createLabWithText:@"" fontSize:13.0 titleColor:[UIColor blackColor]];
    }
    
    return _numberLab;
}

- (UIButton *)writeBtn {
    if (!_writeBtn) {
        _writeBtn = [UIButton at_createBtnWithTitle:nil fontSize:13.0 titleColor:[UIColor blueColor] imgName:@"img_noteMemo_editing" bgColor:nil addTarget:self selector:@selector(memoBtnClicked:)];
        _writeBtn.tag = 10000 + SMNoteMemoBottomViewBtnTypeOfCreate;
    }
    
    return _writeBtn;
}

@end
