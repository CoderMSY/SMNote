//
//  NSString+ATConverter.m
//  Clock
//
//  Created by SimonMiao on 16/7/19.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import "NSString+ATConverter.h"

@implementation NSString (ATConverter)

- (NSData *)at_convertToDataWithUTF8{
    NSData *data = nil;
    if (self.length > 0) {
        data = [self dataUsingEncoding:NSUTF8StringEncoding];
    }
    return data;
}


+ (NSString *)at_convertFromArray:(NSArray *)arr{
    if (arr.count == 0) {
        return @" ";
    }
    NSString *str = nil;
    NSData *data = nil;
    @try {
        data = [NSJSONSerialization dataWithJSONObject:arr options:NSJSONWritingPrettyPrinted error:nil];
        str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    @catch (NSException *exception) {
        data = nil;
        str = nil;
    }
    
    return str;
}


+ (NSString *)at_convertFromDict:(NSDictionary *)dict{
    if (!dict) {
        return @" ";
    }
    NSString *str = nil;
    NSData *data = nil;
    @try {
        data = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:nil];
        str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    @catch (NSException *exception) {
        data = nil;
        str = nil;
    }
    
    return str;
}

//+ (NSString *)at_convertFromDate:(NSNumber *)timeStamp{
//    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longValue]];
//    NSDateFormatter *formattter = [[NSDateFormatter alloc]init];
//    [formattter setDateFormat:@"yyyy-MM-dd"];
//    NSString *dateString = [formattter stringFromDate:date];
//    return dateString;
//}

/** 获取设备UUID */
+ (NSString *)at_getDeviceUUID {
    NSString *uuidStr = [[NSUserDefaults standardUserDefaults] valueForKey:@"TTDeviceUUID"];
    if (uuidStr.length>0) {
        return uuidStr;
    }
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuidStringRef = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    uuidStr = (__bridge_transfer NSString *)uuidStringRef;
    
    [[NSUserDefaults standardUserDefaults] setValue:uuidStr forKey:@"TTDeviceUUID"];
    return uuidStr;
}

+ (NSString *)at_getFormatterDateStrWithFormatterStr:(NSString *)formatterStr timeStamp:(NSNumber *)timeStamp
{
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:[timeStamp longLongValue]];
    NSString *dateString = [NSString at_getFormatterDateStrWithFormatterStr:formatterStr date:date];
    
    return dateString;
}

+ (NSString *)at_getFormatterDateStrWithFormatterStr:(NSString *)formatterStr date:(NSDate *)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:formatterStr];
    
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh-Hans"];
    [formatter setLocale:locale];
    NSString *dateString = [formatter stringFromDate:date];
    
    return dateString;
}

@end
