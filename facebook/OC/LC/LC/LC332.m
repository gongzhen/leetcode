//
//  LC332.m
//  LC
//
//  Created by Zhen Gong on 10/9/19.
//  Copyright © 2019 ULS. All rights reserved.
//

#import "LC332.h"

@implementation LC332

- (NSArray<NSString *> *)findItinerary:(NSArray<NSArray<NSString *> *> *)tickets {
    NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *map = [NSMutableDictionary dictionary];
    for(NSArray<NSString *> * ticket in tickets) {
        NSMutableArray<NSString *> *list = [map objectForKey:ticket[0]];
        if (list == nil) {
            list = [NSMutableArray array];
        }
        [list addObject:ticket[1]];
        [list sortUsingComparator:^NSComparisonResult(NSString * _Nonnull obj1, NSString * _Nonnull obj2) {
            return [obj2 compare:obj1];
        }];
        [map setObject:list forKey:ticket[0]];
    }
    
    NSMutableArray<NSString *> *res = [NSMutableArray array];
    [self dfs:map res:res city:@"JFK"];
    return res;
}

- (void)dfs:(NSMutableDictionary<NSString *, NSMutableArray<NSString *> *> *)map res:(NSMutableArray<NSString *> *)res city:(NSString *)city {
    NSMutableArray<NSString *> *queue = [map objectForKey:city];
    while (queue != nil && queue.count > 0) {
        NSString *dest = [queue objectAtIndex:queue.count - 1];
        [queue removeLastObject];
        [self dfs:map res:res city:dest];
    }
    
    [res insertObject:city atIndex:0];
}

@end
