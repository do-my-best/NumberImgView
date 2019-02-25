//
//  UIView+Frame.m
//  PandaTV-HD
//
//  Created by liuzhu on 16/3/15.
//  Copyright © 2016年 zuowenping. All rights reserved.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

#pragma mark - set 方法
- (void)setX:(CGFloat)x{
    CGRect rect = self.frame;
    rect.origin.x = x;
    self.frame = rect;
}

- (void)setY:(CGFloat)y{
    CGRect rect = self.frame;
    rect.origin.y = y;
    self.frame = rect;
}


- (void)setWidth:(CGFloat)width{
    CGRect rect = self.frame;
    rect.size.width = width;
    self.frame = rect;
}


- (void)setHeight:(CGFloat)height{
    CGRect rect = self.frame;
    rect.size.height = height;
    self.frame = rect;
}

- (void)setCenterX:(CGFloat)centerX{
    CGPoint point = self.center;
    point.x = centerX;
    self.center = point;
}

- (void)setCenterY:(CGFloat)centerY{
    CGPoint point = self.center;
    point.y = centerY;
    self.center = point;
}


#pragma mark - get 方法
- (CGFloat)x{
    CGRect rect = self.frame;
    return rect.origin.x;
}

- (CGFloat)y{
    CGRect rect = self.frame;
    return rect.origin.y;
}

- (CGFloat)width{
    CGRect rect = self.frame;
    return rect.size.width;
}

- (CGFloat)height{
    CGRect rect = self.frame;
    return rect.size.height;
}

- (CGFloat)centerX{
    CGPoint point = self.center;
    return point.x;
}

- (CGFloat)centerY{
    CGPoint point = self.center;
    return point.y;
}


@end
