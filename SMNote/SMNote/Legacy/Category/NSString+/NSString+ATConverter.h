//
//  NSString+ATConverter.h
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ATConverter)

- (NSData *)at_convertToDataWithUTF8;

+ (NSString *)at_convertFromArray:(NSArray *)arr;

+ (NSString *)at_convertFromDict:(NSDictionary *)dict;

//+ (NSString *)at_convertFromDate:(NSNumber *)timeStamp;

/** 获取设备UUID */
+ (NSString *)at_getDeviceUUID;

/**
 *  由时间戳获取自定义字符串时间
 *
 *  @param formatterStr 自定义格式 yyyyMMdd HH:mm:ss
 *  @param timeStamp    时间戳
 *
 *  @return 时间字符串
 */
+ (NSString *)at_getFormatterDateStrWithFormatterStr:(NSString *)formatterStr timeStamp:(NSNumber *)timeStamp;

/**
 *  由NSDate获取自定义字符串时间
 *
 *  @param formatterStr 自定义格式 yyyyMMdd HH:mm:ss
 *  @param date         NSDate
 *
 *  @return 时间字符串
 */
+ (NSString *)at_getFormatterDateStrWithFormatterStr:(NSString *)formatterStr date:(NSDate *)date;

@end
