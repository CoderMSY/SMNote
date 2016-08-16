//
//  ATTableViewCell.m
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import "ATTableViewCell.h"

@implementation ATTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
//        self.lineHeight = IS_RETINA_SCREEN ? 0.5f : 1.0f;
        
//        self.mHeaderLineView = [[UIView alloc] init];
//        self.mHeaderLineView.backgroundColor = [UIColor at_colorWithHex:0xc8c8c8];
//        self.mHeaderLineView.hidden = YES;
//        [self.contentView addSubview:self.mHeaderLineView];
//        
//        self.mFooterLineView = [[UIView alloc] init];
//        self.mFooterLineView.backgroundColor = [UIColor at_colorWithHex:0xc8c8c8];
//        self.mFooterLineView.hidden = YES;
//        [self.contentView addSubview:self.mFooterLineView];
        
        //nor bg view
        UIView *norBgView = [[UIView alloc] init];
        norBgView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        norBgView.backgroundColor = [UIColor at_backgroundColor];
        self.backgroundView = norBgView;
        
        //sel bg view
        UIView *selBgView = [[UIView alloc] init];
        selBgView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
        selBgView.backgroundColor = [UIColor at_colorWithHex:0xF0E6C8];//[UIColor at_colorWithHex:0xc8c8c8];
        self.selectedBackgroundView = selBgView;
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.selectedBackgroundView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    self.backgroundView.frame =  CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
}

- (void)updateCellWithData:(id)aCellData hideHeaderLine:(BOOL)isHeaderHidden hideFooterLine:(BOOL)isFooterHidden
{
    //todo
}

- (CGSize)calcSizeWithLabel:(UILabel *)aLabel constrainedToSize:(CGSize)aSize
{
    if (aLabel.text.length < 1) {
        return CGSizeZero;
    }
//    CGSize textSize = [aLabel.text sizeWithFont:aLabel.font constrainedToSize:aSize lineBreakMode:NSLineBreakByTruncatingTail];
    CGSize textSize = [aLabel.text boundingRectWithSize:aSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : aLabel.font} context:nil].size;
    
    return textSize;
}

- (CGSize)calcSizeWithText:(NSString *)aText font:(UIFont *)aFont constrainedToSize:(CGSize)aSize
{
    CGSize textSize = CGSizeZero;
    if (aText.length > 0) {
//        textSize = [aText sizeWithFont:aFont constrainedToSize:aSize lineBreakMode:NSLineBreakByTruncatingTail];
        textSize = [aText boundingRectWithSize:aSize options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : aFont} context:nil].size;
    }
    return textSize;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
