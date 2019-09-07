//
//  PrintHelper.m
//  LC
//
//  Created by Zhen Gong on 8/21/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "PrintHelper.h"

@interface PrintHelper()

@end

@implementation PrintHelper

+ (void)printString:(NSString *)string
{
    if (!string) {
        DLog(@"nil");
    } else {
        DLog(@"%@", string); 
    }
}

+ (void)printDouble:(double)number
{
    DLog(@"%.2f", number);
}

+ (void)printInteger:(NSInteger)number
{
    DLog(@"%ld", (long)number);
}

+ (void)printStringArray:(NSArray<NSString *> *)list
{
    if (!list) {
        return;
    }
    [list enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%@", obj);
    }];
}

+ (void)printIntArray:(NSArray<NSNumber *> *)list {
    if (!list) {
        return;
    }
    [list enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"%d", [obj intValue]);
    }];
}

@end
