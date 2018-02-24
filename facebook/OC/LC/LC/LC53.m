//
//  LC53.m
//  LC
//
//  Created by ULS on 2/23/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC53.h"

@interface LC53()

- (int)maxSubArray1:(int *)nums size:(int)size;
- (int)maxSubArray2:(int *)nums size:(int)size;

@end

@implementation LC53

- (int)maxSubArray2:(int *)nums size:(int)size {
    if(size == 0) {
        return 0;
    }
    int* dp = (int *)calloc(size, sizeof(int));
    dp[0] = nums[0];
    int max = nums[0];
    
    for(int i = 1; i < size; i++) {
        dp[i] = nums[i] + (dp[i - 1] > 0 ? dp[i - 1] : 0);
        DLog(@"dp[%d]:%d = nums[%d]:%d + (dp[%d]:%d > 0 ?)", i, dp[i], i, nums[i], (i - 1), dp[i-1]);
        max = MAX(max, dp[i]);
        DLog(@"max:%d, dp[%d]:%d", max, i, dp[i]);
        for(int i = 0; i < size; i++) {
            printf("\t\t%d, ", dp[i]);
        }
        printf("\n");
        DLog(@"--------------------------------------")
    }
    return max;
}

- (int)maxSubArray1:(int *)nums size:(int)size {
    if(size == 0) {
        return 0;
    }
    
    int max = nums[0];
    int sum = nums[0];
    for(int i = 1; i < size; i++) {
        if(sum < 0) {
            sum = nums[i];
            DLog(@"sum:%d", sum);
        } else {
            sum += nums[i];
            DLog(@"sum:%d", sum);
        }
        max = MAX(max, sum);
        DLog(@"max:%d", max);
        DLog(@"=================");
    }
    DLog(@"max:%d", max);
    return max;
}

- (void)test {
    int nums[9] = {-2,1,-3,4,-1,2,1,-5,4};
    
    // [self maxSubArray1:nums size:9];
    [self maxSubArray2:nums size:9];
}

@end
