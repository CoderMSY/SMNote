//
//  SMNoteFolderCell.m
//  SMNote
//
//  Created by SimonMiao on 16/8/9.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteFolderCell.h"
#import "SMNoteFolderModel.h"

@interface SMNoteFolderCell ()
{
    BOOL       _editing;
    UIControl *_editCtl;
}

@property (nonatomic, strong) UIButton *titleBtn;
@property (nonatomic, strong) UILabel *numLab;

@end

@implementation SMNoteFolderCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [self.contentView addSubview:self.titleBtn];
        [self.contentView addSubview:self.numLab];
        
        [self initConstraints];
    }
    
    return self;
}

- (void)initConstraints
{
    [self.titleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.contentView).offset(15);
//        make.right.mas_lessThanOrEqualTo(self.numLab.mas_left).offset(- 10);
    }];
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_greaterThanOrEqualTo(self.titleBtn.mas_right).offset(10);
        make.right.mas_equalTo(self).offset(-30 - 5);
    }];
}

- (void)updateCellWithData:(id)aCellData hideHeaderLine:(BOOL)isHeaderHidden hideFooterLine:(BOOL)isFooterHidden
{
    if ([aCellData isKindOfClass:[SMNoteFolderModel class]]) {
        SMNoteFolderModel *model = (SMNoteFolderModel *)aCellData;
        [self.titleBtn setTitle:model.title forState:UIControlStateNormal];
        self.numLab.text = model.number.stringValue;
    } else if ([aCellData isKindOfClass:[SMNoteTrashFolderModel class]]) {
        SMNoteTrashFolderModel *model = (SMNoteTrashFolderModel *)aCellData;
        [self.titleBtn setTitle:model.title forState:UIControlStateNormal];
        self.numLab.text = model.number.stringValue;
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
//    ATLog(@"###selected####:%i",selected);
    if (selected) {
//        self.selectionStyle = UITableViewCellSelectionStyleBlue;
//        self.editingAccessoryView =
        
    } else {
//        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
//    if (_editing) {
        _editCtl.selected = selected;
//        _editCtl.highlighted = selected;
//    }
    
//    NSArray *arrs = [_editCtl actionsForTarget:self forControlEvent:UIControlEventTouchUpInside];
//    NSSet *set = [_editCtl allTargets];
//    ATLog(@"%@",set);
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
//    ATLog(@"###editing####:%i",editing);
    _editing = editing;
    self.titleBtn.enabled = editing;
//    if (!_editCtl) {
        for (UIControl *control  in self.subviews) {
//            ATLog(@"&&&&self.subviews.count:%lu",(unsigned long)self.subviews.count);
            if ([control isMemberOfClass:NSClassFromString(@"UITableViewCellEditControl")]) {
                _editCtl = control;
            }
        }
//    }
    
    
}

- (void)titleBtnClicked:(UIButton *)btn {
    if (_block) {
        _block(btn.titleLabel.text);
    }
}

- (void)titleBtnClickedWithBlock:(SMNoteFolderCellBlock)block
{
    _block = block;
}

- (UIButton *)titleBtn {
    if (!_titleBtn) {
        _titleBtn = [UIButton at_createBtnWithTitle:@"" fontSize:15.0 titleColor:[UIColor at_darkGrayColor] imgName:nil bgColor:nil addTarget:self selector:@selector(titleBtnClicked:)];
        _titleBtn.enabled = NO;
    }
    
    return _titleBtn;
}

//- (UILabel *)titleLab {
//    if (!_titleLab) {
//        _titleLab = [UILabel at_createLabWithText:@"" fontSize:15.0 titleColor:[UIColor at_darkGrayColor]];
//    }
//    
//    return _titleLab;
//}

- (UILabel *)numLab {
    if (!_numLab) {
        _numLab = [UILabel at_createLabWithText:@"" fontSize:15.0 titleColor:[UIColor at_blackColor]];
        [_numLab setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    }
    
    return _numLab;
}

@end
