//
//  LC410.m
//  LC
//
//  Created by Admin  on 4/20/18.
//  Copyright © 2018 ULS. All rights reserved.
//

#import "LC410.h"
#import "QuickSort.h"

@implementation LC410

- (int)splitArray_1:(int* )nums size:(int)size m:(int)m {
    if(size == 0) {
        return 0;
    }
    int* sums = (int *)calloc(size + 1, sizeof(int));
    int** dp = (int **)malloc((m + 1) * sizeof(int *));
    for(int i = 0; i < m + 1; i++) {
        dp[i] = (int *)malloc((size + 1) * sizeof(int));
    }
    
    for(int i = 0; i < m + 1; i++) {
        for(int j = 0; j < size + 1; j++) {
            dp[i][j] = 100000000;
        }
    }
    dp[0][0] = 0;
    [QuickSort printIntArray:sums size:size + 1];
    for(int i = 1; i <= size; ++i) {
        sums[i] = sums[i - 1] + nums[i - 1];
    }
    
    for(int i = 1; i <= m; ++i) {
        for(int j = 1; j <= size; ++j) {
            for(int k = i - 1; k < j; ++k) {
                int val = MAX(dp[i - 1][k], sums[j] - sums[k]);
                dp[i][j] = MIN(dp[i][j], val);
            }
        }
    }
    [QuickSort printIntMatrix:dp row:m + 1 col:size + 1];
    int res = dp[m][size];
    for(int i = 0; i < m + 1; i++) {
        free(dp[i]);
    }
    free(dp);
    free(sums);
    return res;
}

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
    int res = [self splitArray:nums size:5 m:2]; /// res = 18
    int res2 = [self splitArray_1:nums size:5 m:2]; /// res = 18
    DLog(@"res:%d", res);
    DLog(@"res2:%d", res2);
}
@end
