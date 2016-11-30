//
//  NSString+Extension.m
//  ZPTips
//
//  Created by yueru on 2016/11/29.
//  Copyright © 2016年 yueru. All rights reserved.
//

#import "NSString+Extension.h"

@implementation NSString (Extension)

- (NSString * _Nullable)contentTypeForImage {
    uint8_t c;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self]];
    [data getBytes:&c length:1];
    switch (c) {
        case 0xFF:
            return @"jpeg";
            break;
        case 0x89:
            return @"png";
            break;
        case 0x47:
            return @"gif";
            break;
        case 0x49:
        case 0x4D:
            return @"tiff";
            break;
        case 0x52:
            if ([data length] < 12) {
                return nil;
            }
            NSString *str = [[NSString alloc] initWithData:[data subdataWithRange:NSMakeRange(0, 12)] encoding:NSASCIIStringEncoding];
            if ([str hasPrefix:@"RIFF"] && [str hasPrefix:@"WEBP"]) {
                return @"webp";
            }
            break;
    }
    return nil;
}

- (NSString * _Nullable)reverseString {
    NSMutableString *newString = [[NSMutableString alloc] initWithCapacity:self.length];
    for (NSInteger i = self.length - 1; i >= 0; i--) {
        unichar ch = [self characterAtIndex:i];
        [newString appendFormat:@"%c", ch];
    }
    return newString;
}

- (NSString *)reverseInString {
    NSMutableString *reverString = [NSMutableString stringWithCapacity:self.length];
    [self enumerateSubstringsInRange:NSMakeRange(0, self.length) options:NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences  usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
        [reverString appendString:substring];
    }];
    return reverString;
}

- (NSString * _Nullable)chinaTransformWithPhoneticSymbol {
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [self mutableCopy];
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    return pinyin;
}

- (NSString * _Nullable)chinaTransForm {
    //将NSString装换成NSMutableString
    NSMutableString *pinyin = [self mutableCopy];
    //将汉字转换为拼音(带音标)
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformMandarinLatin, NO);
    //去掉拼音的音标
    CFStringTransform((__bridge CFMutableStringRef)pinyin, NULL, kCFStringTransformStripDiacritics, NO);
    //返回最近结果
    return pinyin;
}

@end
