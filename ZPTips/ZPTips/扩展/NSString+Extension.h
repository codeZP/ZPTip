//
//  NSString+Extension.h
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

//获得图片的类型
- (NSString * _Nullable)contentTypeForImage;

//字符串反转
- (NSString * _Nullable)reverseString;


//字符串反转2(这个效率高点)
- (NSString * _Nullable)reverseInString;

//获取汉子的拼音(带音标)
- (NSString * _Nullable)chinaTransformWithPhoneticSymbol;

- (NSString * _Nullable)chinaTransForm;

@end
