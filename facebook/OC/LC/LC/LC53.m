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
- (int)maxSubArrayDC:(int *)nums size:(int)size;

@end

@implementation LC53

/**
 53. Maximum Subarray
 Find the contiguous subarray within an array (containing at least one number) which has the largest
 sum.
 For example, given the array [-2,1,-3,4,-1,2,1,-5,4],
 the contiguous subarray [4,-1,2,1] has the largest sum = 6.
 
 */
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

- (int)maxSubArrayDC:(int *)nums size:(int)size {
    if(size == 0) { return 0; }
    return [self divide:nums left:0 right:size - 1];
}

- (int)divide:(int *)nums left:(int)left right:(int)right {
    if(right == left) {
        DLog(@"============ left:%d right:%d nums[left]:%d", left, right, nums[left]);
        return nums[left];
    }
    int middle = left + (right - left) / 2;
    int leftAns = [self divide:nums left:left right:middle];
    DLog(@"leftAns:%d left:%d middle:%d right:%d ",leftAns, left, middle, right);
    int rightAns = [self divide:nums left:middle + 1 right:right];
    DLog(@"rightAns:%d left:%d middle + 1:%d right:%d",rightAns, left, middle + 1, right);
    int leftMax = nums[middle];
    int rightMax = nums[middle + 1];
    DLog(@"leftMax:%d = nums[middle:%d] rightMax:%d = nums[middle + 1:%d]",leftMax, middle, rightMax, middle + 1);
    int temp = 0;
    for(int i = middle; i >= left; i--) {
        temp += nums[i];
        if(temp > leftMax) {
            leftMax = temp;
        }
        DLog(@"leftMax:%d temp:%d",leftMax, temp);
    }
    
    temp = 0;
    for(int i = middle + 1; i <= right; i++) {
        temp += nums[i];
        if(temp > rightMax) {
            rightMax = temp;
        }
        DLog(@"rightMax:%d temp:%d",rightMax, temp);
    }
    DLog(@"MAX(MAX(leftAns:%d, rightAns:%d):%d leftMax + rightMax:%d))============ %d",leftAns, rightAns, MAX(leftAns, rightAns), leftMax + rightMax, MAX(MAX(leftAns, rightAns), leftMax + rightMax));
    return MAX(MAX(leftAns, rightAns), leftMax + rightMax);
}

- (void)test {
    int nums[9] = {-2,1,-3,4,-1,2,1,-5,4};
    
    // [self maxSubArray1:nums size:9];
    // [self maxSubArray2:nums size:9];
    for(int i = 0; i < 9; i++) {
        printf("\t\t%d,", nums[i]);
    }
    printf("\n");
    DLog(@"res:%d", [self maxSubArrayDC:nums size:9]);
}

@end
