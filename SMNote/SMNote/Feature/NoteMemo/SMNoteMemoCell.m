//
//  SMNoteMemoCell.m
//  SMNote
//
//  Created by SimonMiao on 16/8/12.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "SMNoteMemoCell.h"
#import "SMNoteDetailModel.h"

#import "NSString+ATConverter.h"

@interface SMNoteMemoCell ()

@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *dateLab;
@property (nonatomic, strong) UILabel *additionalLab;

@end

@implementation SMNoteMemoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.titleLab];
        [self.contentView addSubview:self.dateLab];
        [self.contentView addSubview:self.additionalLab];
        
        [self initConstraints];
    }
    
    return self;
}

- (void)initConstraints {
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView).offset(10);
        make.left.mas_equalTo(self.contentView).offset(15);
        make.right.mas_equalTo(self).offset(- 30);
    }];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_greaterThanOrEqualTo(self.titleLab.mas_bottom);
        make.left.mas_equalTo(self.contentView).offset(12);
        make.bottom.mas_equalTo(self.contentView).offset(- 10);
    }];
    [self.additionalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.dateLab);
        make.left.mas_equalTo(self.dateLab.mas_right).offset(10);
        make.right.mas_lessThanOrEqualTo(self).offset(- 30);
    }];
}

- (void)updateCellWithData:(id)aCellData hideHeaderLine:(BOOL)isHeaderHidden hideFooterLine:(BOOL)isFooterHidden
{
    if ([aCellData isKindOfClass:[SMNoteDetailModel class]]) {
        SMNoteDetailModel *model = (SMNoteDetailModel *)aCellData;
        self.titleLab.text = model.contentStr;
        self.dateLab.text = [NSString at_getFormatterDateStrWithFormatterStr:@" yyyy/MM/dd HH:mm" timeStamp:model.timestamp];
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel at_createLabWithText:nil fontSize:15.0 titleColor:[UIColor at_blackColor]];
    }
    
    return _titleLab;
}


- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel at_createLabWithText:nil fontSize:12.0 titleColor:[UIColor grayColor]];
    }
    
    return _dateLab;
}

- (UILabel *)additionalLab {
    if (!_additionalLab) {
        _additionalLab = [UILabel at_createLabWithText:@"No additional text No additional text No additional text No additional text No additional text No additional text No additional text" fontSize:12.0 titleColor:[UIColor lightGrayColor]];
    }
    
    return _additionalLab;
}

@end
