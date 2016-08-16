//
//  UITableViewCell+Coco.m
//  CocoVoice
//
//  Created by pig on 14-2-21.
//
//

#import "UITableViewCell+DD.h"

@implementation UITableViewCell (Coco)

#define COCO_CELL_LINE_HEIGHT  0.5  //(IS_RETINA_SCREEN ? 0.5f : 1.0f)

#pragma mark function

#pragma mark line

- (void)addHeaderLineWithColor:(UIColor *)tColor lineX:(float)tx
{
    UIView *headerLineView = [self.contentView viewWithTag:80000];
    if (headerLineView == nil) {
        headerLineView = [[UIView alloc] init];
        headerLineView.tag = 80000;
        [self.contentView addSubview:headerLineView];
    }
    headerLineView.frame = CGRectMake(tx, 0, SCREEN_WIDTH - tx, COCO_CELL_LINE_HEIGHT);
	headerLineView.backgroundColor = tColor;
}

- (void)addHeaderLineWithColor:(UIColor *)tColor lineX:(float)tx cellHeight:(float)ht
{
    UIView *headerLineView = [self.contentView viewWithTag:80000];
    if (headerLineView == nil) {
        headerLineView = [[UIView alloc] init];
        headerLineView.tag = 80000;
        [self.contentView addSubview:headerLineView];
    }
    headerLineView.frame = CGRectMake(tx, 0, SCREEN_WIDTH - tx, COCO_CELL_LINE_HEIGHT);
	headerLineView.backgroundColor = tColor;
}

- (void)addHeaderLineWithColor:(UIColor *)tColor lineMarginX:(float)tx
{
    UIView *headerLineView = [self.contentView viewWithTag:80000];
    if (headerLineView == nil) {
        headerLineView = [[UIView alloc] init];
        headerLineView.tag = 80000;
        [self.contentView addSubview:headerLineView];
    }
    headerLineView.frame = CGRectMake(tx, 0, SCREEN_WIDTH -2 * tx, COCO_CELL_LINE_HEIGHT);
    headerLineView.backgroundColor = tColor;
}

- (void)addfooterLineWithColor:(UIColor *)tColor lineX:(float)tx
{
    UIView *footerLineView = [self.contentView viewWithTag:90000];
    if (footerLineView == nil) {
        footerLineView = [[UIView alloc] init];
        footerLineView.tag = 90000;
        [self.contentView addSubview:footerLineView];
    }
    footerLineView.frame = CGRectMake(tx, self.frame.size.height - COCO_CELL_LINE_HEIGHT, SCREEN_WIDTH - tx, COCO_CELL_LINE_HEIGHT);
    footerLineView.backgroundColor = tColor;
}

- (void)addfooterLineWithColor:(UIColor *)tColor lineX:(float)tx cellHeight:(float)ht
{
    UIView *footerLineView = [self.contentView viewWithTag:90000];
    if (footerLineView == nil) {
        footerLineView = [[UIView alloc] init];
        footerLineView.tag = 90000;
        [self.contentView addSubview:footerLineView];
    }
    footerLineView.frame = CGRectMake(tx, ht - COCO_CELL_LINE_HEIGHT, SCREEN_WIDTH - tx, COCO_CELL_LINE_HEIGHT);
    footerLineView.backgroundColor = tColor;
}


- (void)addfooterLineWithColor:(UIColor *)tColor lineMarginX:(float)tx cellHeight:(float)ht
{
    UIView *footerLineView = [self.contentView viewWithTag:90000];
    if (footerLineView == nil) {
        footerLineView = [[UIView alloc] init];
        footerLineView.tag = 90000;
        [self.contentView addSubview:footerLineView];
    }
    footerLineView.frame = CGRectMake(tx, ht - COCO_CELL_LINE_HEIGHT, SCREEN_WIDTH - 2*tx, COCO_CELL_LINE_HEIGHT);
    footerLineView.backgroundColor = tColor;
}

- (void)addfooterLineWithColor:(UIColor *)tColor lineX:(float)tx cellHeight:(float)ht lineHeight:(float)lx
{
    UIView *footerLineView = [self.contentView viewWithTag:90000];
    if (footerLineView == nil) {
        footerLineView = [[UIView alloc] init];
        footerLineView.tag = 90000;
        [self.contentView addSubview:footerLineView];
    }
    footerLineView.frame = CGRectMake(tx, ht - lx, SCREEN_WIDTH - tx, lx);
    footerLineView.backgroundColor = tColor;
}

- (void)addLinesOnHeaderAndFooterWithColor:(UIColor *)tColor
{
    [self addHeaderLineWithColor:tColor lineX:0.0f];
    [self addfooterLineWithColor:tColor lineX:0.0f];
}

- (void)cleanLinesOnHeaderAndFooter
{
    UIView *headerLineView = [self.contentView viewWithTag:80000];
    [headerLineView removeFromSuperview];
    headerLineView = nil;
    UIView *footerLineView = [self.contentView viewWithTag:90000];
    [footerLineView removeFromSuperview];
    footerLineView = nil;
}

- (void)setHeaderLineHiden:(BOOL)isHiden
{
    UIView *headerLineView = [self.contentView viewWithTag:80000];
    if (nil != headerLineView) {
        headerLineView.hidden = isHiden;
    }
}

- (void)setFooterLineHiden:(BOOL)isHiden
{
    UIView *footerLineView = [self.contentView viewWithTag:90000];
    if (nil != footerLineView) {
        footerLineView.hidden = isHiden;
    }
}

#pragma mark background view

- (void)setNormalBackgroundViewWithColor:(UIColor *)tColor
{
    UIView *norBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    norBgView.backgroundColor = tColor;
    self.backgroundView = norBgView;
}

- (void)setSelectedBackgroundViewWithColor:(UIColor *)tColor
{
    UIView *selBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.frame.size.height)];
    selBgView.backgroundColor = tColor;
    self.selectedBackgroundView = selBgView;
}

@end
