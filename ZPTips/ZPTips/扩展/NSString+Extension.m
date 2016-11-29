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

@end
