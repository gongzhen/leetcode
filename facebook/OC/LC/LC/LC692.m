//
//  LC692.m
//  LC
//
//  Created by Zhen Gong on 10/7/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC692.h"

@implementation LC692

- (NSArray<NSString *> *)topKFrequent:(NSArray<NSString *> *)words k:(NSUInteger)k
{
    if(words == nil || words.count == 0) {
        return nil;
    }
    NSMutableDictionary<NSString *, NSNumber *> *map = [NSMutableDictionary dictionary];
    for (NSString *word in words) {
        NSNumber *value = [map objectForKey:word];
        if(value == nil) {
            value = [NSNumber numberWithUnsignedInt:1];
        } else {
            value = [NSNumber numberWithUnsignedInt:(value.unsignedIntValue) + 1];
        }
        [map setObject:value forKey:word];
    }
    
    NSArray<NSString *> *sortedKey = [map.allKeys sortedArrayUsingComparator:^NSComparisonResult(NSString * _Nonnull key1, NSString * _Nonnull key2) {
        int count1 = [[map objectForKey:key1] intValue];
        int count2 = [[map objectForKey:key2] intValue];
        if (count1 > count2) {
            return -1;
        } else if (count1 == count2) {
            return 0;
        }
        return 1;
    }];
    __block NSMutableArray<NSString *> *res = [NSMutableArray array];
    [sortedKey enumerateObjectsUsingBlock:^(NSString * _Nonnull element, NSUInteger idx, BOOL * _Nonnull stop) {
        if (res.count < k) {
            [res addObject:element];
        } else {
            *stop = YES;
        }
    }];
    return [res copy];
}

- (void)test {
    NSArray<NSString *> *res = [self topKFrequent:@[@"i", @"love", @"leetcode", @"i", @"love", @"coding"] k:2];
    [res enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSLog(@"%@", obj);
    }];
}

@end
