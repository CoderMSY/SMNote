//
//  UIView+ATExtension.m
//  Clock
//
//  Created by Dariel on 16/7/20.
//  Copyright © 2016年 Dariel. All rights reserved.
//

#import "UIView+ATExtension.h"

@implementation UIView (ATExtension)

- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)setAt_centerX:(CGFloat)at_centerX
{
    CGPoint center = self.center;
    center.x = at_centerX;
    self.center = center;
}

- (CGFloat)at_centerX
{
    return self.center.x;
}

- (void)setAt_centerY:(CGFloat)at_centerY
{
    CGPoint center = self.center;
    center.y = at_centerY;
    self.center = center;
}

- (CGFloat)at_centerY
{
    return self.center.y;
}

- (CGFloat)at_height {
    return self.frame.size.height;
}


- (void)setAt_height:(CGFloat)at_height {
    
    CGRect frame = self.frame;
    frame.size.height = at_height;
    self.frame = frame;
}

- (CGFloat)at_width {
    return self.frame.size.width;
}

- (void)setAt_width:(CGFloat)at_width {
    
    CGRect frame = self.frame;
    frame.size.width = at_width;
    self.frame = frame;
}

- (CGSize)at_size {
    return self.frame.size;
}

- (void)setAt_size:(CGSize)at_size {
    CGRect frame = self.frame;
    frame.size.width = at_size.width;
    frame.size.height = at_size.height;
    self.frame = frame;
}


@end
