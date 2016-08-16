//
//  SMNoteDetailModel.h
//  SMNote
//
//  Created by SimonMiao on 16/8/12.
//  Copyright © 2016年 MSY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMNoteDetailModel : NSObject

@property (nonatomic, copy) NSString *contentStr;
@property (nonatomic, strong) NSNumber *timestamp; //!< 新建该条备忘录的时间戳（唯一的）
@property (nonatomic, strong) UIImage *image;

@property (nonatomic, strong) NSNumber *order; //!<该笔记所属的文件夹标记

@end
