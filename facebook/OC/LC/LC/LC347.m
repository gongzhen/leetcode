//
//  LC347.m
//  LC
//
//  Created by ULS on 3/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC347.h"

@interface LC347()

- (NSArray *)topKFrequent:(int *)nums size:(int)size k:(int)k;

@end

@implementation LC347

- (NSArray *)topKFrequent:(int *)nums size:(int)size k:(int)k {
    if(size == 0) {
        return [NSArray array];
    }
    
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    for(int i = 0; i < size; i++) {
        if([map objectForKey:@(nums[i])] == NULL) {
            [map setObject:@(1) forKey:@(nums[i])];
        } else {
            NSNumber *freqNumber = [map objectForKey:@(nums[i])];
            int freq = [freqNumber intValue];
            [map setObject:@(freq + 1) forKey:@(nums[i])];
        }
    }
    
    NSMutableArray<NSMutableArray *> *bucket = [NSMutableArray arrayWithCapacity:size + 1];
    for(int i = 0; i < size + 1; i++) {
        bucket[i] = [NSMutableArray array];
    }
    /// Map key is nums[i] and value is frequence.
    [map enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull number, NSNumber * _Nonnull freq, BOOL * _Nonnull stop) {
        /// bucket index is frequence and value is nums[i]
        [[bucket objectAtIndex:[freq intValue]] addObject:number];
    }];
    
    [bucket enumerateObjectsUsingBlock:^(NSMutableArray * _Nonnull numbers, NSUInteger freq, BOOL * _Nonnull stop) {
        if(numbers.count == 0) {
            DLog(@"freq:%ld has no element.", freq);
        } else {
            DLog(@"freq:%ld", freq);
            [numbers enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull num, NSUInteger idx, BOOL * _Nonnull stop) {
                DLog(@"frequence:%d", [num intValue]);
            }];
            DLog(@"----------------------------------");
        }
    }];
    
    NSMutableArray *res = [NSMutableArray array];
    
    /// Largest frequence at end.
    for(long freq = bucket.count - 1; freq >= 0 && res.count < k; freq--) {
        if([bucket objectAtIndex:freq].count != 0) {
            [res addObjectsFromArray:[bucket objectAtIndex:freq]];
        }
    }
    return res;
}

- (void)test {
//    int num1[6] = {1,1,1,2,2,3};
//    NSArray *res = [self topKFrequent:num1 size:6 k:2];
//    [res enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull num, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"num:%d", [num intValue]);
//    }];
    
//    int num2[4] = {3, 0, 1, 0};
//    res = [self topKFrequent:num2 size:4 k:1];
//    [res enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull num, NSUInteger idx, BOOL * _Nonnull stop) {
//        DLog(@"num:%d", [num intValue]);
//    }];
    
    int num3[1] = {1};
    NSArray *res = [self topKFrequent:num3 size:1 k:1];
    [res enumerateObjectsUsingBlock:^(NSNumber *  _Nonnull num, NSUInteger idx, BOOL * _Nonnull stop) {
        DLog(@"num:%d", [num intValue]);
    }];
    
}

@end
