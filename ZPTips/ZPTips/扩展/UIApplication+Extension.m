//
//  UIApplication+Extension.m
//  ZPTips
//
//  Created by yueru on 2016/11/30.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "UIApplication+Extension.h"

@implementation UIApplication (Extension)

- (void)setStatusBarBachgroundColor:(nonnull UIColor *)color {
    UIView *statusBar = [[self valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)])
    {
        statusBar.backgroundColor = color;
    }
}

@end
