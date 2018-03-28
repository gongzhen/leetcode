//
//  LC658.m
//  LC
//
//  Created by Admin  on 3/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC658.h"

@interface LC658()

- (NSArray *)findClosestElements:(int *)arr size:(int)size k:(int)k x:(int)x;
- (NSArray *)findClosestElements_1:(int *)arr size:(int)size k:(int)k x:(int)x;

@end

@implementation LC658

- (NSArray *)findClosestElements_1:(int *)arr size:(int)size k:(int)k x:(int)x {
    if(size == 0) {
        return [NSArray array];
    }
    
    int i = 0;
    int j = size - k;
    
    while(i < j) {
        int mid = i + (j - i) / 2;
        if((x - arr[mid]) > (arr[mid + k] - x)) {
            i = mid + 1;
        } else {
            j = mid;
        }
    }
    
    NSMutableArray* res = [NSMutableArray array];
    for(int l = i; l < i + k; l++) {
        [res addObject:@(arr[l])];
    }
    return res;
}

- (NSArray *)findClosestElements:(int *)arr size:(int)size k:(int)k x:(int)x {
    if(size == 0) {
        return [NSArray array];
    }
    NSMutableArray* res = [NSMutableArray array];
    for(int i = 0; i < size; i++) {
        [res addObject:@(arr[i])];
    }
    /// 1, 2, 3, 4, 5
    /// k = 4, x = -1;
    
    while(res.count > k) {
        int i = 0;
        int j = (int)res.count - 1;
        int first = [res[i] intValue];
        int last = [res[j] intValue];
        if((x - first) <= (last - x)) {
            [res removeLastObject];
        } else {
            [res removeObjectAtIndex:i];
        }
    }
    return res;
}

- (void)test {
    int nums[5] = {1, 2, 3, 4, 5};
    int* ptr = nums;
    NSArray *res = [self findClosestElements_1:ptr size:5 k:4 x:-1];
    [res enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        int num = [obj intValue];
        printf("%d, ", num);
    }];
    printf("\n");
}
@end
