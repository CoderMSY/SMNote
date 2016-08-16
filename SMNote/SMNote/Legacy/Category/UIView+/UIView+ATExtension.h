//
//  UIView+ATExtension.h
//  Clock
//
//  Created by Dariel on 16/7/20.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ATExtension)

- (UIViewController*)viewController;

@property (nonatomic, assign) CGFloat at_centerX;
@property (nonatomic, assign) CGFloat at_centerY;

@property (nonatomic, assign) CGFloat at_width;
@property (nonatomic, assign) CGFloat at_height;

@property (nonatomic, assign) CGSize at_size;

@end
