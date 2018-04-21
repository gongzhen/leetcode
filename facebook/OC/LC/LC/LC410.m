//
//  LC410.m
//  LC
//
//  Created by Admin  on 4/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC410.h"

@implementation LC410

- (int)splitArray:(int* )nums size:(int)size m:(int)m {
    if(size == 0) {
        return 0;
    }
    
    int max = 0;
    NSUInteger sum = 0;
    /// step1: Find the max number from array nums
    /// Find the sum of array nums.
    /// The result will range between MAX and SUM.
    for(int i = 0; i < size; i++) {
        max = MAX(max, nums[i]);
        sum += nums[i];
    }
    if(m == 1) {
        return (int)sum;
    }
    
    /// The result will range between MAX and SUM.
    long left = max, right = sum;
    while(left <= right) {
        NSInteger mid = left + (right - left) / 2;
        if([self valid:mid nums:nums size:size m:m]) {
            right = mid - 1;
        } else {
            left = mid + 1;
        }
    }
    return (int)left;
}

- (BOOL)valid:(NSInteger)target nums:(int *)nums size:(int)size m:(int)m {
    int count = 1;
    NSInteger total = 0;
    for(int i = 0; i < size; i++) {
        total += nums[i];
        if(total > target) {
            total = nums[i];
            count++;
            if(count > m) {
                return NO;
            }
        }
    }
    return YES;
}

- (void)test {
    int nums[5] = {7,2,5,10,8};
    int res = [self splitArray:nums size:5 m:2];
    DLog(@"res:%d", res);
}
@end
