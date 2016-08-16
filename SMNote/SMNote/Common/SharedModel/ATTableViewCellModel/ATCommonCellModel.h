//
//  ATCommonCellModel.h
//  Clock
//
//  Created by SimonMiao on 16/7/22.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ATCommonCellModel : NSObject

@end

@interface ATEmptyCellModel : ATCommonCellModel

@property (nonatomic, assign) BOOL isNeedHeaderLine;
@property (nonatomic, assign) BOOL isNeedFooterLine;

@end

@interface ATTitleCellModel : ATCommonCellModel

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) UIColor *titleColor;

@end
