//
//  UIView+CustomRadio.m
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "UIView+CustomRadio.h"

@implementation UIView (CustomRadio)

- (void)customRadionWithCornerType:(nonnull  UIRectCorner)corner radio:(nonnull  CGFloat)radio {
    //控制局部圆角问题
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(radio, radio)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
}

- (BOOL)isChildViewWith:(nonnull UIView *)view {
    return [self isDescendantOfView:view];
}

@end
