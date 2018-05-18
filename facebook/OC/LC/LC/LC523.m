//
//  LC523.m
//  LC
//
//  Created by Admin  on 2/28/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC523.h"

@interface LC523()

- (BOOL)checkSubarraySum:(int *)nums size:(int)size k:(int)k;
- (BOOL)checkSubarraySumBrutalForce:(int *)nums size:(int)size k:(int)k;

@end

@implementation LC523

- (BOOL)checkSubarraySumBrutalForce:(int *)nums size:(int)size k:(int)k {
    /// check size if less than 2
    if(size <= 1) {
        return false;
    }
    
    int sum = 0;
    for(int i = 0; i < size; i++) {
        sum = nums[i];
        for(int j = i + 1; j < size; j++) {
            sum += nums[i];
            if(sum ==0 && k == 0) {
                return YES;
            }
            if(k != 0 && sum % k == 0) {
                return YES;
            }
        }
        sum = 0;
    }
    return NO;
}

- (BOOL)checkSubarraySum:(int *)nums size:(int)size k:(int)k {
//    if(size <= 1) {
//        return false;
//    }
    
    /// (a + (n * x))% x is same as (a % x)
    /// https://leetcode.com/problems/continuous-subarray-sum/discuss/99499/Java-O(n)-time-O(k)-space
    ///  (1 + (2 * 6)) % 6 = 1
    ///  1 % 6 = 1
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    [map setObject:@(-1) forKey:@(0)];
    int sum = 0;
    for(int i = 0; i < size; i++) {
        sum += nums[i];
        DLog(@"nums[%d]:%d ==> sum:%d", i, nums[i], sum);
        
//        if(i >= 1 && sum == 0 && k == 0) {
//            return YES;
//        }
        if(k != 0) {
            sum = sum % k;
            DLog(@"sum:%d model k:%d", sum, k);
        }
        id obj = [map objectForKey:@(sum)];
        if(obj != NULL) {
            int index = [obj intValue];
            DLog(@"i:%d  index:%d", i, index);
            if(i - index > 1) {
                return true;
            }
        } else {
            [map setObject:@(i) forKey:@(sum)];
        }
        [map enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            DLog(@"key:%@ ==> value:%@", key, obj);
        }];
        DLog(@"------------------------------------------------------------------------------------");
    }
    return false;
}

- (void)test {
    int nums[] = {23, 2, 4, 6, 7};
    DLog(@"res:%d", [self checkSubarraySum:nums size:5 k:6]);
//    DLog(@"res:%d", [self checkSubarraySumBrutalForce:nums size:5 k:6]);
    
//    int nums[] = {0, 0};
//    DLog(@"res:%d", [self checkSubarraySum:nums size:2 k:0]);
//    DLog(@"res:%d", [self checkSubarraySumBrutalForce:nums size:2 k:0]);
}

@end
