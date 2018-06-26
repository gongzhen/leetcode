//
//  LC994.m
//  LC
//
//  Created by Zhen Gong on 6/1/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC994.h"
#import "QuickSort.h"

@implementation LC994

- (NSArray *)intersection:(NSArray<NSArray *> *)arrays {
    __block NSMutableArray<NSArray *> *list = [NSMutableArray array];
    [arrays enumerateObjectsUsingBlock:^(NSArray * _Nonnull subArray, NSUInteger idx, BOOL * _Nonnull stop) {
        [list addObject:[subArray sortedArrayUsingSelector:@selector(compare:)]];
    }];
    
    __block NSMutableSet *intersectSet = [NSMutableSet setWithArray:list[0]];
    [list enumerateObjectsUsingBlock:^(NSArray * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSSet *set = [NSSet setWithArray:obj];
        [intersectSet intersectSet:set];
    }];
    DLog(@"intersectSet:%@", intersectSet);
    return [intersectSet allObjects];
}

- (NSArray *)intersection1:(NSArray<NSArray *> *)arrays {
    __block NSMutableArray<NSArray *> *list = [NSMutableArray array];
    [arrays enumerateObjectsUsingBlock:^(NSArray * _Nonnull subArray, NSUInteger idx, BOOL * _Nonnull stop) {
        [list addObject:[subArray sortedArrayUsingSelector:@selector(compare:)]];
    }];
    
    return [self partition:list s:0 e:(int)(list.count - 1)];
}

- (NSArray *)partition:(NSArray<NSArray *> *)arrays s:(int)s e:(int)e {
    int i = s;
    int j = e;
    if(i > j) {
        return nil;
    }
    
    if(i == j) {
        return arrays[i];
    }
    
    int m = i + (j - i) / 2;
    NSArray *left = [self partition:arrays s:i e:m];
    NSArray *right =[self partition:arrays s:m + 1 e:j];
    return [self mergeCommon:left right:right];
}

- (NSArray *)mergeCommon:(NSArray *)left right:(NSArray *)right {
    int i = 0, j = 0;
    NSMutableArray<NSNumber *> *res = [NSMutableArray array];
    while(i < left.count && j < right.count) {
        if ([left[i] compare:right[j]] == NSOrderedSame) {
            [res addObject:left[i]];
            i++;
            j++;
        } else if ([left[i] compare:right[j]] == NSOrderedAscending) {
            i++;
        } else {
            j++;
        }
    }
    return [res copy];
}

- (void)test {
    NSArray *arrays = @[
                        @[@(2), @(3), @(4), @(7), @(1)],
                        @[@(4), @(1), @(3), @(5)],
                        @[@(8), @(4), @(6), @(2), @(1)],
                        @[@(7), @(9), @(4), @(1)]
                        ];
    // [self intersection:arrays];
    NSArray<NSNumber *>* res = [self intersection1:arrays];
    DLog(@"res:%@", res);
//    [self multiplicationTable:5];
    
//    NSTimeInterval todayTimeInterval = [[NSDate date] timeIntervalSince1970];

//    NSLog(@"%ld",todayTimeInterval);
    
//    DLog(@"%@", [self testhour: 23]);
}

- (NSString *)multiplicationTable:(NSInteger)n {
    if(n <= 0) {
        return @"";
    }
    NSMutableString *res = [NSMutableString new];
    for(int i = 1; i <= n; i++) {
        for(int j = 1; j <= n; j++) {
            if(j == n) {
                [res appendString:[NSString stringWithFormat:@"%d\n", i * j]];
            } else {
                [res appendString:[NSString stringWithFormat:@"%d", i * j]];
                [res appendString:@" "];
            }
        }
    }
    DLog(@"%@", res);
    return res;
}

- (NSString *)testhour:(NSInteger)num {
    if(num < 0 || num > 24) {
        return @"Invalid number";
    }
    
    // num <= 12 : AM
    if(num <= 12) {
        if(num < 10) {// 01, 02, 03 ... 09
            return [NSString stringWithFormat:@"0%ld:00 AM", num];
        } else { // 10, 11, 12
            return [NSString stringWithFormat:@"%ld:00 AM", num];
        }
    }
    
    // num > 12 PM
    if(num <= 21) {
        // 01, 02, 03 ... 09:00PM
        return [NSString stringWithFormat:@"0%ld:00 PM", num % 12];
        
    }
    // 10, 11, 12 PM
    return [NSString stringWithFormat:@"%ld:00 PM", num % 12];
    
}
@end
