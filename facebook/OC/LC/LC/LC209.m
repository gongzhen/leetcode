//
//  LC209.m
//  LC
//
//  Created by ULS on 3/2/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC209.h"

@interface LC209()

-(int)minSubArrayLen:(int *)nums size:(int)size s:(int)s;

@end

@implementation LC209
/**
 209. Minimum Size Subarray Sum
 Given an array of n positive integers and a positive integer s, find the minimal length of a contiguous subarray of which the sum ≥ s. If there isn't one, return 0 instead.
 
 For example, given the array [2,3,1,2,4,3] and s = 7,
 the subarray [4,3] has the minimal length under the problem constraint.
 
 */
- (int)minSubArrayLen:(int *)nums size:(int)size s:(int)s {
    if(size == 0) {
        return 0;
    }
    
    int sum = 0;
    int minLen = size;
    int j = 0;
    for(int i = 0; i < size; i++) {
        sum += nums[i];
        while(sum >= s) {
            if(i - j + 1 < minLen) {
                minLen = i - j + 1;
            }
            sum -= nums[j];
            j++;
        }
    }
    return minLen == size ? 0 : minLen;
}

- (void)test {
    int nums[6] = {2,3,1,2,4,3};
    DLog(@"res:%d",[self minSubArrayLen:nums size:6 s:7]);
}

@end
