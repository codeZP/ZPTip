//
//  UIView+CustomRadio.h
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CustomRadio)

//控制局部圆角问题
- (void)customRadionWithCornerType:(nonnull  UIRectCorner )corner radio:(nonnull  CGFloat)radio;

//判断view是不是制定view的子视图
- (BOOL)isChildViewWith:(nonnull UIView *)view;

@end
