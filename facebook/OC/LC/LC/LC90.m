//
//  LC90.m
//  LC
//
//  Created by Zhen Gong on 5/1/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC90.h"
#import "QuickSort.h"

@implementation LC90

- (NSArray *)subsetsWithDup:(int*)nums numsSize:(int)numsSize {
    NSMutableArray *res = [NSMutableArray array];
    NSMutableArray *list = [NSMutableArray array];
    [QuickSort quickSortInt:nums size:numsSize];
    [QuickSort printIntArray:nums size:numsSize];
    [self dfs:res list:list nums:nums numsSize:numsSize idx:0];
    return res;
}

- (void)dfs:(NSMutableArray *)res list:(NSMutableArray *)list nums:(int *)nums numsSize:(int)numsSize idx:(int)idx {
    [res addObject:[NSArray arrayWithArray:list]];
    [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSNumber *num = (NSNumber *)obj;
        DLog(@"%d", [num intValue]);
    }];
    
    for(int i = idx; i < numsSize; i++) {
        if(i > idx && nums[i - 1] == nums[i]) {
            continue;
        }
        [list addObject:@(nums[i])];
        [self dfs:res list:list nums:nums numsSize:numsSize idx:i + 1];
        [list removeLastObject];
    }
}

- (void)test {
    int array[] = {2, 2, 1};
    int* ptr = array;
    NSArray* res = [self subsetsWithDup:ptr numsSize:3];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSArray *list = (NSArray *)obj;
        printf("[");
        [list enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            NSNumber *num = (NSNumber *)obj;
            printf("%d, ", [num intValue]);
        }];
        printf("]");
    }];
    
}

@end
