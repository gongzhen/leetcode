//
//  LC325.m
//  LC
//
//  Created by ULS on 2/12/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC325.h"

@interface LC325()

- (int)maxSubArrayLen:(int [])nums len:(int)len k:(int)k;

@end

@implementation LC325

- (int)maxSubArrayLen:(int [])nums len:(int)len k:(int)k {
    if(len == 0) {
        return 0;
    }
    int sum = 0;
    int maxLen = 0;
    NSMutableDictionary *map = [NSMutableDictionary dictionary];
    /// 1, -1, 5, -2, 3
    for(int i = 0; i < len; i++) {
        sum += nums[i];
        if(sum == k) { ///1, -1, 5, -2 == 3
            maxLen = i + 1; /// maxLen = 3 + 1 = 4.
        } else if (![map objectForKey:@(sum - k)]) {
            /// sum = 1, 0, 5
            /// sum - k = -2, -3, 2
            maxLen = MAX(maxLen, i - (int)[[map objectForKey:@(sum - k)] integerValue]);
        }
        if(![map objectForKey:@(sum)]) {
            /// sum: 1, 0, 5
            /// map: 1 => 0, 0 => 1, 5 => 2
            [map setObject:@(i) forKey:@(sum)];
        }
    }
    return maxLen;
}

- (void)test {
    int nums[5] = {1, -1, 5, -2, 3};
    size_t len = sizeof(nums) / sizeof(nums[0]);
    DLog(@"res:%d", [self maxSubArrayLen:nums len:(int)len k:3]);
}

@end
